(lts.ruleset
;  Name of rule set
  gogwelstr
;  Sets used in the rules
(
  ( V a e i o u w y )
  ( D a e i o u w y )
  ( H a e i o u y )
  ( I a e o )
  ( C b c d f g h J j k l m n p q r s t v w x z X T "\"" "%" "\\" "-" )
  ( Q b c d f g h J j k l m n p q r s t v w x z X T "\"" "%" "\\" "-" )
  ( T b c d f g h J j k l m n p q r s t v x z X T "\"" "%" "\\" "-" )
  ( G b c d f g h J j k l m n p q r s t v x z X T "\"" "%" "\\" "-" )
  ( Z b c d f g h J j k l m n p q r s t v x z X T "\"" "%" "\\" "-" )

  ( K c g ngh ch )
  ( B g ng )
  ( R l n r )
  ( A "-" # )
)
;  Rules
(
;     Rules for determining the location of a stressed syllable in Welsh
;     ------------------------------------------------------------------

;     Quote mark and percent sign added to "C, Q, G, T" by BJW on 2005-10-04 
;     and 2005-10-20, to ensure diaeresis forces syll boundary

;   # symbols


;   # variables

;     V	one or more of [a e i o u w y]
;     D	zero or more of [a e i o u w y]
;     H	one or more of [a e i o u y]

;     I	[a e o]

;     C	zero or more of [b c d f g h J j k l m n p q r s t v w x z " % \]
;     Q	[b c d f g h J j k l m n p q r s t v w x z " % \]
;     T	[b c d f g h J j k l m n p q r s t v x z " % \]
;     G	zero or more of [b c d f g h J j k l m n p q r s t v x z " % \]    
;     Z one or more of [b c d f g h J j k l m n p q r s t v x z " % \]


;     K   [c g ngh ch]
;     B   [g ng]
;     R	  [l n r]

;   # end symbols


( [ "-" ] = "-" )

;     Delete dummy diaeresis
;;;;;;;;( [ "\"" ] = )
( [ "\"" ] = "\"" )
( [ % ] = % )


;     First deal with vowels after circumflex (always monophthongs):

( "^" [ i ] = i )
( "^" [ e ] = e )
( "^" [ a ] = a )
( "^" [ o ] = o )
( "^" [ u ] = u )
( "^" [ w ] = w )
( "^" [ y ] = y )
( [ "^" ] = "^" )

;    a) Vowels orthographically marked stressed: may be in ultima,
;       monosyllable, antepenult, or preantepenult.

( [ o / i ] = O I )
( [ o / y ] = O Y )
( [ o / u ] = O U )
( [ o / e ] = O E )
( [ a / i ] = A I )
( [ a / u ] = A U )
( [ a / e ] = A E )
( [ w / y ] = U Y )
( [ i / w ] = I W )
( [ y / w ] = Y W )
( [ u / w ] = U W )
( [ e / w ] = E W )
( [ a / w ] = A W )
( [ e / i ] = E I )
( [ e / y ] = E Y )
( [ e / u ] = E U )
( [ o / w ] = O W )
( [ i / ] = I )
( [ e / ] = E )
( [ a / ] = A )
( [ o / ] = O )
( [ w / ] = W )
( [ u / ] = U )
( [ y / ] = Y )

;        b) Stress in ultima or monosyllable shown by a circumflex or grave,
;           not an acute accent (circumflex not used in penults):

( [ i "^" ] = I "^" )
( [ e "^" ] = E "^" )
( [ a "^" ] = A "^" )
( [ o "^" ] = O "^" )
( [ w "^" ] = W "^" )
( [ u "^" ] = U "^" )
( [ y "^" ] = Y "^" )

( [ i "\\" ] = I "\\" )
( [ e "\\" ] = E "\\" )
( [ a "\\" ] = A "\\" )
( [ o "\\" ] = O "\\" )
( [ w "\\" ] = W "\\" )
( [ u "\\" ] = U "\\" )
( [ y "\\" ] = Y "\\" )

;        c) Vowels in monosyllables (assumed to be stressed monosyllables) and
;           in putative monosyllables (which may not actually be monosylls):

;      Diphthongs (some may have intervening single quote) -
;     Versions where vocalic 'w' precedes (looks like a monosyll):
( A G * w Z + [ o "'" i ] G * A = o "'" i )
( A G * w Z + [ o i ] G * A = o i )
( A G * w Z + [ o y ] G * A = o y )
( A G * w Z + [ o "'" u ] G * A = o "'" u )
( A G * w Z + [ o u ] G * A = o u )
( A G * w Z + [ o e ] G * A = o e )
( A G * w Z + [ a "'" i ] G * A = a "'" i )
( A G * w Z + [ a i ] G * A = a i )
( A G * w Z + [ a "'" u ] G * A = a "'" u )
( A G * w Z + [ a u ] G * A = a u )
( A G * w Z + [ a e ] G * A = a e )
( A G * w Z + [ i "'" w ] G * A = i "'" w )
( A G * w Z + [ i w ] G * A = i w )
( A G * w Z + [ y w ] G * A = y w )
( A G * w Z + [ u "'" w ] G * A = u "'" w )
( A G * w Z + [ u w ] G * A = u w )
( A G * w Z + [ e w ] G * A = e w )
( A G * w Z + [ a w ] G * A = a w )
( A G * w Z + [ e "'" i ] G * A = e "'" i )
( A G * w Z + [ e i ] G * A = e i )
( A G * w Z + [ e y ] G * A = e y )
( A G * w Z + [ e u ] G * A = e u )
( A G * w Z + [ o "'" w ] G * A = o "'" w )
( A G * w Z + [ o w ] G * A = o w )
;    Versions where no vocalic 'w' precedes (though cons 'w' can precede):
( A G * [ o "'" i ] G * A = O "'" I )
( A G * [ o i ] G * A = O I )
( A G * [ o y ] G * A = O Y )
( A G * [ o "'" u ] G * A = O "'" U )
( A G * [ o u ] G * A = O U )
( A G * [ o e ] G * A = O E )
( A G * [ a "'" i ] G * A = A "'" I )
( A G * [ a i ] G * A = A I )
( A G * [ a "'" u ] G * A = A "'" U )
( A G * [ a u ] G * A = A U )
( A G * [ a e ] G * A = A E )
( A G * [ i "'" w ] G * A = I "'" W )
( A G * [ i w ] G * A = I W )
( A G * [ y w ] G * A = Y W )
( A G * [ u "'" w ] G * A = U "'" W )
( A G * [ u w ] G * A = U W )
( A G * [ e w ] G * A = E W )
( A G * [ a w ] G * A = A W )
( A G * [ e "'" i ] G * A = E "'" I )
( A G * [ e i ] G * A = E I )
( A G * [ e y ] G * A = E Y )
( A G * [ e u ] G * A = E U )
( A G * [ o "'" w ] G * A = O "'" W )
( A G * [ o w ] G * A = O W )

( A G * w [ o "'" i ] C * A = O "'" I )
( A G * w [ o i ] C * A = O I )
( A G * w [ o y ] C * A = O Y )
( A G * w [ o "'" u ] C * A = O "'" U )
( A G * w [ o u ] C * A = O U )
( A G * w [ o e ] C * A = O E )
( A G * w [ a "'" i ] C * A = A "'" I )
( A G * w [ a i ] C * A = A I )
( A G * w [ a "'" u ] C * A = A "'" U )
( A G * w [ a u ] C * A = A U )
( A G * w [ a e ] C * A = A E )
( A G * w [ i "'" w ] C * A = I "'" W )
( A G * w [ i w ] C * A = I W )
( A G * w [ y w ] C * A = Y W )
( A G * w [ u "'" w ] C * A = U "'" W )
( A G * w [ u w ] C * A = U W )
( A G * w [ e w ] C * A = E W )
( A G * w [ a w ] C * A = A W )
( A G * w [ e "'" i ] C * A = E "'" I )
( A G * w [ e i ] C * A = E I )
( A G * w [ e y ] C * A = E Y )
( A G * w [ e u ] C * A = E U )
( A G * w [ o "'" w ] C * A = O "'" W )
( A G * w [ o w ] C * A = O W )

;    Accent-marked monophthongs and diphthongs after yod:
( A C * J [ a / ] C * A = A )
( A C * J [ e / ] C * A = E )
( A C * J [ o / ] C * A = O )
( A C * J [ a "\\" ] C * A = A "\\" )
( A C * J [ e "\\" ] C * A = E "\\" )
( A C * J [ o "\\" ] C * A = O "\\" )

;    Non-accent marked monophthongs and dipthongs after yod:

;   Versions for preceding vocalic 'w' (which look like a monosyll to the rules):
;   With two intervening consonants:
( A G * w T T J [ a "'" i ] G * A = a "'" i )
( A G * w T T J [ a i ] G * A = a i )
( A G * w T T J [ a e ] G * A = a e )
( A G * w T T J [ a "'" u ] G * A = a "'" u )
( A G * w T T J [ a u ] G * A = a u )
( A G * w T T J [ a "'" w ] G * A = a "'" w )
( A G * w T T J [ a w ] G * A = a w )
( A G * w T T J [ a "^" ] G * A = A "^" )
( A G * w T T J [ a ] G * A = a )
( A G * w T T J [ e w ] G * A = e w )
( A G * w T T J [ e "'" i ] G * A = e "'" i )
( A G * w T T J [ e i ] G * A = e i )
( A G * w T T J [ e y ] G * A = e y )
( A G * w T T J [ e "'" u ] G * A = e "'" u )
( A G * w T T J [ e u ] G * A = e u )
( A G * w T T J [ e "^" ] G * A = E "^" )
( A G * w T T J [ e ] G * A = e )
( A G * w T T J [ o y ] G * A = o y )
( A G * w T T J [ o "'" u ] G * A = o "'" u )
( A G * w T T J [ o u ] G * A = o u )
( A G * w T T J [ o e ] G * A = o e )
( A G * w T T J [ o w ] G * A = o w )
( A G * w T T J [ o "^" ] G * A = O "^" )
( A G * w T T J [ o ] G * A = o )
;   With one intervening consonant:
( A G * w T J [ a "'" i ] G * A = a "'" i )
( A G * w T J [ a i ] G * A = a i )
( A G * w T J [ a e ] G * A = a e )
( A G * w T J [ a "'" u ] G * A = a "'" u )
( A G * w T J [ a u ] G * A = a u )
( A G * w T J [ a "'" w ] G * A = a "'" w )
( A G * w T J [ a w ] G * A = a w )
( A G * w T J [ a "^" ] G * A = A "^" )
( A G * w T J [ a ] G * A = a )
( A G * w T J [ e w ] G * A = e w )
( A G * w T J [ e "'" i ] G * A = e "'" i )
( A G * w T J [ e i ] G * A = e i )
( A G * w T J [ e y ] G * A = e y )
( A G * w T J [ e "'" u ] G * A = e "'" u )
( A G * w T J [ e u ] G * A = e u )
( A G * w T J [ e "^" ] G * A = E "^" )
( A G * w T J [ e ] G * A = e )
( A G * w T J [ o y ] G * A = o y )
( A G * w T J [ o "'" u ] G * A = o "'" u )
( A G * w T J [ o u ] G * A = o u )
( A G * w T J [ o e ] G * A = o e )
( A G * w T J [ o w ] G * A = o w )
( A G * w T J [ o "^" ] G * A = O "^" )
( A G * w T J [ o ] G * A = o )
;    Default versions after yod:  no preceding vocalic 'w':
( A C * J [ a "'" i ] C * A = A "'" I )
( A C * J [ a i ] C * A = A I )
( A C * J [ a e ] C * A = A E )
( A C * J [ a "'" u ] C * A = A "'" U )
( A C * J [ a u ] C * A = A U )
( A C * J [ a "'" w ] C * A = A "'" W )
( A C * J [ a w ] C * A = A W )
( A C * J [ a "^" ] C * A = A "^" )
( A C * J [ a ] C * A = A )
( A C * J [ e w ] C * A = E W )
( A C * J [ e "'" i ] C * A = E "'" I )
( A C * J [ e i ] C * A = E I )
( A C * J [ e y ] C * A = E Y )
( A C * J [ e "'" u ] C * A = E "'" U )
( A C * J [ e u ] C * A = E U )
( A C * J [ e "^" ] C * A = E "^" )
( A C * J [ e ] C * A = E )
( A C * J [ o y ] C * A = O Y )
( A C * J [ o "'" u ] C * A = O "'" U )
( A C * J [ o u ] C * A = O U )
( A C * J [ o e ] C * A = O E )
( A C * J [ o w ] C * A = O W )
( A C * J [ o "^" ] C * A = O "^" )
( A C * J [ o ] C * A = O )

;      Monophthongs with diaeresis and following vowel grapheme:
;   #C[i]"VC#=I
;   #C[e]"VC#=E
;   #C[a]"VC#=A
;   #C[o]"VC#=O
;   #C[u]"VC#=U
;   #C[w]"VC#=W
;   #C[y]"VC#=Y

;     Sorting out orthographic 'w':

;     i) Velar-cons-plus-wy^ counts as cons cluster, as does word-initial 'wy^':
( A K [ w y "^" ] C * A = M Y "^" )
( A n g [ w y "^" ] C * A = M Y "^" )
( A [ w y "^" ] C * A = M Y "^" )

;     ii) Delete circumflex in Velar-(or start-of-word)-plus-w^y, as here it
;         denotes the location of the syllable nucleus, not vowel lengthening:
( A K [ w "^" y ] C * A = W Y )
( A n g [ w "^" y ] C * A = W Y )
( A [ w "^" y ] C * A = W Y )

;    iii) Uncircumflexed 'wy' -- this is the default in monosyllables:
( A T T T [ w y ] "'" T A = W Y )
( A T T T [ w y ] G * A = W Y )
( A T T [ w y ] "'" T A = W Y )
( A T T [ w y ] G * A = W Y )
( A T [ w y ] "'" T A = W Y )
( A T [ w y ] G * A = W Y )
( A [ w y ] "'" T A = W Y )
( A [ w y ] G * A = W Y )

;    iv)  Circumflexed single 'w' in ultimas and monosyllables:
( [ w "^" ] C * A = W "^" )

;    v)  'w' as labialisation marker:
;        Labialising context ( = g|ng|# ) plus 'w' word-initially dealt with
;        here before penult vowels, as otherwise the 'w' would become 'W':
;        (H=V not 'w', T=C not 'w': gMrych but gWryw(aidd), gWrw, gWrol(i))
;     #g[w]RHT=M
;     #ng[w]RHT=M
;     #[w]RHT=M

;     vi)  Case where non-velar cons precedes 'w' and non-w, non-y vowel
;          follows in any form of word (eg. 'dweud', 'swalpio', 'swil'):
( A T T [ w ] I = M )
( A T T [ w ] i = M )
( A T T [ w ] u = M )
( A T [ w ] I = M )
( A T [ w ] i = M )
( A T [ w ] u = M )

