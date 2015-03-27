
********************************************************
*         Llais Testun i lefaru Cymraeg FestVox        *
*                                                      *
*               Llais : cb_cy_llg_diphone              *
*               Fersiwn : 1.1.0                        *
*                                                      *
*        Technolegau Iaith (Canolfan Bedwyr)           *
*                                                      *
*               Prifysgol Bangor University            *
*                   Copyright (c) 2012                 *
*                   Cedwir Pob Hawl.                   * 
*                                                      *
********************************************************


Sylwadau

Mae'r cyhoeddiad hwn yn fersiwn wedi'i ddiweddaru o lais gwrwyaidd deuffon o Ogledd Cymru, sy'n gweithio o fewn fframwaith Festival. 
Rhyddhawyd y llais yn wreiddiol fel rhan o broject WISPR, a'i ariannwyd gan raglen INTERREG IIIA yr Undeb Ewropeiaidd. 

LLEOLIAD

http://techiaith.org/

GOFYNION SYSTEM

Mae darpariaeth presennol y llais wedi ei ddylunio ar gyfer gweinyddion wedi eu seilio ar un ai Linux Unix neu a moddau llinell-orchymyn o Festival. Mae wedi ei brofi gyda fersiwn Festival 1.96—2.4. Ni ellir sicrhau y bydd yn gweithio gyda fersiynau cynharach. 

CANLLAWIAU GOSOD

Dylid ailenwi y ffeil zip (wedi'i lwytho i lawr drwy GitHub) yn 'cymraeg' a'i echdynnu i'r cyfieiriadur /voices o'r gosodiad Festival cyfredol. Gellir ffeindio y cyfieiriadur voices/ yn /usr/share/festival/voices/ fel arfer.

FFURFWEDDIAD

Gallwch ddechrau a phrofi y llais o'r linell orchymyn fel hyn: 

> festival
(voice_cb_cy_llg_diphone) 
(SayText "mae hen wlad fy nhadau yn annwyl i mi")

I'W GWNEUD & GWELLIANAU

Mae rhywfaint o waith tocaneiddio eto i'w wneud, yn enwedig ar URLs cymhleth. Os na ellir tocaneiddio gair, byddwch yn clywed y swn 'uh' yn lle y gair ei hun. 

Efallai na fydd anganiad rhai geiriau Cymraeg sy'n gorffen mewn dyfynodau yn debyg i'w ffurfiau gwraidd os yw anganiad y ffurf wraidd yn afreolaidd.

Mae'r llais yn disgyn yn ol i'r deuffon rhagosodiedig (h.y. distawrwydd) lle bydd clystyrau cytseiniaid sillaf cychwynnol sy'n gorffen gyda 'i' gytseiniol.

CYFYNGIADAU

Nid yw'r llais yn cefnogi Unicode, oherwydd cyfyngiadau o fewn Festival. Defnyddir y confensiynau canlynol ar gyfer testun Cyrmaeg sy'n cynnwys llafariaid acennog:

a+ = â (i.e. llafariad wedi'i ddilyn gan arwydd plws = accen tô bach ar y llafariad; ac yn yr un modd ar gyfer e+, i+, o+, u+, w+, y+)
e: = ë (i.e. llafariad wedi'i ddilyn gan golon = diaeresis ar y llafariad ; ac yn yr un modd ar gyfer a:, i:, o:, u:, w:, y:)
a/ = á (i.e. llafariad wedi'i ddilyn gan flaenslaes = acen lem ar y llafariad;  ac yn yr un modd ar gyfer pob llafariad Cymraeg arall)
a\ = à (i.e. llafariad wedi'i ddilyn gan ol-slaes =  acen grave ar y llafariad; ac yn yr un modd ar gyfer pob llafariad Cymraeg arall)

NEWIDIADAU

Gweler y ffeil [Changelog](Changelog).


CYSYLLTU

Os oes gennych unrhyw gwestiynau ynglyn a'r cyhoeddiad hwn, cysylltwch a Dewi Jones <d.b.jones@bangor.ac.uk> os gwelwch yn dda.

********************************************************
*         Text to Speech Welsh FestVox voice           *
*                                                      *
*               Voice : cb_cy_llg_diphone              *
*               Version : 1.1.0                        *
*                                                      *
*        Language Technologies (Canolfan Bedwyr)       *
*                                                      *
*               Prifysgol Bangor University            *
*                   Copyright (c) 2012                 *
*                   All Rights Reserved.               * 
*                                                      *
********************************************************

Remarks

This release is an updated version of a North Welsh male diphone voice, working within the Festival framework.
This voice was originally released under the WISPR project, funded by the European Union's INTERREG IIIA programme.

LOCATION

http://techiaith.org/

SYSTEM REQUIREMENTS

The current deployment of the voice is designed for Linux or Unix-based servers and command-line modes of Festival. It has been tested with Festival version 1.96—2.4. It is not guaranteed to work with earlier versions.

INSTALLATION INSTRUCTIONS

The zip file (downloaded through GitHub) should be renamed to 'welsh' and extracted into the voices/ directory of the current Festival installation. The voices/ directory is typically found in /usr/share/festival/voices/.

CONFIGURATION

The voice may be initialised and tested from the command line as follows:

> festival
(voice_cb_cy_llg_diphone) 
(SayText "mae hen wlad fy nhadau yn annwyl i mi")

TODO & IMPROVEMENTS

Some tokenisation work remains to be done, particularly on complex URLs. If a word cannot be tokenised, an 'uh' sound will be heard in place of the word itself.

The pronunciation of some Welsh words ending in apostrophes may not be similar to their baseforms, if the pronunciation of the baseform is irregular.

The voice falls back to the default diphone (i.e. silence) in the case of syllable-initial consonant clusters ending with consonantal 'i'.

LIMITATIONS

The voice does not support Unicode, due to limitations within Festival itself. The following conventions are used for Welsh text containing accented vowels:

a+ = â (i.e. vowel followed by plus sign = circumflex/tô bach accent on vowel; similarly for e+, i+, o+, u+, w+, y+)
e: = ë (i.e. vowel followed by colon = diaeresis on vowel; similarly for a:, i:, o:, u:, w:, y:)
a/ = á (i.e. vowel followed by forward slash = acute accent on vowel; similarly for all other Welsh vowels)
a\ = à (i.e. vowel followed by backslash = grave accent on vowel; similarly for all other Welsh vowels)

CHANGES

See the [Changelog](Changelog) file.


CONTACT

For any questions regarding this release, please contact Dewi Jones <d.b.jones@bangor.ac.uk>.
