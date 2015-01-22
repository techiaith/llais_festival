(define (welsh_token_to_words token name)
  
  ; we need a function that
  ; we can call recursively with individual words
  ; should we need to - so this just acts as a wrapper
  ; around that

  (welsh_tokenise_word name)
)

(define (welsh_tokenise_word name)
 
  ; these are required to detect quote marks
  ; at the beginning and the end of words
  (set! strlen (string-length name))
  (set! firstlett (substring name 0 1))
  (set! lastlett (substring name (- strlen 1) 1))
  (set! dcname (downcase name))

  ; strip quote or double quote from beginning
  ; or end of word (don't do it from the middle 
  ; because then we might lose apostrophes)
  (if (or (string-matches firstlett "'\\|\"") (string-matches lastlett "'\\|\""))
    (set! dcname (welsh_strip_punctuation dcname)))
  ; the regexp below matches:
  ; left or right square bracket
  ; left or right standard bracket
  ; exclamation or question mark
  ; colon or semicolon 
  (if (string-matches name ".*\\[\\|\\]\\|\(\\|\)\\|\\!\\|\\?\\|;.*")
    (set! dcname (welsh_strip_punctuation dcname)))
 
  (cond

    ; most of the expressions that follow match an optional
    ; full stop at their end (i.e. '\.?'). This is because we've
    ; substituted an end-word ? or ! with . within welsh_strip_punctuation.
    ; If this is changed at a later point, modify the expressions
    ; below accordingly.

    ((string-equal dcname "-")
      (list "-"))
    ((string-equal dcname "&")
      (list "a")) ; needs refining for the cases that a vowel follows it
    ((string-equal dcname "&c")
      (list "ac")) ; needs refining for the cases that a vowel follows it

    ((string-matches dcname "[0-9]+\\(ed\\|ain\\|ydd\\|af\\|ail\\|il\\|fed\\|eg\\)\.?")
      (welsh_ordinal dcname))
    ((string-matches dcname "\\([0-9]+\\,\\)?\\([0-9]+\\,\\)?[0-9]+\\(\\.[0-9]+\\)?\\%\.?")
      (welsh_percentage dcname))
    ((string-matches dcname "\\([0-9]+\\,\\)?\\([0-9]+\\,\\)?[0-9]+\\(\\.[0-9]+\\)?\\(gb\\|mb\\|kb\\)\.?")
      (welsh_filesize dcname))
    ((string-matches dcname "\\([0-9]+\\,\\)?\\([0-9]+\\,\\)?[0-9]+\\(\\.[0-9]+\\)?\.?")
      ; deal with numbers 
      (welsh_number dcname))
    ((string-matches dcname ".*@.*")
      (welsh_email_address dcname))
    ((string-matches dcname "[0-2]?[0-9]:[0-5][0-9]\.?")
      (welsh_parse_time dcname))
    ((string-matches dcname "[0-1]?[0-9][:\\.][0-5][0-9]\\(am\\|pm\\)\.?")
      (welsh_parse_time_12h dcname))
    ((or (string-matches dcname "http://.*") (string-matches dcname ".*\\..*"))
      (welsh_http_url dcname))
    ((string-matches dcname "\\(£\\|pt\\)[0-9]*\\.[0-9][0-9]\.?")
      (welsh_currency_pounds_and_pence dcname))
;    ((string-matches dcname "\\(£\\|pt\\)[0-9]*\.?")
;      (welsh_currency_pounds dcname))
    ((string-matches dcname "\\(£\\|pt\\)\\([0-9]+\\,\\)?[0-9]+\.?")
      (welsh_currency_pounds dcname))
    ((string-matches dcname "\\(ctrl\\+\\|control\\+\\|alt\\+\\|shift\\+\\)[a-z]\.?")
      (keyboard_modifier dcname))
    ((string-matches dcname "\\$[0-9]*\\.[0-9][0-9]\.?")
      (welsh_currency_dollars_and_cents dcname))
    ((string-matches dcname "\\$[0-9]*\.?")
      (welsh_currency_dollars dcname))
    ((string-matches name "[A-Z][A-Z]+")
      (welsh_acronym name))
    ((and (string-matches dcname ".*[0-9].*") (string-matches dcname ".*[a-z].*"))
      (welsh_mixed_letters_numbers dcname))
    ((string-matches dcname ".*/.*")
      (welsh_multiple_words dcname))
    (t  ;; when no specific rules apply do the general ones
      (list dcname))
  )

)