;     vii) Circumflexed single y in monosyllables:
( A G * [ y "^" ] C * A = Y "^" )
( A G * [ y "+" ] C * A = Y "+" )

;    Vowels after labialising context eg. 'gwlad', 'ngwraig' (B = g | ng ):
;    #BwR[i]T#=I
;    #BwR[e]T#=E
;    #BwR[a]T#=A
;    #BwR[o]T#=O
;    #BwR[u]T#=U
;    #BwR[y]T#=Y
;    #BwR[w]T#=W

;    viii) Allow for cases like 'cwest', 'gwyn', 'chwyn', 'nghwest' (K = c|g|ch|ngh)
;     ie. where 'w' MUTT be a consonant:
( A K w [ i ] C * A = I )
( A K w [ e ] C * A = E )
( A K w [ a ] C * A = A )
( A K w [ o ] C * A = O )
( A K w [ u ] C * A = U )
( A K w [ y ] C * A = Y )


;    Deal with word-final non-diphthongising vowels after single quote (need
;    to specify monosyllabic context exactly, to avoid preempting single-quote
;    vowel rules for unstressed ULTIMAS where diphthongisation occurs):
;          Versions for where 1st cons (cluster) not 'w', 1st vowel is 'w':
( A G * w G * "'" [ i ] A = i )
( A G * w G * "'" [ e ] A = e )
( A G * w G * "'" [ a ] A = a )
( A G * w G * "'" [ o ] A = o )
( A G * w G * "'" [ u ] A = u )
( A G * w G * "'" [ w ] A = w )
;          Default versions, where 1st C (cluster) may have 'w', 
;          1st vowel not 'w' (cases of 'Gwy' come here):
( A C * H + C * "'" [ i ] A = i )
( A C * H + C * "'" [ e ] A = e )
( A C * H + C * "'" [ a ] A = a )
( A C * H + C * "'" [ o ] A = o )
( A C * H + C * "'" [ u ] A = u )
( A C * H + C * "'" [ w ] A = w )

