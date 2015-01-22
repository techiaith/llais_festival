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
;;; Phonset for cb_cy
;;;

;;;  Feeel free to add new feature values, or new features to this
;;;  list to make it more appropriate to your language

;; This is where it'll fall over if you haven't defined a 
;; a phoneset yet, if you have, delete this, if you haven't
;; define one then delete this error message
;;;;; (error "You have not yet defined a phoneset for cy (and others things ?)\n            Define it in festvox/cb_cy_llg_phoneset.scm\n")


(defPhoneSet
  cb_cy
  ;;;  Phone Features
  (;; vowel or consonant
   (vc + -)  
   ;; vowel length: short long dipthong schwa
   (vlng s l d a 0)
   ;; vowel height: high mid low
   (vheight 1 2 3 0)
   ;; vowel frontness: front mid back
   (vfront 1 2 3 0)
   ;; lip rounding
   (vrnd + - 0)
   ;; consonant type: stop fricative affricative nasal liquid
   (ctype s f a n l 0)
   ;; place of articulation: labial alveolar palatal labio-dental
   ;;                         dental velar
   (cplace l a p b d v 0)
   ;; consonant voicing
   (cvox + - 0)
   ;; syllabic
   (syllabic + -)
   )
  (
   (sil  - 0 0 0 0 0 0 - -)  ;; silence ... 

   (a + s 3 1 - 0 0 0 -)
   (aa + l 3 1 - 0 0 0 +)
   (aay + d 3 1 - 0 0 0 +)
   (ai + d 3 1 - 0 0 0 +)
   (au + d 3 1 - 0 0 0 +)
   (@ + a 2 2 - 0 0 0 +)
   (@@ + l 2 2 - 0 0 0 +)
   (ay + d 3 1 - 0 0 0 +)
   (b - 0 0 0 0 s l + -)
   (ch - 0 0 0 0 a a - -)
   (d - 0 0 0 0 s a + -)
   (dh - 0 0 0 0 f d + -)
   (e + s 2 1 - 0 0 0 -)
   (ee + l 2 1 - 0 0 0 +)
   (ei + d 2 1 - 0 0 0 +)
   (eu + d 2 1 - 0 0 0 +)
   (ey + d 2 1 - 0 0 0 +)
   (f - 0 0 0 0 f b - -)
   (g - 0 0 0 0 s v + -)
   (hh - 0 0 0 0 f b - -)
   (i + s 1 1 - 0 0 0 -)
   (ii + l 1 1 - 0 0 0 +)
   (iu + d 1 1 - 0 0 0 +)
   (j - 0 0 0 0 l p + -)
   (jh - 0 0 0 0 a a + -)
   (k - 0 0 0 0 s v - -)
   (l - 0 0 0 0 l a + -)
   (lh - 0 0 0 0 l a - -)
   (lw - 0 0 0 + l a + -)
   (m - 0 0 0 0 n l + -)
   (mh - 0 0 0 0 n l - -)
   (n - 0 0 0 0 n a + -)
   (ng - 0 0 0 0 n v + -)
   (ngh - 0 0 0 0 n v - -)
   (nh - 0 0 0 0 n a - -)
   (nw - 0 0 0 + n a + -)
   (o + s 3 3 + 0 0 0 -)
   (oa + l 3 3 + 0 0 0 +)
   (oi + d 3 3 + 0 0 0 +)
   (oo + l 3 3 + 0 0 0 +)
   (ou + d 3 3 + 0 0 0 +)
   (oy + d 3 3 + 0 0 0 +)
   (p - 0 0 0 0 s l - -)
   (r - 0 0 0 0 l a + -)
   (rh - 0 0 0 0 l a - -)
   (rw - 0 0 0 + l a + -)
   (s - 0 0 0 0 f a - -)
   (sh - 0 0 0 0 f p - -)
   (t - 0 0 0 0 s a - -)
   (th - 0 0 0 0 f d - -)
   (u + s 3 3 + 0 0 0 -)
   (uu + l 3 3 + 0 0 0 +)
   (uy + d 3 3 + 0 0 0 +)
   (v - 0 0 0 0 f b + -)
   (w - 0 0 0 0 l l + -)
   (x - 0 0 0 0 f v - -)
   (y + s 1 2 - 0 0 0 -)
   (yu + d 1 2 - 0 0 0 +)
   (yy + l 1 2 - 0 0 0 +)
   (z - 0 0 0 0 f a + -)
   (zh - 0 0 0 0 f p + -)
  )
)


(PhoneSet.silences '(sil))

(define (cb_cy_llg::select_phoneset)
  "(cb_cy_llg::select_phoneset)
Set up phone set for cb_cy."
  (Parameter.set 'PhoneSet 'cb_cy)
  (PhoneSet.select 'cb_cy)
)

(define (cb_cy_llg::reset_phoneset)
  "(cb_cy_llg::reset_phoneset)
Reset phone set for cb_cy."
  t
)

(provide 'cb_cy_llg_phoneset)