(define (welsh_strip_punctuation name)

  ; strip quotes from the beginning or end of
  ; the word, and question/exclamation marks
  ; from anywhere in the word

  ; this should be called from the main welsh_token_to_words
  ; loop, as it expects firstlett, lastlett and strlen to be set

  (set! output "")
  (set! n 0)
  
  (while (< n strlen)
    (cond
      ((equal? n 0)
        (if (not (string-matches firstlett "\\[\\|\\]\\|\(\\|\)\\|'\\|\"")) 
          (set! output (string-append output firstlett))))
      ((equal? n (- strlen 1))
        (cond
;          ((string-matches lastlett "\\?\\|\\!")
;            (set! output (string-append output ".")))
          ; currently we replace ! and ? at the end of a word
          ; with a full stop (for the end of a sentence).
          ; If, later, we want to just strip them, include
          ; them within the massive regexp below.
          ((not (string-matches lastlett "\\[\\|\\]\\|\(\\|\)\\|'\\|\"\\|;\\|?\\|\\!"))
            (set! output (string-append output lastlett)))
        )
      )
      (t
        (set! lett (substring name n 1))
        (if (not (string-matches lett "\\[\\|\\]\\|\(\\|\)\\|;\\|:"))
          (set! output (string-append output lett)))
      )
    )

    (set! n (+ 1 n))
  )

  ; need to check whether last character of output is now a single
  ; or double quote or punctuation, and if it is truncate output

  (set! lastlett_output (substring output (- (string-length output) 1) 1 ))

  (if (string-matches lastlett_output "\\[\\|\\]\\|\(\\|\)\\|\\?\\|\\!\\|;\\|:\\|'\\|\"")
    (set! output (substring output 0 (- (string-length output) 1)) ))

  ; Put a full stop at the end of the word
  ; if we had detected ! or ? as the last character previously.
  ; Bit of a hack as we would have removed ! or ? from the end
  ; of the word in the previous step...

;  (if (string-matches lastlett_output "\\?\\|\\!")
;    (set! output (string-append output "."))
    (set! output output)
)  
  
; I can't believe this doesn't exist in Festival Scheme
; already, but I couldn't find a pre-existing function, so...
(define (div div_list)
  (set! a (car div_list))
  (set! b (cadr div_list))
  (/ (- a (% a b)) b)
)

(define (welsh_multiple_words name)

  (set! word (string-before name "/"))
  (set! output (welsh_tokenise_word word))
  (set! name (string-after name "/"))

  (while (string-matches name ".*/.*") ; just in case we have more than one
                                       ; separator character in the word
    (set! word (string-before name "/"))
    (set! output (append output (welsh_tokenise_word word)))
    (set! name (string-after name "/"))
  )

  (append output (welsh_tokenise_word name))
)

(define (welsh_acronym name)

  ; this function only disambiguates those
  ; acronyms that, in lower case, should be pronounced as words
  ; (many more acronyms are in the lexicon, denoted by 'acronym'
  ; in their pos field)

  (set! acronym_pronunciations
  '(("AC" "cy") ; Aelod Cynulliad
     ("AEM" "cy") ; Arolygaeth ei Mawrhydi
     ("AF" "en") ; Across the flats
     ("AG" "cy") ; Asid Giberelig
     ("AI" "en") ; Artificial Intelligence
     ("AID" "cy") ; Awdurdod Iechyd Dosbarth
     ("ALU" "en") ; Arithmetic-Logic Unit
     ("AM" "en") ; Amplitude Modulation/Assembly Member
     ("ATO" "en") ; Accredited Training Organisation
     ("ASE" "cy") ; Aelod Seneddol Ewropeaidd
     ("CAE" "en") ; Computer Aided Education
     ("CAPM" "en") ; Computer Aided Production Management
     ("CAST" "en") ; Complete Action Service Teams
     ("CBD" "cy") ; Canol Busnes y Dref
     ("CBSW" "cy") ; Cyngor Bwrdeistref Sir Wrecsam
     ("CDT" "cy") ; Crefft, Dylunio, Technoleg
     ("CU" "cy") ; Cerrynt Union
     ("CYF" "cy") ; Cylchdroeon y Funud
     ("DAT" "en") ; Dementia of the Alzheimer Type
     ("DOS" "doss") ; Disk Operating System 
     ("DRAM" "diiram") ; Dynamic Random Access Memory
     ("DU" "cy") ; Y Deyrnas Unedig
     ("EU" "en") ; European Union
     ("GA" "en") ; Gibberelic Acid
     ("GIG" "cy") ; Gwasanaeth Iechyd Gwladol
     ("ISA" "yisa") ; Individual Savings Account
     ("IT" "en") ; Information Technology
     ("MC" "cy") ; Mesur Cyffredin
     ("MIB" "en") ; Merchandise in Baggage
     ("NI" "en") ; National Insurance
     ("PERT" "pyyt") ; Programme Evaluation and Review Technique 
     ("PO" "en") ; Post Office
     ("TA" "cy") ; Tystysgrif Addysg
     ("TU" "cy") ; Teyrnas Unedig
     ("UD" "cy") ; Unol Daleithiau
     ("UDA" "cy"))) ; Unol Daleithiau'r Amerig

  (set! pronunciation (cadr (assoc_string name acronym_pronunciations)))

  (cond
    ((< (length pronunciation) 2)
      (list (downcase name)))
    ((string-matches pronunciation "cy")
      (spelt_letters (list (downcase name) "_cy")))
    ((string-matches pronunciation "en")
      (spelt_letters (list (downcase name) "_en")))
    (t
      (list pronunciation)))
)