;    Basic monosyllable rules for monophthongs:

;    In words where the 1st vowel is 'w': we need to use 'G' forms instead of 'C'
;    forms of rules, to avoid problems due to counting this 'w' as a consonant
;    for the purposes of the rule for the second vowel (which then gets stressed).
;    eg. cwbl  -> cwbwl -> kWbWl -> k u* b u* l          (if this precaution
;        bwled -> bwled -> bWlEd -> b u* l e* d          is not taken)

;               Versions for where 1st cons is 'w':
( A w [ i ] G * A = I )
( A w [ e ] G * A = E )
( A w [ a ] G * A = A )
( A w [ o ] G * A = O )
( A w [ u ] G * A = U )
( A w [ y ] G * A = Y )
( A w R [ i ] G * A = I )
( A w R [ e ] G * A = E )
( A w R [ a ] G * A = A )
( A w R [ o ] G * A = O )
( A w R [ u ] G * A = U )
( A w R [ w ] G * A = W )
( A w R [ y ] G * A = Y )
;                  Versions for where 1st cons is not 'w':
;    # char needed as these rules were firing for the last vowel in "gallu'i",
;    making the 'i' (wrongly) stressed - need to distinguish between start-of-wd
;    and single quote here.
;            (# = start or end of word)
( A G * [ i ] G * A = I )
( A G * [ e ] G * A = E )
( A G * [ a ] G * A = A )
( A G * [ o ] G * A = O )
( A G * [ u ] G * A = U )
( A G * [ y ] G * A = Y )
( A G * [ w ] G * A = W )

;       d) Vowels in unstressed penults before stress-marked ultimas or
;          in unstressed preantepenults before stress-marked antepenults

