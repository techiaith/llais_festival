********************************************************
*         Welsh Text To Speech FestVox Voice           *
*                                                      *
*               Voice : cb_cy_llg_diphone              *
*               Version : 1.1.0                        *
*                                                      *
*        Language Technologies (Canolfan Bedwyr)       *
*               Prifysgol Bangor University            *
*                   Copyright (c) 2012                 *
*                  All Rights Reserved.                * 
*                                                      *
********************************************************

REMARKS

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