(define (welsh_email_address name)
  (if (string-matches name "<.*>")
    (set! name (substring (name 1 (- (length name) 2)))))

  (set! out (welsh_undot_token (string-before name "@")))
  (set! out (append out (list "at")))
  (set! out (append out (welsh_undot_token (string-after name "@")))) 
)

(define (welsh_undot_token name)

  (set! orig name)

  (set! output_set 0)

  (while (string-matches orig ".*\\..*")
    (set! str-before (string-before orig "."))
    (set! len-str-before (length str-before))
    (set! len-name (length orig))
    (if (equal? output_set 1)
      (set! output (append output (list (string-before orig ".") "dot")))
      (set! output (list (string-before orig ".") "dot")))
    (set! output_set 1)
    (set! orig (substring orig (+ 1 len-str-before) (- len-name (+ 1 len-str-before))))
  )

  (if (equal? output_set 1)
    (set! output (append output (list orig)))
    (set! output (list orig)))
  
)

(define (welsh_http_url name)
;  (set! http_set 0)

  (if (string-matches name "http://.*")
    (set! name (substring name 7 (- (length name) 7))))

;  (if (equal? http_set 1)
;    (set! outurl (append outurl (welsh_undot_token name)))
    (set! outurl (welsh_undot_token name))
)

(define (welsh_mixed_letters_numbers name)
  (set! len (string-length name))

  (set! lett (substring name 0 1))

  (if (string-matches lett "[0-9]")
    (set! lett_output (welsh_digit_string lett))
    (set! lett_output (list (string-append lett "_cy"))))

  (set! n 1)

  (while (< n len)
    (set! lett (substring name n 1))
    (if (string-matches lett "[0-9]")
      (set! lett_output (append lett_output (welsh_digit_string lett)))
    (set! lett_output (append lett_output (list (string-append lett "_cy")))))
    (set! n (+ 1 n))
  )

  (set! lett_output lett_output)
)


(define (spelt_letters lett-list)
  (set! word (car lett-list))
  (set! lang (cadr lett-list))

  (set! len (string-length word))
   
  (set! lett_output (list (string-append (substring word 0 1) lang)))
  (set! n 1)

  (while (< n len)
    (set! lett_output (append lett_output (list (string-append (substring word n 1) lang))))
    (set! n (+ n 1))
  )

  (set! lett_output lett_output)
)

(define (keyboard_modifier name)

  (set! modifier (string-before name "+"))
  (set! alphakey (downcase (string-after name "+")))


  (cond
    ((string-matches modifier "shift")
      (set! mod-string (list "shift")))
    ((string-matches modifier "alt")
      (set! mod-string (list "alt")))
    (t
      (set! mod-string (list "control")))
  )

  ; only take the first character after the modifier
  (append mod-string (list (string-append (substring alphakey 0 1) "_en")))
)

(define (welsh_pounds pounds)
  (cond
    ((or (equal? pounds 1) (equal? pounds 2))
      (set! punt-string (list "bunt")))
    ((equal? pounds 6)
      (set! punt-string (list "phunt")))
    ((or (equal? (% pounds 1000) 0) (equal? (% pounds 1000000) 0))
      (set! punt-string (list "o" "bunnoedd")))
    (t
      (set! punt-string (list "punt")))
  )
  
  (append (currency_integer pounds) punt-string)
)

(define (welsh_pence pence)
  (cond
    ((or (equal? pence 1) (equal? pence 2))
      (set! ceiniog-string (list "geiniog")))
    ((equal? pence 6)
      (set! ceiniog-string (list "cheiniog")))
    (t
      (set! ceiniog-string (list "ceiniog")))
  )

  (append (currency_integer pence) ceiniog-string)
)

(define (welsh_currency_pounds name)

   (if (string-matches name "pt.*")
     (set! pounds-string (string-after name "pt"))
     (set! pounds-string (string-after name "£")))

   (set! pounds (parse-number (welsh_remove_commas pounds-string)))

   (welsh_pounds pounds)
)

(define (welsh_currency_pounds_and_pence name)

   (if (string-matches name "pt.*")
     (set! currency-string (string-after name "pt"))
     (set! currency-string (string-after name "£")))

   (format t "%s\n" currency-string)

   (set! pounds-string (string-before currency-string "."))
   (set! pence-string (string-after currency-string "."))
   (set! pounds (parse-number pounds-string))
   (set! pence (parse-number pence-string))

   (cond
     ((equal? pence 0)
       (welsh_pounds pounds))
     (t
       (append (welsh_pounds pounds) (welsh_pence pence)))
   )
)

(define (welsh_currency_dollars name)
   (set! dollars-string (string-after name "$"))
   (set! dollars (parse-number dollars-string))

   (welsh_dollars dollars)
)

(define (welsh_dollars dollars)
  (cond
    ((equal? dollars 2)
      (set! doler-string (list "ddoler")))
    ((or (equal? (% dollars 1000) 0) (equal? (% dollars 1000000) 0))
      (set! doler-string (list "o" "ddoleri")))
    (t
      (set! doler-string (list "doler")))
  )
  
  (append (currency_integer dollars) doler-string)
)

(define (welsh_cents cents)
  (append (welsh_base10_masculine_number_from_integer cents) (list "sent"))
)

(define (welsh_currency_dollars_and_cents name)
   (set! currency-string (string-after name "$"))
   (set! dollars-string (string-before currency-string "."))
   (set! cent-string (string-after currency-string "."))
   (set! dollars (parse-number dollars-string))
   (set! cents (parse-number cent-string))

   (cond
     ((equal? cents 0)
       (welsh_dollars dollars))
     (t
       (append (welsh_dollars dollars) (welsh_cents cents)))
   )
)

(define (currency_integer n)
  (cond
    ((equal? n 5) (list "pum"))
    ((equal? n 6) (list "chwe"))
    (t
      (welsh_base10_feminine_number_from_integer n))
  )
)

(define (welsh_remove_commas input_name)
  (set! output (substring input_name 0 1))
  (set! input_len (length input_name))

  (set! n 1)

  (while (< n input_len)
    (set! letter (substring input_name n 1))
    (if (not (string-matches letter ","))
      (set! output (string-append output letter)))
    (set! n (+ 1 n))
  )

  (set! output output)
)

(define (welsh_number name)
  (set! name (welsh_remove_commas name))
  (set! n (parse-number name))
  (cond
    ((>= n 1000000000) (welsh_digit_string name))
    ((equal? name "0") (list "dim"))
    (t (welsh_decimals name))
  )
)

(define (welsh_percentage name)
  (set! percentage_str (string-before name "%"))
  (append (welsh_number percentage_str) (list "y" "cant"))
)

(define (welsh_decimals name)
  (cond
    ((string-matches name "[0-9]+\\.[0-9]+")
       (set! integer_str (string-before name "."))
       (set! decimal (string-after name "."))
       (set! integer (parse-number integer_str))
       (append (welsh_base10_generic_number_from_integer integer) (list "pwynt") (welsh_digit_string decimal))
  )
    (t
       (set! n (parse-number name))
       (append (welsh_base10_generic_number_from_integer n)))
  )
)
  

(define (welsh_digit_string name)

  (set! welsh_digit_names
  '((0 "dim")
     (1 "un")
     (2 "dau")
     (3 "tri")
     (4 "pedwar")
     (5 "pump")
     (6 "chwech")
     (7 "saith")
     (8 "wyth")
     (9 "naw")
     ("." "pwynt")))

     (mapcar
       (lambda (d)
       (car (cdr (assoc_string d welsh_digit_names))))
     (symbolexplode name))
)