;     Versions to allow for case where cons is not 'w', 2nd vowel is 'w/':
( [ o i ] G * w / = o i )
( [ o y ] G * w / = o y )
( [ o u ] G * w / = o u )
( [ o e ] G * w / = o e )
( [ a i ] G * w / = a i )
( [ a u ] G * w / = a u )
( [ a e ] G * w / = a e )
( [ w y ] G * w / = w y )
( [ w "^" y ] G * w / = w "^" y )
( [ i w ] G * w / = i w )
( [ y w ] G * w / = y w )
( [ u w ] G * w / = u w )
( [ e w ] G * w / = e w )
( [ a w ] G * w / = a w )
( [ e i ] G * w / = e i )
( [ e y ] G * w / = e y )
( [ e u ] G * w / = e u )
( [ o w ] G * w / = o w )

( J [ a ] G * w / = a )
( J [ e ] G * w / = e )
( J [ o ] G * w / = o )

( [ i ] G * w / = i )
( [ e ] G * w / = e )
( [ a ] G * w / = a )
( [ o ] G * w / = o )
( [ w ] G * w / = w )
( [ u ] G * w / = u )
( [ y ] G * w / = y )
;    Default versions - cons may be 'w', 2nd vowel is not 'w'
;    (if cons *is* 'w', will automatically get counted as a 'C'):
( [ o i ] C * H + / = o i )
( [ o y ] C * H + / = o y )
( [ o u ] C * H + / = o u )
( [ o e ] C * H + / = o e )
( [ a i ] C * H + / = a i )
( [ a u ] C * H + / = a u )
( [ a e ] C * H + / = a e )
( V + [ w y ] C * H + / = M y )
( [ w y ] C * H + / = w y )
( [ w "^" y ] C * H + / = w "^" y )
( [ i w ] C * H + / = i w )
( [ y w ] C * H + / = y w )
( [ u w ] C * H + / = u w )
( [ e w ] C * H + / = e w )
( [ a w ] C * H + / = a w )
( [ e i ] C * H + / = e i )
( [ e y ] C * H + / = e y )
( [ e u ] C * H + / = e u )
( [ o w ] C * H + / = o w )

( J [ a ] C * H + / = a )
( J [ e ] C * H + / = e )
( J [ o ] C * H + / = o )

( [ i ] C * H + / = i )
( [ e ] C * H + / = e )
( [ a ] C * H + / = a )
( [ o ] C * H + / = o )
( [ w ] C * H + / = w )
( [ u ] C * H + / = u )
( [ y ] C * H + / = y )

;    Cases where stress was marked by a circumflex:

;    Versions to allow for case where cons is not 'w', 2nd vowel is 'w':
( [ o i ] G * w "^" = o i )
( [ o y ] G * w "^" = o y )
( [ o u ] G * w "^" = o u )
( [ o e ] G * w "^" = o e )
( [ a i ] G * w "^" = a i )
( [ a u ] G * w "^" = a u )
( [ a e ] G * w "^" = a e )
( V + [ w y ] G * w "^" = M y )
( [ w y ] G * w "^" = w y )
( [ w "^" y ] G * w "^" = w "^" y )
( [ i w ] G * w "^" = i w )
( [ y w ] G * w "^" = y w )
( [ u w ] G * w "^" = u w )
( [ e w ] G * w "^" = e w )
( [ a w ] G * w "^" = a w )
( [ e i ] G * w "^" = e i )
( [ e y ] G * w "^" = e y )
( [ e u ] G * w "^" = e u )
( [ o w ] G * w "^" = o w )

( J [ a ] G * w "^" = a )
( J [ e ] G * w "^" = e )
( J [ o ] G * w "^" = o )

( [ i ] G * w "^" = i )
( [ e ] G * w "^" = e )
( [ a ] G * w "^" = a )
( [ o ] G * w "^" = o )
( [ w ] G * w "^" = w )
( [ u ] G * w "^" = u )
( [ y ] G * w "^" = y )

;    Default versions:  no need to separate cases of [..]wH^ and [..]GH^

;    because if cons *is* 'w', this will automatically be counted as 'C':
( [ o i ] C * V + "^" = o i )
( [ o y ] C * V + "^" = o y )
( [ o u ] C * V + "^" = o u )
( [ o e ] C * V + "^" = o e )
( [ a i ] C * V + "^" = a i )
( [ a u ] C * V + "^" = a u )
( [ a e ] C * V + "^" = a e )
( V + [ w y ] C * V + "^" = M y )
( [ w y ] C * V + "^" = w y )
( [ w "^" y ] C * V + "^" = w "^" y )
( [ i w ] C * V + "^" = i w )
( [ y w ] C * V + "^" = y w )
( [ u w ] C * V + "^" = u w )
( [ e w ] C * V + "^" = e w )
( [ a w ] C * V + "^" = a w )
( [ e i ] C * V + "^" = e i )
( [ e y ] C * V + "^" = e y )
( [ e u ] C * V + "^" = e u )
( [ o w ] C * V + "^" = o w )

( J [ a ] C * V + "^" = a )

( J [ e ] C * V + "^" = e )
( J [ o ] C * V + "^" = o )

( [ i ] C * V + "^" = i )
( [ e ] C * V + "^" = e )
( [ a ] C * V + "^" = a )
( [ o ] C * V + "^" = o )
( [ u ] C * V + "^" = u )
( [ y ] C * V + "^" = y )

;   Allow for cases like "wla^n" where 'w' is labialisation marker:
;    #K[w]CV^=M
;    #K[w]CV+=M
;    #ng[w]CV^=M
;    #ng[w]CV+=M
;    #[w]CV^=M
;    #[w]CV+=M
;    [w]CV^=w
;    [w]CV+=w

