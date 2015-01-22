;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;-*-mode:scheme-*-
;;;                                                                       ;;
;;;                      University of Wales, Bangor                      ;;
;;;                         Copyright (c) 2006                            ;;
;;;                        All Rights Reserved.                           ;;
;;;                                                                       ;;
;;;  Distribution policy                                                  ;;
;;;     Free for any use                                                  ;;
;;;                                                                       ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;  A male Welsh diphone voice (North Welsh accent)
;;;
;;;  Authors: Briony Williams
;;;           Rhys James Jones
;;;           Ivan Uemlianin
;;;

;;; Try to find out where we are
(if (assoc 'cb_cy_llg_diphone voice-locations)
    (defvar cb_cy_llg_dir 
      (cdr (assoc 'cb_cy_llg_diphone voice-locations)))
    ;;; Not installed in Festival yet so assume running in place
    (defvar cb_cy_llg_dir (pwd)))

(if (not (probe_file (path-append cb_cy_llg_dir "festvox/")))
    (begin
     (format stderr "cb_cy_llg: Can't find voice scm files they are not in\n")
     (format stderr "   %s\n" (path-append cb_cy_llg_dir "festvox/"))
     (format stderr "   Either the voice isn't linked into Festival\n")
     (format stderr "   or you are starting festival in the wrong directory\n")
     (error)))

;;;  Add the directory contains general voice stuff to load-path
(set! load-path (cons (path-append cb_cy_llg_dir "festvox/") load-path))
(set! load-path (cons (path-append cb_cy_llg_dir "../Tokenisation/") load-path))








;;; Do the same for the lexicon and for letter-to-sound rules
(if (not (probe_file (path-append cb_cy_llg_dir "../Lexicon")))
   (begin
     (format stderr "cb_cy_llg: There should be a lexicon in\n")
     (format stderr "   %s\n" (path-append cb_cy_llg_dir "../Lexicon/"))
     (format stderr "   (in the file gogdict.out)\n")
     (format stderr "   Please check that your directory structure is complete\n")
     (format stderr "   and that you are starting festival in the right directory\n")
     (error)))

(set! load-path (cons (path-append cb_cy_llg_dir "../Lexicon/") load-path))

(if (not (probe_file (path-append cb_cy_llg_dir "../LTS")))
   (begin
     (format stderr "cb_cy_llg: Letter-to-sound rules should be present in\n")
     (format stderr "   %s\n" (path-append cb_cy_llg_dir "../LTS/"))
     (format stderr "   (files gogepen.scm, gogwel.scm, gogwelstr.scm)\n")
     (format stderr "   Please check that your directory structure is complete\n")
     (format stderr "   and that you are starting festival in the right directory\n")
     (error)))

(set! load-path (cons (path-append cb_cy_llg_dir "../LTS/") load-path))










;;; Voice specific parameter are defined in each of the following
;;; files
(require 'cb_cy_llg_phoneset)
(require 'cb_cy_llg_tokenizer)
(require 'cb_cy_llg_tagger)
(require 'cb_cy_llg_lexicon)
(require 'cb_cy_llg_phrasing)
(require 'cb_cy_llg_intonation)
(require 'cb_cy_llg_duration)
(require 'cb_cy_llg_f0model)
(require 'cb_cy_llg_other)
;; ... and others as required
(require 'welshtoken)

;;;  Ensure we have a festival with the right diphone support compiled in
(require_module 'UniSyn)

(set! cb_cy_llg_lpc_sep 
      (list
       '(name "cb_cy_llg_lpc_sep")
       (list 'index_file (path-append cb_cy_llg_dir "dic/llgdiph.est"))
       '(grouped "false")
       (list 'coef_dir (path-append cb_cy_llg_dir "lpc"))
       (list 'sig_dir  (path-append cb_cy_llg_dir "lpc"))
       '(coef_ext ".lpc")
       '(sig_ext ".res")
       (list 'default_diphone 
	     (string-append
	      (car (cadr (car (PhoneSet.description '(silences)))))
	      "-"
	      (car (cadr (car (PhoneSet.description '(silences)))))))))

(set! cb_cy_llg_lpc_group 
      (list
       '(name "llg_lpc_group")
       (list 'index_file 
	     (path-append cb_cy_llg_dir "group/llglpc.group"))
       '(grouped "true")
       (list 'default_diphone 
	     (string-append
	      (car (cadr (car (PhoneSet.description '(silences)))))
	      "-"
	      (car (cadr (car (PhoneSet.description '(silences)))))))))

;; Go ahead and set up the diphone db
;(set! cb_cy_llg_db_name (us_diphone_init cb_cy_llg_lpc_sep))
;; Once you've built the group file you can comment out the above and
;; uncomment the following.
(set! cb_cy_llg_db_name (us_diphone_init cb_cy_llg_lpc_group))

(define (cb_cy_llg_diphone_fix utt)
"(cb_cy_llg_diphone_fix UTT)
Map phones to phonological variants if the diphone database supports
them."
  (mapcar
   (lambda (s)
     (let ((name (item.name s)))
       (cb_cy_llg_diphone_fix_phone_name utt s)
       ))
   (utt.relation.items utt 'Segment))
  utt)

(define (cb_cy_llg_diphone_fix_phone_name utt seg)
"(cb_cy_llg_fix_phone_name UTT SEG)
Add the feature diphone_phone_name to given segment with the appropriate
name for constructing a diphone.  Basically adds _ if either side is part
of the same consonant cluster, adds $ either side if in different
syllable for preceding/succeeding vowel syllable."
  (let ((name (item.name seg)))
    (cond
     ((string-equal name "pau") t)
     ((string-equal "-" (item.feat seg 'ph_vc))
      (if (and (member_string name '(r w j l))
	       (member_string (item.feat seg "p.name") '(p t k b d g))
	       (item.relation.prev seg "SylStructure"))
	  (item.set_feat seg "us_diphone_right" (format nil "_%s" name)))
      (if (and (member_string name '(w j l m n p t k))
	       (string-equal (item.feat seg "p.name") 's)
	       (item.relation.prev seg "SylStructure"))
	  (item.set_feat seg "us_diphone_right" (format nil "_%s" name)))
      (if (and (string-equal name 's)
	       (member_string (item.feat seg "n.name") '(w j l m n p t k))
	       (item.relation.next seg "SylStructure"))
	  (item.set_feat seg "us_diphone_left" (format nil "%s_" name)))
      (if (and (string-equal name 'hh)
	       (string-equal (item.feat seg "n.name") 'j))
	  (item.set_feat seg "us_diphone_left" (format nil "%s_" name)))
      (if (and (string-equal name 'j)
	       (string-equal (item.feat seg "p.name") 'hh))
	  (item.set_feat seg "us_diphone_right" (format nil "_%s" name)))
      (if (and (member_string name '(p t k b d g))
	       (member_string (item.feat seg "n.name") '(r w j l))
	       (item.relation.next seg "SylStructure"))
	  (item.set_feat seg "us_diphone_left" (format nil "%s_" name)))
      )
     ((string-equal "ah" (item.name seg))
      (item.set_feat seg "us_diphone" "aa"))

   )))

(define (cb_cy_llg_voice_reset)
  "(cb_cy_llg_voice_reset)
Reset global variables back to previous voice."
  (cb_cy_llg::reset_phoneset)
  (cb_cy_llg::reset_tokenizer)
  (cb_cy_llg::reset_tagger)
  (cb_cy_llg::reset_lexicon)
  (cb_cy_llg::reset_phrasing)
  (cb_cy_llg::reset_intonation)
  (cb_cy_llg::reset_duration)
  (cb_cy_llg::reset_f0model)
  (cb_cy_llg::reset_other)
)

;;;  Full voice definition 
(define (voice_cb_cy_llg_diphone)
"(voice_cb_cy_llg_diphone)
Set speaker to xx in us from xx."

  ;; Reset anything set by the previous voice (if applicable)
  (voice_reset)

  ;; Select appropriate phone set
  (cb_cy_llg::select_phoneset)

  ;; Select appropriate tokenization
  (cb_cy_llg::select_tokenizer)

  ;; For part of speech tagging
  (cb_cy_llg::select_tagger)

  (cb_cy_llg::select_lexicon)

  (cb_cy_llg::select_phrasing)

  (cb_cy_llg::select_intonation)

  (cb_cy_llg::select_duration)

  (cb_cy_llg::select_f0model)



  (Parameter.set 'Token_Method 'Token_Welsh)
  (Parameter.set 'POS_Method Classic_POS)
  (Parameter.set 'Phrasify_Method Classic_Phrasify)
  (Parameter.set 'Word_Method Classic_Word)
  (Parameter.set 'Pause_Method Classic_Pauses)
  (Parameter.set 'PostLex_Method Classic_PostLex)

  (cb_cy_addenda)

;  (ngram.load 'welsh_pos_ngram
;    (path-append cb_cy_llg_dir "../Lexicon/cb_cy_lex_pos.ngram"))

  (lex.set.compile.file
    (path-append cb_cy_llg_dir "../Lexicon/cb_cy_lex.out"))

  (set! guess_pos welsh_guess_pos)

(require 'cb_cy_llg_durtreeZ)
  (set! duration_cart_tree cb_cy_llg_duration_cart_tree)
  (set! duration_ph_info cb_cy_llg_durs)
  (Parameter.set 'Duration_Method Duration_Tree_ZScores)

  ;; Waveform synthesizer: UniSyn diphones
  (set! UniSyn_module_hooks (list cb_cy_llg_diphone_fix))
  (set! us_abs_offset 0.0)
  (set! window_factor 1.0)
  (set! us_rel_offset 0.0)
  (set! us_gain 0.9)

  (Parameter.set 'Synth_Method 'UniSyn)
  (Parameter.set 'us_sigpr 'lpc)
  (us_db_select cb_cy_llg_db_name)

  ;; This is where you can modify power (and sampling rate) if desired
  (set! after_synth_hooks nil)
;  (set! after_synth_hooks
;      (list
;        (lambda (utt)
;          (utt.wave.rescale utt 2.1))))

  ;; set callback to restore some original values changed by this voice
  (set! current_voice_reset cb_cy_llg_voice_reset)

  (set! current-voice 'cb_cy_llg_diphone)
)

(proclaim_voice
 'cb_cy_llg_diphone
 '((language english)
   (gender COMMENT)
   (dialect american)
   (description
    "COMMENT"
    )
   (builtwith festvox-1.3)))

(provide 'cb_cy_llg_diphone)