(define (welsh_filesize name)
   (cond
     ((string-matches name ".*kb")
        (set! name (string-before name "kb"))
        (set! bytes "cilobeit"))
     ((string-matches name ".*mb")
        (set! name (string-before name "mb"))
        (set! bytes "megabeit"))
     ((string-matches name ".*gb")
        (set! name (string-before name "gb"))
        (set! bytes "gigabeit"))
   )
   (append (welsh_number name) (list bytes))
)


(define (welsh_parse_time_12h name)

   (cond
     ((string-matches name ".*pm")
        (set! name (string-before name "pm"))
        (set! pm 1))
     (t
        (set! name (string-before name "am"))
        (set! pm 0))
   )

;   (set! hours (string-before name ":"))
;   (set! minutes (string-after name ":"))

;   (if (string-matches name ".*\\..*")
;     (
;     (format t "%s%s" "dots" "\n")
     (set! hours (substring name 0 (- (length name) 3)))
     (set! minutes (substring name (- (length name) 2) 2))
;     )
;   )

   (set! h (parse-number hours))
   (set! m (parse-number minutes))

   (set! time_of_day (list "y" "bore"))

   (if (equal? pm 1)
     (cond
       ((and (> h 5) (not (equal? h 12)))
         (set! time_of_day (list "y" "nos")))
       (t
         (set! time_of_day (list "y" "prynhawn")))
     )
   )
 
   (append (welsh_time (list h m)) time_of_day)
)