;    e) vowels in unstressed penults after stress-marked antepenults

;    Versions to allow for case where 2nd cons is not 'w', 2nd vowel is 'w':
( / C * [ o i ] G * w C * A = o i )
( / C * [ o y ] G * w C * A = o y )
( / C * [ o u ] G * w C * A = o u )
( / C * [ o e ] G * w C * A = o e )
( / C * [ a i ] G * w C * A = a i )
( / C * [ a u ] G * w C * A = a u )
( / C * [ a e ] G * w C * A = a e )
( / [ w y ] G * w C * A = M y )
( / Q C * [ w y ] G * w C * A = w y )
( / C * [ w "^" y ] G * w C * A = w "^" y )
( / C * [ w y "^" ] G * w C * A = w y "^" )
( / C * [ i w ] G * w C * A = i w )
( / C * [ y w ] G * w C * A = y w )
( / C * [ u w ] G * w C * A = u w )
( / C * [ e w ] G * w C * A = e w )
( / C * [ a w ] G * w C * A = a w )
( / C * [ e i ] G * w C * A = e i )
( / C * [ e y ] G * w C * A = e y )
( / C * [ e u ] G * w C * A = e u )
( / C * [ o w ] G * w C * A = o w )
( / C * J [ a ] G * w C * A = a )
( / C * J [ e ] G * w C * A = e )
( / C * J [ o ] G * w C * A = o )
( / C * [ i ] Z + w C * A = i )
( / C * [ e ] Z + w C * A = e )
( / C * [ a ] Z + w C * A = a )
( / C * [ o ] Z + w C * A = o )
( / C * [ w ] Z + w C * A = w )
( / C * [ u ] Z + w C * A = u )
( / C * [ y ] Z + w C * A = y )
( "\\" C * [ o i ] G * w C * A = o i )
( "\\" C * [ o y ] G * w C * A = o y )
( "\\" C * [ o u ] G * w C * A = o u )
( "\\" C * [ o e ] G * w C * A = o e )
( "\\" C * [ a i ] G * w C * A = a i )
( "\\" C * [ a u ] G * w C * A = a u )
( "\\" C * [ a e ] G * w C * A = a e )
( "\\" [ w y ] G * w C * A = M y )
( "\\" Q C * [ w y ] G * w C * A = w y )
( "\\" C * [ w "^" y ] G * w C * A = w "^" y )
( "\\" C * [ w y "^" ] G * w C * A = w y "^" )
( "\\" C * [ i w ] G * w C * A = i w )
( "\\" C * [ y w ] G * w C * A = y w )
( "\\" C * [ u w ] G * w C * A = u w )
( "\\" C * [ e w ] G * w C * A = e w )
( "\\" C * [ a w ] G * w C * A = a w )
( "\\" C * [ e i ] G * w C * A = e i )
( "\\" C * [ e y ] G * w C * A = e y )
( "\\" C * [ e u ] G * w C * A = e u )
( "\\" C * [ o w ] G * w C * A = o w )
( "\\" C * J [ a ] G * w C * A = a )
( "\\" C * J [ e ] G * w C * A = e )
( "\\" C * J [ o ] G * w C * A = o )
( "\\" C * [ i ] Z + w C * A = i )
( "\\" C * [ e ] Z + w C * A = e )
( "\\" C * [ a ] Z + w C * A = a )
( "\\" C * [ o ] Z + w C * A = o )
( "\\" C * [ w ] Z + w C * A = w )
( "\\" C * [ u ] Z + w C * A = u )
( "\\" C * [ y ] Z + w C * A = y )
;    Default versions: no need to separate /C[..]GHC# and /C[..]wHC#
;    as if 2nd cons *is* 'w' it will automatically be counted as 'C':
( / C * [ o i ] C * V + C * A = o i )
( / C * [ o y ] C * V + C * A = o y )
( / C * [ o u ] C * V + C * A = o u )
( / C * [ o e ] C * V + C * A = o e )
( / C * [ a i ] C * V + C * A = a i )
( / C * [ a u ] C * V + C * A = a u )
( / C * [ a e ] C * V + C * A = a e )
( / [ w y ] C * V + C * A = M y )
( / Q C * [ w y ] C * V + C * A = w y )
( / C * [ w "^" y ] C * V + C * A = w "^" y )
( / C * [ w y "^" ] C * V + C * A = w y "^" )
( / C * [ i w ] C * V + C * A = i w )
( / C * [ y w ] C * V + C * A = y w )
( / C * [ u w ] C * V + C * A = u w )
( / C * [ e w ] C * V + C * A = e w )
( / C * [ a w ] C * V + C * A = a w )
( / C * [ e i ] C * V + C * A = e i )
( / C * [ e y ] C * V + C * A = e y )
( / C * [ e u ] C * V + C * A = e u )
( / C * [ o w ] C * V + C * A = o w )
( / C * J [ a ] C * V + C * A = a )
( / C * J [ e ] C * V + C * A = e )
( / C * J [ o ] C * V + C * A = o )
( / C * [ i ] Q C * V + C * A = i )
( / C * [ e ] Q C * V + C * A = e )
( / C * [ a ] Q C * V + C * A = a )
( / C * [ o ] Q C * V + C * A = o )
( / C * [ w ] Q C * V + C * A = w )
( / C * [ u ] Q C * V + C * A = u )
( / C * [ y ] Q C * V + C * A = y )
( "\\" C * [ o i ] C * V + C * A = o i )
( "\\" C * [ o y ] C * V + C * A = o y )
( "\\" C * [ o u ] C * V + C * A = o u )
( "\\" C * [ o e ] C * V + C * A = o e )
( "\\" C * [ a i ] C * V + C * A = a i )
( "\\" C * [ a u ] C * V + C * A = a u )
( "\\" C * [ a e ] C * V + C * A = a e )
( "\\" [ w y ] C * V + C * A = M y )
( "\\" Q C * [ w y ] C * V + C * A = w y )
( "\\" C * [ w "^" y ] C * V + C * A = w "^" y )
( "\\" C * [ w y "^" ] C * V + C * A = w y "^" )
( "\\" C * [ i w ] C * V + C * A = i w )
( "\\" C * [ y w ] C * V + C * A = y w )
( "\\" C * [ u w ] C * V + C * A = u w )
( "\\" C * [ e w ] C * V + C * A = e w )
( "\\" C * [ a w ] C * V + C * A = a w )
( "\\" C * [ e i ] C * V + C * A = e i )
( "\\" C * [ e y ] C * V + C * A = e y )
( "\\" C * [ e u ] C * V + C * A = e u )
( "\\" C * [ o w ] C * V + C * A = o w )
( "\\" C * J [ a ] C * V + C * A = a )
( "\\" C * J [ e ] C * V + C * A = e )
( "\\" C * J [ o ] C * V + C * A = o )
( "\\" C * [ i ] Q C * V + C * A = i )
( "\\" C * [ e ] Q C * V + C * A = e )
( "\\" C * [ a ] Q C * V + C * A = a )
( "\\" C * [ o ] Q C * V + C * A = o )
( "\\" C * [ w ] Q C * V + C * A = w )
( "\\" C * [ u ] Q C * V + C * A = u )
( "\\" C * [ y ] Q C * V + C * A = y )


