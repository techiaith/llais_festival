;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                                                                       ;;
;;;                Centre for Speech Technology Research                  ;;
;;;                     University of Edinburgh, UK                       ;;
;;;                       Copyright (c) 1996,1997                         ;;
;;;                        All Rights Reserved.                           ;;
;;;                                                                       ;;
;;;  Permission to use, copy, modify, distribute this software and its    ;;
;;;  documentation for research, educational and individual use only, is  ;;
;;;  hereby granted without fee, subject to the following conditions:     ;;
;;;   1. The code must retain the above copyright notice, this list of    ;;
;;;      conditions and the following disclaimer.                         ;;
;;;   2. Any modifications must be clearly marked as such.                ;;
;;;   3. Original authors' names are not deleted.                         ;;
;;;  This software may not be used for commercial purposes without        ;;
;;;  specific prior written permission from the authors.                  ;;
;;;                                                                       ;;
;;;  THE UNIVERSITY OF EDINBURGH AND THE CONTRIBUTORS TO THIS WORK        ;;
;;;  DISCLAIM ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING      ;;
;;;  ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT   ;;
;;;  SHALL THE UNIVERSITY OF EDINBURGH NOR THE CONTRIBUTORS BE LIABLE     ;;
;;;  FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES    ;;
;;;  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN   ;;
;;;  AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION,          ;;
;;;  ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF       ;;
;;;  THIS SOFTWARE.                                                       ;;
;;;                                                                       ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;   A hand specified tree to predict zcore durations
;;;
;;;

(set! cb_cy_llg::zdur_tree
;
; This was naively copied from welsh_dur_tree in
; hl_diphone/festvox/hl_diphone.scm
;
 '
   ((ph_vc is +)  ;; a vowel
    ;; Determine what is after this word
    ((R:SylStructure.parent.syl_break is 0) ;; word internal break
     ((ph_syllabic is +)
      ((0.75))
      ((1.0)))
     ((R:SylStructure.parent.syl_break is 1) ;; word final
      ((R:SylStructure.parent.R:Syllable.p.syl_break is 0)  ;; poly-syllabic
       ((1.2))
       ((R:SylStructure.parent.R:Syllable.stress is 1) ;; stressed monosyllable
        ((1.10))
        ((1.0))))
      ((R:SylStructure.parent.syl_break is 3) ;; clause final
       ((1.5))
       ((R:SylStructure.parent.syl_break is 4) ;; utterance final
        ((1.5))
        ((1.0))))))      ;; don't think it ever gets here
    ;; Consonant
    ((coda is 1)
     ((R:SylStructure.stress is 1)
      ((1.0))  ;; post stress consonant rule
      ((1.0)))
     ((1.0))))
)

; this is naive in the extreme: I've just taken the mean durations
; from hl_diphone/festvox/hl_diphone.scm, mapped the phoneset
; across, and used the nearest SW phone to map to the new NW ones
; (except where noted)
;
; TODO: Insert a CART tree for durational modelling here?
;
; Rhys, Dec 2005
(set! cb_cy_llg::phone_durs

      '(
        (a 0.0 0.123)
        (aa 0.0 0.196)
        (aay 0.0 0.260) ; Estimate: hl_diphone /ai/ is 0.222
        (ai 0.0 0.222)
        (au 0.0 0.250)
        (@ 0.0 0.065) 
        (@@ 0.0 0.225)
        (ay 0.0 0.222) ; Map from SW /ai/
        (e 0.0 0.102)
        (ee 0.0 0.207)
        (ei 0.0 0.197) ; Map from hl_diphone /@i/
        (eu 0.0 0.237)
        (ey 0.0 0.197) ; Map from hl_diphone /ei/
        (i 0.0 0.155)
        (ii 0.0 0.195)
        (iu 0.0 0.218)
        (o 0.0 0.108)
        (oa 0.0 0.154)
        (oi 0.0 0.224)
        (oo 0.0 0.218)
        (ou 0.0 0.189) ; Map from hl_diphone /@u/
        (oy 0.0 0.250) ; Estimate: hl_diphone /oi/ is 0.224
        (u 0.0 0.094)
        (uu 0.0 0.220)
        (uy 0.0 0.224) ; Map from hl_diphone /ui/
        (y 0.0 0.155)  ; Estimate: same as hl_diphone /i/
        (yy 0.0 0.195) ; Estimate: same as hl_diphone /ii/
        (yu 0.0 0.218) ; Estimate: same as hl_diphone /iu/
        
        (b 0.0 0.077)
        (ch 0.0 0.166)
        (d 0.0 0.083)
        (dh 0.0 0.072)
        (jh 0.0 0.122)
        (f 0.0 0.131)
        (g 0.0 0.070)
        (hh 0.0 0.115) ; Map from hl_diphone /h/
        (j 0.0 0.089)
        (k 0.0 0.119)
        (l 0.0 0.073) ;; Edited from 63 on 9.12.94
        (lh 0.0 0.147)
        (lw 0.0 0.116)
        (m 0.0 0.067)
        (mh 0.0 0.176)
        (n 0.0 0.104)
        (ng 0.0 0.118)
        (ngh 0.0 0.182)
        (nh 0.0 0.167)
        (nw 0.0 0.119)
        (p 0.0 0.128)
        (r 0.0 0.077)
        (rh 0.0 0.116)
        (rw 0.0 0.134)
        (s 0.0 0.133)
        (sh 0.0 0.137)
        (t 0.0 0.155)
        (th 0.0 0.146)
        (v 0.0 0.096)
        (w 0.0 0.090)
        (x 0.0 0.145)
        (z 0.0 0.093)
        (zh 0.0 0.086)

        (sil 0.0 0.250)
  )
)

(provide 'cb_cy_llg_durdata)