(define (welsh_parse_time name)
   (set! hours (string-before name ":"))
   (set! minutes (string-after name ":"))
   (set! h (parse-number hours))
   (set! m (parse-number minutes))
   (cond
     ((> h 17)
       (append (welsh_time (list (- h 12) m)) (list "y" "nos")))
     ((> h 12)
       (append (welsh_time (list (- h 12) m)) (list "y" "prynhawn")))
     (t
       (welsh_time (list h m)))
   )
)

(define (welsh_time time)
   (set! h (car time))
   (set! m (car (cdr time)))
   (cond
     ((equal? m 0)
     (append (welsh_base20_number_from_integer h) (list "o'r" "gloch")))
     ((<= m 30)
     (append (welsh_number_of_minutes m) (list "wedi") (welsh_base20_number_from_integer h)))
     ((> m 30)
       (set! h1 (+ 1 h))
       (cond ((equal? h 12) (set! h1 1)))
       (append (welsh_number_of_minutes m) (list "i") (welsh_hours h1)))
   )
) 

(define (welsh_hours n)
; vigesimal numbers with a soft mutation
; we really need a separate function to apply a soft mutation to a list/name,
; but this is a quick fix
  (cond
    ((equal? n 1) (list "un"))
    ((equal? n 2) (list "ddau"))
    ((equal? n 3) (list "dri"))
    ((equal? n 4) (list "bedwar"))
    ((equal? n 5) (list "bump"))
    ((equal? n 6) (list "chwech"))
    ((equal? n 7) (list "saith"))
    ((equal? n 8) (list "wyth"))
    ((equal? n 9) (list "naw"))
    ((equal? n 10) (list "ddeg"))
    ((equal? n 11) (list "un" "ar" "ddeg"))
    ((equal? n 12) (list "ddeuddeg"))
  )
)

(define (welsh_millions_from_integer n)

  (set! m (div (list n 1000000))) ; millions part
  (set! hm (div (list m 100)))    ; hundreds of millions part
  (set! tm (% m 100)) 

  (cond
    ((<= m 6)
      (welsh_low_millions m))
    ; do we have a round number of hundred thousands?
    ; if so, need to mutate...
    ((equal? tm 0)
      (append (welsh_hundred_thousands_or_millions hm) (list "miliwn")))
    ; catch the situations when we have hundred thousands plus
    ; a low number of thousands 
    ((and (>= tm 1) (<= tm 6))
      (welsh_low_millions_with_hundreds m))
    (t
      (append (welsh_base10_feminine_number_from_integer m) (list "miliwn")))
  )
)

(define (welsh_low_millions n)
  (cond
    ((equal? n 1) (list "un" "filiwn"))
    ((equal? n 2) (list "dwy" "filiwn"))
    ((equal? n 3) (list "tair" "miliwn"))
    ((equal? n 4) (list "pedair" "miliwn"))
    ((equal? n 5) (list "pum" "miliwn"))
    ((equal? n 6) (list "chwe" "miliwn"))
  )
)

(define (welsh_low_millions_with_hundreds n)
  (set! thousands (welsh_hundreds_from_integer n))

  ; get millions part
  (set! m (% n 100))
  (cond 
    ((equal? m 1) (append thousands (list "ag" "un" "filiwn")))
    ((equal? m 2) (append thousands (list "a" "dwy" "filiwn")))
    ((equal? m 3) (append thousands (list "a" "thair" "miliwn")))
    ((equal? m 4) (append thousands (list "a" "phedair" "miliwn")))
    ((equal? m 5) (append thousands (list "a" "phum" "miliwn")))
    ((equal? m 6) (append thousands (list "a" "chwe" "miliwn")))
  )
)

(define (welsh_thousands_from_integer n)

  (set! t (div (list n 1000))) ; thousands part
  (set! ht (div (list t 100))) ; hundreds of thousands part
  (set! tm (% t 100)) 

  (cond
    ((<= t 6)
      (welsh_low_thousands t))
    ; do we have a round number of hundred thousands?
    ; if so, need to mutate...
    ((equal? tm 0)
      (append (welsh_hundred_thousands_or_millions ht) (list "mil")))
    ; catch the situations when we have hundred thousands plus
    ; a low number of thousands 
    ((and (>= tm 1) (<= tm 6))
      (welsh_low_thousands_with_hundreds t))
    (t
      (append (welsh_base10_feminine_number_from_integer t) (list "mil")))
  )
)

