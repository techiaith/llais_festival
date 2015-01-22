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
;;; Intonation for cy
;;;

;;; Load any necessary files here

(define (cb_cy_llg::is_function_word)
  "(cb_cy_llg::is_function_word)
Return true if word is a function word for intonation."
  (set! gpos_word R:SylStructure.parent.gpos)
  (cond
   ((or (gpos_word is conj) (gpos_word is DemPron) (gpos_word is prep) (gpos_word is DefArt) (gpos_word is pronpl) (gpos_word is cprep) (gpos_word is PvPart) (gpos_word is pron) (gpos_word is CmpPrep) (gpos_word is YnPred) (gpos_word is part) (gpos_word is NegPart) (gpos_word is pronm))
      (nil))
   (t
      (t))
  )
)


(set! cb_cy_accent_cart_tree
 '
  ((cb_cy_llg::is_function_word is t)
   ((stress is 1)
    ((Accented))
    ((position_type is single)
     ((Accented))
     ((NONE))))
   ((NONE))))

(set! int_simple_params
   '((f0_mean 130) (f0_std 20)))


;;; Intonation
;(set! cb_cy_accent_cart_tree
;  '
;  (
;   (cb_cy_llg::is_function_word is t)
;    ( (stress is 1)
;       ((Accented))
;       ((NONE))
;    )
;  )
;)

;;; Intonation
;(set! cb_cy_accent_cart_tree
;  '
;  (
;   (R:SylStructure.parent.gpos is content)
;    ( (stress is 1)
;       ((Accented))
;       ((NONE))
;    )
;  )
;)

(define (cb_cy_llg::select_intonation)
  "(cb_cy_llg::select_intonation)
Set up intonation for cy."
  (set! int_accent_cart_tree cb_cy_accent_cart_tree)
;  (Parameter.set 'Int_Target_Method 'Simple)
  (Parameter.set 'Int_Target_Method 'Int_Targets_Simple)

)

(define (cb_cy_llg::reset_intonation)
  "(cb_cy_llg::reset_intonation)
Reset intonation information."
  t
)

(provide 'cb_cy_llg_intonation)