;  f) Vowels in stressed penults before non-stress-marked ultimas (default)
;==========================================================================

;    Sorting out orthographic 'w' in (putative) penult:
;------------------------------------------------------

;    i) 'ywy' or Vwy cluster, eg. 'tywyllwch':
( [ y w y ] Z + w G * A = y M Y )
( [ y w y ] Q C * V + C * A = y M Y )
( V + [ w y ] Q C * V + C * A = M Y )

;    ii)  'wyw' cluster:
;    Versions where 2nd 'w' is cons and no cons intervenes
;    but (non-'w') vowel follows (eg. 'gwywo', 'dwywaith'):
( A K [ w y w ] H + = M Y M )
( A n g [ w y w ] H + = M Y M )
( A T [ w y w ] H + = M Y M )
( A [ w y w ] H + = W Y M )
( K [ w y w ] H + = W Y M )
( n g [ w y w ] H + = W Y M )
( T [ w y w ] H + = W Y M )
( [ w y w ] H + = W Y M )
;     Versions where 2nd 'w' is vowel and no cons intervenes (eg. 'gwyw'):
( A K [ w y w ] C * A = M Y W )
( A n g [ w y w ] C * A = M Y W )
( A [ w y w ] C * A = M Y W )
( K [ w y w ] C * A = W Y W )
( n g [ w y w ] C * A = W Y W )
( [ w y w ] C * A = W Y W )
;    iii)  'wy' cluster:
;    Versions where 2nd 'w' is vowel, at least 1 cons precedes it (eg. 'gwydrwr'):
( A K [ w y ] Z + w C * A = M Y )
( A n g [ w y ] Z + w C * A = M Y )
( A [ w y ] Z + w C * A = W Y )
( K [ w y ] Z + w C * A = W Y )
( n g [ w y ] Z + w C * A = W Y )
( [ w y ] Z + w C * A = W Y )
;     Versions where 2nd vowel is 'wy' and at least 1 non-'w' cons precedes it
;     (eg. 'gwyddbwyll') - the 'w' will be counted under the 1st 'C' here:
( A K [ w y ] T C * y C * A = M Y )
( A n g [ w y ] T C * y C * A = M Y )
( A [ w y ] T C * y C * A = W Y )
( K [ w y ] T C * y C * A = W Y )
( n g [ w y ] T C * y C * A = W Y )
( [ w y ] T C * y C * A = W Y )
;    Default versions - neither following cons nor vowel is 'w' (eg 'gwylan'):
( A K [ w y ] G * H + C * A = M Y )
( A n g [ w y ] G * H + C * A = M Y )
( A [ w y ] G * H + C * A = W Y )
( K [ w y ] G * H + C * A = W Y )
( n g [ w y ] G * H + C * A = W Y )
( [ w y ] G * H + C * A = W Y )

;    Rules for wy in penult after at least 1 cons (not c,g,ch,ng,ngh,w)
;    where following cons (if any) is not 'w':
;    i)  Where ultima vowel is 'w':
( T [ w y ] G * w C * A = W Y )
;   ii)  Default (where ultima vowel not 'w'):
( T [ w y ] G * H + C * A = W Y )

;   Two vowel graphemes in penult, NOT 'wy' or 'ywy':
;----------------------------------------------------
;   Versions to deal with case where 1st cons is not 'w', 2nd vowel is 'w':
( [ o i ] G * w G * A = O I )
( [ o y ] G * w G * A = O Y )
( [ o u ] G * w G * A = O U )
( [ o e ] G * w G * A = O E )
( [ a i ] G * w G * A = A I )
( [ a u ] G * w G * A = A U )
( [ a e ] G * w G * A = A E )
( [ i w ] G * w G * A = I W )
( [ y w ] Z + w G * A = Y W )
( [ u w ] G * w G * A = U W )
( [ e w ] G * w G * A = E W )
( [ a w ] G * w G * A = A W )
( [ e i ] G * w G * A = E I )
( [ e y ] G * w G * A = E Y )
( [ e u ] G * w G * A = E U )
( [ o w ] G * w G * A = O W )
( [ w "^" y ] G * w G * A = W Y )
( [ w "+" y ] G * w G * A = W Y )
( [ w y "^" ] G * w G * A = w Y "^" )
( [ w y "+" ] G * w G * A = w Y "+" )
;    Versions where intervening cons is yod (2nd vowel therefore not 'w'):
;    V = 1 or more of  a|e|i|o|u|w|y ;  H = 1 or more of  a|e|i|o|u|y (no 'w')
;     I = 1 of a | e | o 
( [ o ] J I C * A = O )
( [ a ] J I C * A = A )
( [ e ] J I C * A = E )
( [ o ] J I H + C * A = O )
( [ a ] J I H + C * A = A )
( [ e ] J I H + C * A = E )
( [ w "^" y ] J I C * A = W Y )
( [ w y "^" ] J I C * A = M Y "^" )
( [ w "^" y ] J I H + C * A = W Y )
( [ w y "^" ] J I H + C * A = M Y "^" )