(define (welsh_low_thousands n)
  (cond
    ((equal? n 1) (list "un" "fil"))
    ((equal? n 2) (list "dwy" "fil"))
    ((equal? n 3) (list "tair" "mil"))
    ((equal? n 4) (list "pedair" "mil"))
    ((equal? n 5) (list "pum" "mil"))
    ((equal? n 6) (list "chwe" "mil"))
  )
)

(define (welsh_low_thousands_with_hundreds n)
  (set! thousands (welsh_hundreds_from_integer n))

  ; get thousands part
  (set! t (% n 100))
  (cond 
    ((equal? t 1) (append thousands (list "ag" "un" "fil")))
    ((equal? t 2) (append thousands (list "a" "dwy" "fil")))
    ((equal? t 3) (append thousands (list "a" "thair" "mil")))
    ((equal? t 4) (append thousands (list "a" "phedair" "mil")))
    ((equal? t 5) (append thousands (list "a" "phum" "mil")))
    ((equal? t 6) (append thousands (list "a" "chwe" "mil")))
  )
)

(define (welsh_hundred_thousands_or_millions n)
; pass this function the number of hundred thousands
  (cond
    ((equal? n 1) (list "can"))
    ((equal? n 2) (list "dau" "gan"))
    ((equal? n 3) (list "tri" "chan"))
    ((equal? n 4) (list "pedwar" "can"))
    ((equal? n 5) (list "pum" "can"))
    ((equal? n 6) (list "chwe" "chan"))
    ((equal? n 7) (list "saith" "can"))
    ((equal? n 8) (list "wyth" "can"))
    ((equal? n 9) (list "naw" "can"))
  )
)

