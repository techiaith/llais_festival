(lts.ruleset
;  Name of rule set
  gogwel
;  Sets used in the rules
(
  ( V a e i o u w y A E I O U W Y )
  ( C b c d f g h j k l m n p q r s t v x z M J X S "-" )
  ( Q b c d f g h j k l m n p q r s t v x z M J X S "-" )
  ( D b d f g )
  ( Z "-" # )
)
;  Rules
(
;    North Welsh version of grapheme-to-phoneme rules:
;    -------------------------------------------------

;   # symbols

;   	i	[i]
;   	e	[e]
;   	a	[a]
;   	o	[o]
;   	u	[u]
;       y       [high central unrounded]
;   	@	[schwa]
;   	ii	[i:]
;   	ee	[e:]
;   	aa	[a:]
;   	oo	[o:]
;   	uu	[u:]
;       yy      [high central unrounded]
;       @@      [long schwa]
;       oa      [oa (as in English "paw"]
;   	oi	[oi]
;       ou      [ou]
;       oy      [oy]
;   	ai	[ai]
;       au      [au]
;       ay      [ay (corresponds to orth "au"]
;       aay     [aay (corresponds to orth "ae"]
;   	uy	[uy]
;   	iu	[iu]
;   	ei	[ei]
;   	eu	[eu]
;       ey      [ey]
;       yu      [yu]

;   	p	[p]
;   	t	[t]
;   	k	[k]
;   	b	[b]
;   	d	[d]
;   	g	[g]
;   	f	[f]
;   	th	[theta]
;   	h	[h]
;   	x	[x (voiceless uvular fricative)]
;   	v	[v]
;   	dh	[edh]
;   	s	[s]
;   	z	[z]
;   	sh	[voiceless palato-alveolar fricative]
;       zh      [voiced palato-alveolar fricative]
;   	ch	[voiceless palato-alveolar affricate]
;   	jh	[voiced palato-alveolar affricate]
;   	lh	[voiceless alveolar lateral fricative]
;   	rh	[voiceless alveolar apical trill]
;   	l	[l]
;   	r	[r]
;   	w	[w]
;   	j	[voiced palatal approximant]
;   	m	[m]
;   	n	[n]
;   	ng	[voiced velar nasal]
;   	mh	[voiceless m]
;   	nh	[voiceless n]
;   	ngh	[voiceless velar nasal]
;   	lw	[labialised voiced alveolar lateral approximant]
;   	nw	[labialised voiced alveolar nasal stop]
; 	rw	[labialised voiced alveolar central approximant]

;   # variables

;         V       one or more of [a e i o u w y A E I O U W Y]
;         C       zero or more of [b c d f g h j k l m n p q r s t v x z M J]       
;         Q       [b c d f g h j k l m n p q r s t v x z M J -]
;         D       [b d f g ff ch dd]
;         P       [s ll]

;   # end symbols	

( [ - ] = )
( [ "\"" ] = )

;; Add some frequently-hyphenated proper nouns at the start
( [ p r Y s ] Z = p r yy1 s )
( [ j O n e s ] Z = jh ou1 n z )
( [ d A v J e s ] Z = d ei1 v ii z )

;        Put labialised consonant rules first, to preempt the 'w' rules
;         (as the labialised consonant rules are more specific).
( [ q l ] = lw )
( [ q n ] = nw )
( [ q r ] = rw )

( Z [ t s i ] V = ch )

;; Hard-wire in some morphemic info to force syllable boundary
;; Especially important where morpheme ends in /m,n,r/ and following cons is /hh/
( [ a b e r ] C = a b e r )
( [ l l a n ] C = lh a n )
( [ l l A n ] C = lh a1 n )
( [ c w m ] C = k u m )
( [ c W m ] C = k u1 m )

; 	Rules for diphthongs and circumflexed or grave'd monophthongs:

( [ s I ] "\"" = s ii1 )
( [ s I ] a = s ii1 )
( [ s I ] e = s ii1 )
( [ s I ] o = s ii1 )
( [ s J ] a = sh )
( [ s J ] e = sh )
( [ s J ] o = sh )
( [ s J ] A = sh )
( [ s J ] E = sh )
( [ s J ] O = sh )
( [ s J ] a = sh )
( [ s J ] e = sh )
( [ s J ] o = sh )
( [ s J ] A = sh )
( [ s J ] E = sh )
( [ s J ] O = sh )

( [ i ^ ] = ii )
( [ i "+" ] = ii )
( [ I ^ ] = ii1 )
( [ I "+" ] = ii1 )
( [ i "\\" ] = i )
( [ I "\\" ] = i1 )
( [ I W ] = iu1 )
( [ I "'" W ] = iu1 )
( [ i "'" w ] = iu )
( [ i w ] = iu )

( [ u ^ ] = yy )
( [ u "+" ] = yy )
( [ U ^ ] = yy1 )
( [ U "+" ] = yy1 )
( [ u "\\" ] = y )
( [ U "\\" ] = y1 )
( [ U W ] = yu1 )
( [ U "'" W ] = yu1 )
( [ u "'" w ] = yu )
( [ u w ] = yu )

( [ E ^ ] = ee1 )
( [ E "+" ] = ee1 )
( [ e ^ ] = ee )
( [ e "+" ] = ee )
( [ E "\\" ] = e1 )
( [ e "\\" ] = e )
( [ E W ] = eu1 )
( [ E "'" W ] = eu1 )
( [ e "'" w ] = eu )
( [ e w ] = eu )
( [ E I ] = ei1 )
( [ E "'" I ] = ei1 )
( [ e "'" i ] = ei )
( [ e i ] = ei )
( [ E Y ] = ey1 )
( [ e y ] = ey )
( [ E U ] = ey1 )
( [ E "'" U ] = ey1 )
( [ e "'" u ] = ey )
( [ e u ] = ey )

( [ A I ] = ai1 )
( [ A "'" I ] = ai1 )
( [ a "'" i ] = ai )
( [ a i ] = ai )
( [ A U ] = ay1 )
( [ A "'" U ] = ay1 )

( [ a u ] Z = ay )
;;;;;;;;( [ a u ] Z = a )
;;;;;;;;( [ a u ] Z = e )

( [ a "'" u ] = ay )
( [ a u ] = ay )
( [ A W ] = au1 )

( [ A A ] = aa1 )

( [ A "'" W ] = au1 )
( [ a "'" w ] = au )
( [ a w ] = au )
( [ A ^ "'" i ] = aay1 )
( [ A "+" "'" i ] = aay1 )
( [ a ^ "'" i ] = aay1 )
( [ a "+" "'" i ] = aay1 )
( [ A E ] = aay1 )
( [ a e ] = aay )
( [ A ^ "'" u ] = aay1 )
( [ A "+" "'" u ] = aay1 )
( [ a ^ "'" u ] = aay )
( [ a "+" "'" u ] = aay )
( [ A ^ ] = aa1 )
( [ A "+" ] = aa1 )
( [ a ^ ] = aa )
( [ a "+" ] = aa )
( [ A "\\" ] = a1 )
( [ a "\\" ] = a )

( [ O ^ ] = oo1 )
( [ O "+" ] = oo1 )
( [ o ^ ] = oo )
( [ o "+" ] = oo )
( [ O "\\" ] = o1 )
( [ o "\\" ] = o )
( [ O Y ] = oy1 )
( [ o y ] = oy )
( [ O U ] = oy1 )
( [ O "'" U ] = oy1 )
( [ o "'" u ] = oy )
( [ o u ] = oy )
( [ O W ] = ou1 )
( [ O "'" W ] = ou1 )
( [ o "'" w ] = ou )
( [ o w ] = ou )
( [ O E ] = oy1 )
( [ o e ] = oy )
( [ O I ] = oi1 )
( [ O "'" I ] = oi1 )
( [ o "'" i ] = oi )
( [ o i ] = oi )

( [ Y ^ ] = yy1 )
( [ Y "+" ] = yy1 )
( [ y ^ ] = yy )
( [ y "+" ] = yy )
( [ Y "\\" ] = y1 )
( [ y "\\" ] = y )
( [ Y W ] = yu1 )
( [ Y "'" W ] = yu1 )
( [ y "'" w ] = yu )
( [ y w ] = yu )


( [ W ^ ] = uu1 )
( [ W "+" ] = uu1 )
( [ w ^ ] = uu )
( [ w "+" ] = uu )
( [ W "\\" ] = u1 )
( [ w "\\" ] = u )
( [ W Y ] = uy1 )
( V + [ w y ] = w y )
( [ w y ] = uy )
( [ w "'" i ] = uy )
( [ w "'" u ] = uy )

;       Rules for consonants:

( [ p h ] = f )
( [ p p ] = p )
( [ p ] = p )
( [ t h ] = th )
( [ t t ] = t )
( [ t s h ] = ch )
( [ t s ] V + = ch )
( [ t ] = t )
( [ c h ] = x )
( [ c c ] = k )
( [ c k ] = k )
( [ c ] = k )
( s [ b ] = p )
( [ b b ] = b )
( [ b ] = b )
( [ d d ] = dh )
( [ d s h ] = jh )
( [ d s ] V + = jh )
( s [ d ] = t )
( [ d ] = d )
( s [ g ] = k )
( [ g g ] = g )
( [ g ] = g )
( [ f f ] = f )
( [ f ] = v )
( [ j ] = jh )
( [ J ] = j )
( [ l l ] = lh )
( [ l ] = l )
( Z [ r h ] = rh )
( Z a n [ r h ] = rh )
( V + [ r h ] V + = r hh )
( Q [ r h ] = rh )
( [ r r ] = r )
( [ r ] = r )
( [ s s ] = s )
( [ s h ] = sh )
( [ s ] = s )

( V + [ m h ] V + = m hh )
( V + [ m h ] w = m hh )
( V + [ m h r ] = m rh )
( V + [ m h l ] = m lh )
( w [ m h ] V + = m hh )
( w [ m h ] w = m hh )
( w [ m h r ] = m rh )
( w [ m h l ] = m lh )

;( V + [ m h ] V + = mh )
;( V + [ m h ] w = mh )
;( V + [ m h r ] = mh r )
;( V + [ m h l ] = mh l )
;( w [ m h ] V + = mh )
;( w [ m h ] w = mh )
;( w [ m h r ] = mh r )
;( w [ m h l ] = mh l )

( Z [ m h ] = mh )

( V + [ n h ] V + = n hh )
( V + [ n h ] w = n hh )
( V + [ n h r ] = n rh )
( V + [ n h l ] = n lh )
( w [ n h ] V + = n hh )
( w [ n h ] w = n hh )
( w [ n h r ] = n rh )
( w [ n h l ] = n lh )

;( V + [ n h ] V + = nh )
;( V + [ n h ] w = nh )
;( V + [ n h r ] = nh r )
;( V + [ n h l ] = nh l )
;( w [ n h ] V + = nh )
;( w [ n h ] w = nh )
;( w [ n h r ] = nh r )
;( w [ n h l ] = nh l )

( Z [ n h ] = nh )

( V + [ n g h ] V + = ng hh )
( V + [ n g h ] w = ng hh )
( V + [ n g h r ] = ng rh )
( V + [ n g h l ] = ng lh )
( w [ n g h ] V + = ng hh )
( w [ n g h ] w = ng hh )
( w [ n g h r ] = ng rh )
( w [ n g h l ] = ng lh )

;( V + [ n g h ] V + = ngh )
;( V + [ n g h ] w = ngh )
;( V + [ n g h r ] = ngh r )
;( V + [ n g h l ] = ngh l )
;( w [ n g h ] V + = ngh )
;( w [ n g h ] w = ngh )
;( w [ n g h r ] = ngh r )
;( w [ n g h l ] = ngh l )

( Z [ n g h ] = ngh )

( [ n g ] = ng )
( [ n n ] = n )
( [ n ] c = ng )
( [ n ] = n )
( [ m m ] = m )
( [ m ] = m )
( [ r r ] = r )
( [ h ] = hh )
( [ M ] = w )
( [ X ] = ch )
( [ S ] = sh )

;  k.q.v.x,z: In English alphabet but not Welsh one:  added to deal
;           with the occasional English word.

( [ k ] = k )
( [ k k ] = k )
( [ q u ] = k w )
( [ v v ] = v )
( [ v ] = v )
( [ x x ] = k s )
( [ x ] = k s )
( [ z z ] = z )
( [ z ] = z )

( [ "." ] = )
( [ ! ] = ! )
;    4.11.97 - retain hyphen so as to be able to force a syll boundary later
;;;;( [ - ] = - )
( [ "'" ] = )
( [ "\"" ] = )
( [ ^ ] = )
( [ "+" ] = )
( [ _ ] = )
( [ "\\" ] = )
( [ % ] = )

; 	Rules for (unmarked) monophthongs:
;       ( D b d f g )

( [ I ] D V + C * Z = ii1 )
( [ I ] s V + C * Z = ii1 )
( [ I ] d d V + C * Z = ii1 )
( [ I ] c h V + C * Z = ii1 )
( [ I ] f f V + C * Z = ii1 )
( [ I ] t h V + C * Z = ii1 )
( [ I ] "\"" = ii1 )
( [ I ] D Z = ii1 )
( [ I ] s Z = ii1 )
( [ I ] d d Z = ii1 )
( [ I ] c h Z = ii1 )
( [ I ] f f Z = ii1 )
( [ I ] t h Z = ii1 )
( [ I ] Z = ii1 )
( [ I ] = i1 )
( [ i i ] = ii )
( [ i ] = i )

( [ U ] D V + C * Z = yy1 )
( [ U ] s V + C * Z = yy1 )
( [ U ] d d V + C * Z = yy1 )
( [ U ] c h V + C * Z = yy1 )
( [ U ] f f V + C * Z = yy1 )
( [ U ] t h V + C * Z = yy1 )
( [ U ] "\"" = yy1 )
( [ U ] D Z = yy1 )
( [ U ] s Z = yy1 )
( [ U ] d d Z = yy1 )
( [ U ] c h Z = yy1 )
( [ U ] f f Z = yy1 )
( [ U ] t h Z = yy1 )
( [ U ] Z = yy1 )
( [ U ] = y1 )
( [ u ] = y )

( [ E ] D V + C * Z = ee1 )
( [ E ] s V + C * Z = ee1 )
( [ E ] d d V + C * Z = ee1 )
( [ E ] c h V + C * Z = ee1 )
( [ E ] f f V + C * Z = ee1 )
( [ E ] t h V + C * Z = ee1 )
( [ E ] "\"" = ee1 )
( [ E ] D Z = ee1 )
( [ E ] s Z = ee1 )
( [ E ] d d Z = ee1 )
( [ E ] c h Z = ee1 )
( [ E ] f f Z = ee1 )
( [ E ] t h Z = ee1 )
( [ E ] Z = ee1 )
( [ E ] = e1 )
( [ e e ] = ii )
( [ e ] = e )

( [ A ] D V + C * Z = aa1 )
( [ A ] s V + C * Z = aa1 )
( [ A ] d d V + C * Z = aa1 )
( [ A ] c h V + C * Z = aa1 )
( [ A ] f f V + C * Z = aa1 )
( [ A ] t h V + C * Z = aa1 )
( [ A ] "\"" = aa1 )
( [ A ] D Z = aa1 )
( [ A ] s Z = aa1 )
( [ A ] d d Z = aa1 )
( [ A ] c h Z = aa1 )
( [ A ] f f Z = aa1 )
( [ A ] t h Z = aa1 )
( [ A ] Z = aa1 )
( [ A ] = a1 )
( [ a a ] = aa )
( [ a ] = a )

( [ O ] D V + C * Z = oo1 )
( [ O ] s V + C * Z = oo1 )
( [ O ] d d V + C * Z = oo1 )
( [ O ] c h V + C * Z = oo1 )
( [ O ] f f V + C * Z = oo1 )
( [ O ] t h V + C * Z = oo1 )
( [ O ] "\"" = oo1 )
( [ O ] D Z = oo1 )
( [ O ] s Z = oo1 )
( [ O ] d d Z = oo1 )
( [ O ] c h Z = oo1 )
( [ O ] f f Z = oo1 )
( [ O ] t h Z = oo1 )
( [ O ] Z = oo1 )
( [ O ] = o1 )
( [ o o ] = oo )
( [ o ] = o )

( c [ Y ] d "-" = yy1 )
( [ Y ] Q C * V + = @1 )
( [ Y ] "\"" = yy1 )
( [ Y ] D Z = yy1 )
( [ Y ] s Z = yy1 )
( [ Y ] d d Z = yy1 )
( [ Y ] c h Z = yy1 )
( [ Y ] f f Z = yy1 )
( [ Y ] t h Z = yy1 )
( [ Y ] Q C * Z = y1 )
( [ Y ] Z = yy1 )
( [ y y ] = yy )
( [ y ] C * Z = y )
( [ y ] = @ )

( [ W ] D V + C * Z = uu1 )
( [ W ] s V + C * Z = uu1 )
( [ W ] d d V + C * Z = uu1 )
( [ W ] c h V + C * Z = uu1 )
( [ W ] f f V + C * Z = uu1 )
( [ W ] t h V + C * Z = uu1 )
( [ W ] "\"" = uu1 )
( [ W ] D Z = uu1 )
( [ W ] s Z = uu1 )
( [ W ] d d Z = uu1 )
( [ W ] c h Z = uu1 )
( [ W ] f f Z = uu1 )
( [ W ] t h Z = uu1 )
( [ W ] Z = uu1 )
( [ W ] = u1 )
( [ w w ] = uu )
( [ w ] = u )

))

(provide 'gogwel)


