;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                                                                     ;;;
;;;                     Carnegie Mellon University                      ;;;
;;;                  and Alan W Black and Kevin Lenzo                   ;;;
;;;                      Copyright (c) 1998-2000                        ;;;
;;;                        All Rights Reserved.                         ;;;
;;;                                                                     ;;;
;;; Permission is hereby granted, free of charge, to use and distribute ;;;
;;; this software and its documentation without restriction, including  ;;;
;;; without limitation the rights to use, copy, modify, merge, publish, ;;;
;;; distribute, sublicense, and/or sell copies of this work, and to     ;;;
;;; permit persons to whom this work is furnished to do so, subject to  ;;;
;;; the following conditions:                                           ;;;
;;;  1. The code must retain the above copyright notice, this list of   ;;;
;;;     conditions and the following disclaimer.                        ;;;
;;;  2. Any modifications must be clearly marked as such.               ;;;
;;;  3. Original authors' names are not deleted.                        ;;;
;;;  4. The authors' names are not used to endorse or promote products  ;;;
;;;     derived from this software without specific prior written       ;;;
;;;     permission.                                                     ;;;
;;;                                                                     ;;;
;;; CARNEGIE MELLON UNIVERSITY AND THE CONTRIBUTORS TO THIS WORK        ;;;
;;; DISCLAIM ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING     ;;;
;;; ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT  ;;;
;;; SHALL CARNEGIE MELLON UNIVERSITY NOR THE CONTRIBUTORS BE LIABLE     ;;;
;;; FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES   ;;;
;;; WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN  ;;;
;;; AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION,         ;;;
;;; ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF      ;;;
;;; THIS SOFTWARE.                                                      ;;;
;;;                                                                     ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Lexicon, LTS and Postlexical rules for cb_cy
;;;

;;; Load any necessary files here

(define (cb_cy_addenda)
  "(cb_cy_addenda)
Basic lexicon should (must ?) have basic letters, symbols and punctuation."

;;; Pronunciation of letters in the alphabet
;(lex.add.entry '("a" nn (((a) 0))))
;(lex.add.entry '("b" nn (((b e) 0))))
;(lex.add.entry '("c" nn (((th e) 0))))
;(lex.add.entry '("d" nn (((d e) 0))))
;(lex.add.entry '("e" nn (((e) 0))))
; ...

;;; Symbols ...
;(lex.add.entry 
; '("*" n (((a s) 0) ((t e) 0) ((r i1 s) 1)  ((k o) 0))))
;(lex.add.entry 
; '("%" n (((p o r) 0) ((th i e1 n) 1) ((t o) 0))))

;; Basic punctuation must be in with nil pronunciation
(lex.add.entry '("." punc nil))
;(lex.add.entry '("." nn (((p u1 n) 1) ((t o) 0))))
(lex.add.entry '("'" punc nil))
(lex.add.entry '(":" punc nil))
(lex.add.entry '(";" punc nil))
(lex.add.entry '("," punc nil))
;(lex.add.entry '("," nn (((k o1) 1) ((m a) 0))))
(lex.add.entry '("-" punc nil))
(lex.add.entry '("\"" punc nil))
(lex.add.entry '("`" punc nil))
(lex.add.entry '("?" punc nil))
(lex.add.entry '("!" punc nil))
)

;; Load in the letter to sound rules
(require 'gogepen)
(require 'gogwelstr)
(require 'gogwel)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Hand written letter to sound rules
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (cb_cy_lts_function word features)
  "(cb_cy_lts_function WORD FEATURES)
Using various letter to sound rules build a welsh pronunciation of
WORD. This function is only called if a word has not been found in lexicon."
;  (format stderr "couldn't find pronunciation for %s in lexicon\n" word)
  (if (lts.in.alphabet (downcase word) 'gogepen)
    (let (epen str wel)
      (set! epen (lts.apply (downcase word) 'gogepen))
      (set! str (lts.apply epen 'gogwelstr))
      (set! wel (lts.apply str 'gogwel))
      (list word
          nil
          (lex.syllabify.phstress wel)))
      (begin
          (format stderr "unpronouncable word %s\n" word)
          ;; Put in a word that means "unknown" with its pronunciation
          '("yy" nil (((@@) 0)))))
)

;;;  Function called when word not found in lexicon
;(define (cb_cy_lts_function word features)
;  "(cb_cy_lts_function WORD FEATURES)
;Return pronunciation of word not in lexicon."
;  (format stderr "failed to find pronunciation for %s\n" word)
;  (let ((dword (downcase word)))
;    ;; Note you may need to use a letter to sound rule set to do
;    ;; casing if the language has non-ascii characters in it.
;    (if (lts.in.alphabet word 'cb_cy)
;	(list
;	 word
;	 features
;	 ;; This syllabification is almost certainly wrong for
;	 ;; this language (its not even very good for English)
;	 ;; but it will give you something to start off with
;	 (lex.syllabify.phstress
;	   (lts.apply word 'cb_cy)))
;	(begin
;	  (format stderr "unpronouncable word %s\n" word)
;	  ;; Put in a word that means "unknown" with its pronunciation
;	  '("nepoznat" nil (((N EH P) 0) ((AO Z) 0) ((N AA T) 0))))))
;)

;; You may or may not be able to write a letter to sound rule set for
;; your language.  If its largely lexicon based learning a rule
;; set will be better and easier that writing one (probably).
;(lts.ruleset
; cb_cy
; (  (Vowel WHATEVER) )
; (
;  ;; LTS rules 
;  ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Postlexical Rules 
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (cb_cy::postlex_rule1 utt)
  "(cb_cy::postlex_rule1 utt)
A postlexical rule form correcting phenomena over word boundaries."
  (mapcar
   (lambda (s)
     ;; do something
     )
   (utt.relation.items utt 'Segment))
   utt)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Lexicon definition
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(lex.create "cb_cy")
(lex.set.phoneset "cb_cy")
(lex.set.lts.method 'cb_cy_lts_function)
;;; If you have a compiled lexicon uncomment this
;(lex.set.compile.file (path-append cb_cy_llg_dir "../Lexicon/cb_cy_lex_pos.out"))
(lex.set.compile.file (path-append cb_cy_llg_dir "../Lexicon/cb_cy_lex.out"))
(cb_cy_addenda)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Lexicon setup
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (cb_cy_llg::select_lexicon)
  "(cb_cy_llg::select_lexicon)
Set up the lexicon for cb_cy."
  (lex.select "cb_cy")

  ;; Post lexical rules
  (set! postlex_rules_hooks (list cb_cy::postlex_rule1))
)

(define (cb_cy_llg::reset_lexicon)
  "(cb_cy_llg::reset_lexicon)
Reset lexicon information."
  t
)

(provide 'cb_cy_llg_lexicon)