(define (welsh_hundreds_from_integer n)
  (set! h (div (list n 100))) ; hundreds part
  (set! t (% n 100)) ; tens part
  (cond
    ((equal? h 0) (set! hundreds '()))
    ((equal? h 1) (set! hundreds (list "cant")))
    ((equal? h 2) (set! hundreds (list "dau" "gant")))
    ((equal? h 3) (set! hundreds (list "tri" "chant")))
    ((equal? h 4) (set! hundreds (list "pedwar" "cant")))
    ((equal? h 5) (set! hundreds (list "pum" "cant")))
    ((equal? h 6) (set! hundreds (list "chwe" "chant")))
    ((equal? h 7) (set! hundreds (list "saith" "cant")))
    ((equal? h 8) (set! hundreds (list "wyth" "cant")))
    ((equal? h 9) (set! hundreds (list "naw" "cant")))
  )
  (cond
    ((or (equal? t 1) (equal? t 8))
      (append hundreds (list "ac")))
    ((and (>= t 2) (<= t 10))
      (append hundreds (list "a")))
    (t
      (append hundreds))
  )
)

(define (welsh_ordinal name)
  (welsh_ordinal_from_integer (parse-number name))
)

(define (welsh_ordinal_from_integer n)
  (cond
    ((equal? n 100) (list "canfed"))
    ((equal? n 1000) (list "milfed"))
    ((equal? n 1000000) (list "miliynfed"))
    ((equal? n 50) (list "hanner" "canfed"))
    ((equal? n 1) (list "cyntaf"))
    ((equal? n 2) (list "ail"))
    ((equal? n 3) (list "trydydd"))
    ((equal? n 4) (list "pedwerydd"))
    ((equal? n 5) (list "pumed"))
    ((equal? n 6) (list "chweched"))
    ((equal? n 7) (list "seithfed"))
    ((equal? n 8) (list "wythfed"))
    ((equal? n 9) (list "nawfed"))
    ((equal? n 10) (list "degfed"))
    ((equal? n 11) (list "unfed" "ar" "ddeg"))
    ((equal? n 12) (list "deuddegfed"))
    ((equal? n 15) (list "pymthegfed"))
    ((equal? n 16) (list "unfed" "ar" "bymtheg"))
    ((equal? n 17) (list "ail" "ar" "bymtheg"))
    ((equal? n 18) (list "deunawfed"))
    ((equal? n 19) (list "pedwerydd" "ar" "bymtheg"))
    ((equal? n 20) (list "ugeinfed"))
    ((equal? n 21) (list "unfed" "ar" "hugain"))
    ((equal? n 40) (list "deugeinfed"))
    ((equal? n 60) (list "trigeinfed"))
    ((equal? n 80) (list "pedwar" "ugeinfed"))

    ((and (<= n 19) (>= n 10))
      (append (welsh_ordinal_from_integer(- n 10)) (list "ar" "ddeg")))

    ((and (<= n 39) (>= n 20))
      (append (welsh_ordinal_from_integer(- n 20)) (list "ar" "hugain")))

    ((and (<= n 59) (>= n 40))
      (append (welsh_ordinal_from_integer(- n 40)) (list "a" "deugain")))

    ((and (<= n 79) (>= n 60))
      (append (welsh_ordinal_from_integer(- n 60)) (list "a" "thrigain")))

    ((and (<= n 99) (>= n 80))
      (append (welsh_ordinal_from_integer(- n 80)) (list "a" "phedwar" "ugain")))

    (t
      (append (list "rhif") (welsh_base10_generic_number_from_integer n)))

  )

)

(define (welsh_base10_masculine_number_from_integer n)
  (set! two-string (list "dau"))
  (set! three-string (list "tri"))
  (set! four-string (list "pedwar"))
  (welsh_base10_number_from_integer n)
)

(define (welsh_base10_feminine_number_from_integer n)
  (set! two-string (list "dwy"))
  (set! three-string (list "tair"))
  (set! four-string (list "pedair"))
  (welsh_base10_number_from_integer n)
)

(define (welsh_base10_generic_number_from_integer n)
  (set! two-string (list "dwyau"))
  (set! three-string (list "triair"))
  (set! four-string (list "pedwarair"))
  (welsh_base10_number_from_integer n)
)

(define (welsh_base10_number_from_integer n)
; this function assumes that we have digit input
; it should not be called directly, but rather calls made
; to the three functions above, which set the forms of 'dau/dwy',
; 'tri/tair' and 'pedwar/pedair' required
  (cond

    ; if it's over 1 billion (1 thousand million), treat it as 
    ; a digit string

    ((equal? n 1) (list "un"))
    ((equal? n 2) (set! return two-string))
    ((equal? n 3) (set! return three-string))
    ((equal? n 4) (set! return four-string))
    ((equal? n 5) (list "pump"))
    ((equal? n 6) (list "chwech"))
    ((equal? n 7) (list "saith"))
    ((equal? n 8) (list "wyth"))
    ((equal? n 9) (list "naw"))
    ((equal? n 10) (list "deg"))

    ((and (<= n 19) (>= n 11))
      (append (list "un" "deg") (welsh_base10_number_from_integer(- n 10))))

    ((and (<= n 29) (>= n 20))
      (append (list "dau" "ddeg") (welsh_base10_number_from_integer(- n 20))))

    ((and (<= n 39) (>= n 30))
      (append (list "tri" "deg") (welsh_base10_number_from_integer(- n 30))))

    ((and (<= n 49) (>= n 40))
      (append (list "pedwar" "deg") (welsh_base10_number_from_integer(- n 40))))

    ((and (<= n 59) (>= n 50))
      (append (list "pum" "deg") (welsh_base10_number_from_integer(- n 50))))

    ((and (<= n 69) (>= n 60))
      (append (list "chwe" "deg") (welsh_base10_number_from_integer(- n 60))))

    ((and (<= n 79) (>= n 70))
      (append (list "saith" "deg") (welsh_base10_number_from_integer(- n 70))))

    ((and (<= n 89) (>= n 80))
      (append (list "wyth" "deg") (welsh_base10_number_from_integer(- n 80))))

    ((and (<= n 99) (>= n 90))
      (append (list "naw" "deg") (welsh_base10_number_from_integer(- n 90))))

    ((and (<= n 999) (>= n 100))
      ; special cases here for '...cant a thri', '...cant a phedwar'
      ; '...cant a phump'
      (set! u (% n 100)) ; so get the units
      (cond
        ((equal? u 3) (append (welsh_hundreds_from_integer n) (list "a" "thri")))
        ((equal? u 4) (append (welsh_hundreds_from_integer n) (list "a" "phedwar")))
        ((equal? u 5) (append (welsh_hundreds_from_integer n) (list "a" "phump")))
        (t
         (append (welsh_hundreds_from_integer n) (welsh_base10_number_from_integer(% n 100))))
      )
    )

    ((and (<= n 999999) (>= n 1000))
      ; special cases here for '...mil ac un', '...mil a dau'
      ; etc.
      (set! u (% n 1000)) ; get the units
      (cond
        ((equal? u 100) (append (welsh_thousands_from_integer n) (list "a" "chant")))
        ((equal? u 0) (append (welsh_thousands_from_integer n)))
        ; get to the general case as quickly as possible
        ((> u 10) (append (welsh_thousands_from_integer n) (welsh_base10_generic_number_from_integer (% n 1000))))
        ((equal? u 1) (append (welsh_thousands_from_integer n) (list "ac" "un")))
        ((equal? u 3) (append (welsh_thousands_from_integer n) (list "a" "thri")))
        ((equal? u 4) (append (welsh_thousands_from_integer n) (list "a" "phedwar")))
        ((equal? u 5) (append (welsh_thousands_from_integer n) (list "a" "phump")))
        (t (append (welsh_thousands_from_integer n) (list "a") (welsh_base10_number_from_integer u)))
      )
    )

    ((>= n 1000000)
      (append (welsh_millions_from_integer n) (welsh_base10_number_from_integer(% n 1000000))))

  )
)


(define (welsh_number_of_minutes n)

  (cond
    ((> n 30) (welsh_number_of_minutes (- 60 n)))
    ((equal? n 1) (list "un" "funud"))
    ((equal? n 2) (list "dwy" "funud"))
    ((equal? n 3) (list "tair" "munud"))
    ((equal? n 4) (list "pedair" "munud"))
    ((equal? n 5) (list "pum" "munud"))
    ((equal? n 6) (list "chwe" "munud"))
    ((equal? n 7) (list "saith" "munud"))
    ((equal? n 8) (list "wyth" "munud"))
    ((equal? n 9) (list "naw" "munud"))
    ((equal? n 10) (list "deng" "munud"))
    ((equal? n 11) (list "un" "funud" "ar" "ddeg"))
    ((equal? n 12) (list "deuddeg" "munud"))
    ((equal? n 13) (list "tair" "munud" "ar" "ddeg"))
    ((equal? n 14) (list "pedair" "munud" "ar" "ddeg"))
    ((equal? n 15) (list "chwarter")) ; special case
    ((equal? n 16) (list "un" "funud" "ar" "bymtheg"))
    ((equal? n 17) (list "dwy" "funud" "ar" "bymtheg"))
    ((equal? n 18) (list "deunaw" "munud"))
    ((equal? n 19) (list "pedair" "munud" "ar" "bymtheg"))
    ((equal? n 20) (list "ugain" "munud"))
    ((equal? n 30) (list "hanner" "awr"))

    ((and (<= n 29) (>= n 20))
      (append (welsh_number_of_minutes(- n 20)) (list "ar" "hugain")))
  )
)


(define (welsh_base20_number_from_integer n)
; this function assumes that we have digit input

  (cond 
    ((equal? n 0) (list "dim"))
    ((equal? n 1) (list "un"))
    ((equal? n 2) (list "dwyau"))
    ((equal? n 3) (list "triair"))
    ((equal? n 4) (list "pedwarair"))
    ((equal? n 5) (list "pump"))
    ((equal? n 6) (list "chwech"))
    ((equal? n 7) (list "saith"))
    ((equal? n 8) (list "wyth"))
    ((equal? n 9) (list "naw"))
    ((equal? n 10) (list "deg"))
    ((equal? n 11) (list "un" "ar" "ddeg"))
    ((equal? n 12) (list "deuddeg"))
    ((equal? n 13) (list "triair" "ar" "ddeg"))
    ((equal? n 14) (list "pedwarair" "ar" "ddeg"))
    ((equal? n 15) (list "pymtheg"))
    ((equal? n 16) (list "un" "ar" "bymtheg"))
    ((equal? n 17) (list "dwyau" "ar" "bymtheg"))
    ((equal? n 18) (list "deunaw"))
    ((equal? n 19) (list "pedwarair" "ar" "bymtheg"))
    ((equal? n 20) (list "ugain"))
    ((equal? n 40) (list "deugain"))
    ((equal? n 50) (list "hanner" "cant"))
    ((equal? n 51) (list "hanner" "cant" "ac" "un"))
    ((equal? n 52) (list "hanner" "cant" "a" "dwyau"))
    ((equal? n 53) (list "hanner" "cant" "a" "thriair"))
    ((equal? n 54) (list "hanner" "cant" "a" "phedwarair"))
    ((equal? n 55) (list "hanner" "cant" "a" "phump"))
    ((equal? n 56) (list "hanner" "cant" "a" "chwech"))
    ((equal? n 57) (list "hanner" "cant" "a" "saith"))
    ((equal? n 58) (list "hanner" "cant" "a" "wyth"))
    ((equal? n 59) (list "hanner" "cant" "a" "naw"))
    ((equal? n 60) (list "trigain"))
    ((equal? n 80) (list "pedwar" "ugain"))
    ((equal? n 99) (list "cant" "namyn" "un")) ; efallai

    ((and (<= n 39) (>= n 21))
      (append (welsh_base20_number_from_integer (- n 20)) (list "ar" "hugain")))

    ((and (<= n 59) (>= n 41))
      (append (welsh_base20_number_from_integer (- n 40)) (list "a" "deugain")))

    ((and (<= n 79) (>= n 61))
      (append (welsh_base20_number_from_integer (- n 60)) (list "a" "thrigain")))

    ((and (<= n 98) (>= n 81))
      (append (welsh_base20_number_from_integer (- n 80)) (list "a" "phedwar" "ugain")))

  )

)

(provide 'welshtoken)