;     Versions where no consonant intervenes:

( [ o ] J I C * A = O )

( [ o y ] V + C * A = O Y )
( [ o u ] V + C * A = O U )
( [ o e ] V + C * A = O E )

( [ a ] J I C * A = A )

( [ a u ] V + C * A = A U )
( [ a e ] V + C * A = A E )
( [ i w ] i V + C * A = I W )
( [ y w ] i V + C * A = Y W )
( [ u w ] i V + C * A = U W )
( [ e w ] i V + C * A = E W )
( [ a w ] i V + C * A = A W )
( [ i w ] V + C * A = I M )
( [ y w ] V + C * A = Y M )
( [ u w ] V + C * A = U M )
( [ e w ] V + C * A = E M )
( [ a w ] V + C * A = A M )

( [ e ] J I C * A = E )

( [ e y ] V + C * A = E Y )
( [ e u ] V + C * A = E U )
( [ o w ] i V + C * A = O W )
( [ o w ] V + C * A = O M )
( [ w "^" y ] V + C * A = W Y )
( [ w y "^" ] V + C * A = M Y "^" )

;    Default versions: 1st cons may be 'w' (no separate [..]wHC# and [..]GHC# ):
;     (but watch out for 'Abbeycwmhir' etc - *only* the 1st C can be /w/).
( [ o i ] Q G * V + C * A = O I )
( [ o y ] Q G * V + C * A = O Y )
( [ o u ] Q G * V + C * A = O U )
( [ o e ] Q G * V + C * A = O E )
( [ a i ] Q G * V + C * A = A I )
( [ a u ] Q G * V + C * A = A U )
( [ a e ] Q G * V + C * A = A E )
( [ i w ] Q G * V + C * A = I W )
( [ y w ] Q G * V + C * A = Y W )
( [ u w ] Q G * V + C * A = U W )
( [ e w ] Q G * V + C * A = E W )
( [ a w ] Q G * V + C * A = A W )
( [ e i ] Q G * V + C * A = E I )
( [ e y ] Q G * V + C * A = E Y )
( [ e u ] Q G * V + C * A = E U )
( [ o w ] Q G * V + C * A = O W )
( [ w "^" y ] Q G * V + C * A = W Y )
( [ w y "^" ] Q G * V + C * A = w Y "^" )

;  Add case of orthographic "aa" (accasionally found)
( [ a a ] Q G * V + C * A = A A )

;    'i'-plus-vowel(s) in ultima put here in 'penult' section instead of the 
;     following 'ultima' section because otherwise this input pattern is treated
;     as a sequence of diphthong-in-penult, no cons, monophthong-in-ultima:  so
;     it needs to be picked up at this earlier stage:
;     ( I = a | e | o ,  ie. all vowels that can follow yod)
( J [ a u ] A = a u )
;;( [ i ] I D * C * A = J )
;;( [ i ] I "'" V + C * A = J )
;;( [ i ] I "^" V + C * A = J )

;   'i-plus-single-vowel' in penult:
( J [ a ] Z + w C * A = A )
( J [ e ] Z + w C * A = E )
( J [ o ] Z + w C * A = O )
;   Where string is trisyllabic with 'w' in ultima:
( J [ a ] Z + V + Z + w C * A = a )
( J [ e ] Z + V + Z + w C * A = e )
( J [ o ] Z + V + Z + w C * A = o )
;    Default versions:
( J [ a ] Q C * V + C * A = A )
( J [ e ] Q C * V + C * A = E )
( J [ o ] Q C * V + C * A = O )

;   This ultima looks like penult to rules, so put here before single [y] rules:
( [ y w ] G * A = y w )


;    Single vowel in penult:
;===========================

;   For the case where a cons intervenes, all three possible separate
;   versions are given, to avoid risk of antepenult looking like a 
;   penult (and so getting stressed) due to the presence of a 'w' in
;   the ultima or antepenult, eg. 'ymwrthod', 'gwargaledwch', 'papurwr'
;   (this might happen if just '[..]QCVC#' was specified):

;    Versions where ultima V is 'Vw' diphthong, at least one C must intervene:
( [ i ] Z + H + w G * A = I )
( [ e ] Z + H + w G * A = E )
( [ a ] Z + H + w G * A = A )
( [ o ] Z + H + w G * A = O )
( [ w ] Z + H + w G * A = W )
( [ u ] Z + H + w G * A = U )
( [ y ] Z + H + w G * A = Y )

( [ i ] T w H + w G * A = I )
( [ e ] T w H + w G * A = E )
( [ a ] T w H + w G * A = A )
( [ o ] T w H + w G * A = O )
( [ w ] T w H + w G * A = W )
( [ u ] T w H + w G * A = U )
( [ y ] T w H + w G * A = Y )
;    Versions where ultima V is 'w' monophthong, at least one C must intervene:
( [ i ] Z + w G * A = I )
( [ e ] Z + w G * A = E )
( [ a ] Z + w G * A = A )
( [ o ] Z + w G * A = O )
( [ w ] Z + w G * A = W )
( [ u ] Z + w G * A = U )
( [ y ] Z + w G * A = Y )
;    Versions where intervening C is 'w', ultima V not 'w':
( [ i ] G * w H + G * A = I )
( [ e ] G * w H + G * A = E )
( [ a ] G * w H + G * A = A )
( [ o ] G * w H + G * A = O )
( [ u ] G * w H + G * A = U )
( [ y ] G * w H + G * A = Y )

;   Default versions: single vowel in penult, where neither ultima V nor intervening C is 'w':
;=============================================================================================

( [ i ] Z + H + G * A = I )
( [ e ] Z + H + G * A = E )
( [ a ] Z + H + G * A = A )
( [ o ] Z + H + G * A = O )
( [ w ] Z + H + G * A = W )
( [ u ] Z + H + G * A = U )
( [ y ] Z + H + G * A = Y )

( [ i ] Z + H H G * A = I )
( [ e ] Z + H H G * A = E )
( [ a ] Z + H H G * A = A )
( [ o ] Z + H H G * A = O )
( [ w ] Z + H H G * A = W )
( [ u ] Z + H H G * A = U )
( [ y ] Z + H H G * A = Y )


;   Versions where *NO* C intervenes and V does not start with 'w':
;   i) Cases where 2nd vowel is a diphthong:
( [ a ] y w G * A = A )
( [ a ] i w G * A = A )
( [ e ] i w G * A = E )
( [ o ] i w G * A = O )
( [ a ] o V + G * A = A )
( [ e ] o V + G * A = E )
( [ u ] o V + G * A = U )
( [ e ] a V + G * A = E )
( [ o ] a V + G * A = O )
( [ u ] a V + G * A = U )
( [ a ] u w G * A = A )
( [ e ] u w G * A = E )
( [ o ] u w G * A = O )
( [ a ] e V + G * A = A )
( [ o ] e V + G * A = O )
( [ u ] e V + G * A = U )
;   ii)  1st V is monophthong, followed by diaeresis (not found by 'hashtest'):
;   [a]"VG#=A
;   [e]"VG#=E
;   [i]"VG#=I
;   [o]"VG#=O
;   [u]"VG#=U
;   [y]"VG#=Y
;   [w]"VG#=W
;   iii) Both V's monophthongs, no " (all possible non-diphthong combinations):
( [ a ] o G * A = A )
( [ e ] a G * A = E )
( [ e ] o G * A = E )
( [ o ] a G * A = O )
( [ o ] u G * A = O )
( [ u ] a G * A = U )
( [ u ] e G * A = U )
( [ u ] o G * A = U )

;   To avoid 'wy' in ultima looking like 2 separate sylls, ie Wy 
;   (eg. 'gwyddbwyll') - put here despite being an ultima problem,
;   because it can 'look like' penult-plus-ultima to the rules.
;   But first sort out case where 'w' is cons (eg. 'gwewyr', 'awyr'):
( H + [ w ] y G * A = M )
( H + w [ y ] G * A = y )
( Z + [ w y ] G * A = w y )
;   Next rule must have 'T','G' in to ensure optional cons doesn't allow a cons
;   'w' to get treated like a vowel 'w', as in 'widw' (wrongly 'WIdw');
;   Also must have 'G' at end to block case where 'w' in antepenult looks like
;   a penult 'w' due to presence of 'w' in ultima (eg. 'gwdihw^'):
( [ w ] Z + V + G * A = W )

;   g)  Vowels in unstressed ultimas, antepenults (default), & unstressed penults

;     Sequences of three vowel graphemes

( [ o ] J V + C * = o )
( [ a ] J V + C * = a )

( [ i w ] i V + C * = i w )
( [ y w ] i V + C * = y w )
( [ u w ] i V + C * = u w )
( [ e w ] i V + C * = e w )
( [ a w ] i V + C * = a w )
( [ i w ] V + C * = i M )
( [ y w ] V + C * = y M )
( [ u w ] V + C * = u M )
( [ e w ] V + C * = e M )
( [ a w ] V + C * = a M )

( [ e i ] V + C * = e J )
( [ o w ] V + C * = o M )

;      Diphthongs and diphthong blends in ultima:
( [ o "'" i ] = o "'" i )
( [ o i ] = o i )
( [ o y ] = o y )
( [ o "'" u ] = o "'" u )
( [ o u ] = o u )
( [ o e ] = o e )
( [ a "'" i ] = a "'" i )
( [ a i ] = a i )
( [ a "'" u ] = a "'" u )
( [ a u "'" r ] A = a u "'" r )
( [ a u "'" n ] A = a u "'" n )
( [ a u ] = a u )
( [ a e ] = a e )
( [ w y ] = w y )
( [ i "'" w ] = i "'" w )
( [ i w ] = i w )
( [ y w ] = y w )
( [ u "'" w ] = u "'" w )
( [ u w ] = u w )
( [ e w ] = e w )
( [ a w ] = a w )
( [ e "'" i ] = e "'" i )
( [ e i ] = e i )
( [ e y ] = e y )
( [ e "'" u ] = e "'" u )
( [ e u ] = e u )
( [ o w ] = o w )

;;( J [ a ] = a )
;;( J [ e ] = e )
;;( J [ o ] = o )

;         'y' in unstressed ultima:
( w G * [ y ] C * A = y )
( w G * [ y ] A = y )
;    Default:
( V + C * [ y ] C * A = y )
( V + C * [ y ] A = y )

;         'y' in unstressed antepenult:
( [ y ] = y )

;    Deal with word-final non-diphthongising vowels after single quote (those
;    vowel graphemes which can diphthongise with the preceding vowel grapheme
;    will already have been picked up, so no need to state the context exactly):
( "'" [ i ] A = i )
( "'" [ e ] A = e )
( "'" [ a ] A = a )
( "'" [ o ] A = o )
( "'" [ u ] A = u )
( "'" [ w ] A = w )

;   'w' is either cons or vowel depending on context:
( K [ w ] H + = M )
( n g [ w ] H + = M )
( A [ w ] H + = M )
( H + T T T [ w ] H + = M )
( H + T T [ w ] H + = M )
( H + T [ w ] H + = M )
( [ w ] = w )

;     Default for monophthongs in unstressed ultimas, antepenults 
;     and unstressed penults (is the default for all vowel graphemes):
( [ i ] = i )
( [ e ] = e )
( [ a ] = a )
( [ o ] = o )
( [ u ] = u )
( [ y ] = y )

;     Defaults for consonants:
( [ b ] = b )
( [ c ] = c )
( [ d ] = d )
( [ f ] = f )
( [ g ] = g )
( [ h ] = h )
( [ J ] = J )
( [ j ] = j )
( [ k ] = k )
( [ l ] = l )
( [ m ] = m )
( [ n ] = n )
( [ p ] = p )
( [ q ] = q )
( [ r ] = r )
( [ s ] = s )
( [ t ] = t )
( [ v ] = v )
( [ w ] = w )
( [ x ] = x )
( [ z ] = z )
( [ X ] = X )
( [ S ] = S )

))

(provide 'gogwelstr)


