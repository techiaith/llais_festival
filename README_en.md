# llais_festival
Llais Deuffon Festival Cymraeg - Welsh Diphone Festival Voice

```
********************************************************
*         Welsh Text-to-Speech Welsh voice             *
*                     for the                          *
*         Festival Speech Synthesis System             *
*                                                      *
*               Voice : cb_cy_llg_diphone              *
*               Version : 1.1.0                        *
*                                                      *
*     Language Technologies Unit  (Canolfan Bedwyr)    *
*                                                      *
*               Prifysgol Bangor University            *
*                   Copyright (c) 2016                 *
*                   All Rights Reserved.               * 
*                                                      *
********************************************************
```

This release is an updated version of a North Welsh male diphone voice, working within the [Festival Speech Synthesis System](http://www.cstr.ed.ac.uk/projects/festival/).
This voice was originally released under the [WISPR](http://www.e-gymraeg.org/wispr) project, funded by the European Union's INTERREG IIIA programme.

## LOCATION

More information, as well as an online demo of the voice can be found at:

http://techiaith.cymru/speech/text-to-speech/?lang=en

## SYSTEM REQUIREMENTS

The current deployment of the voice is designed for Linux or Unix-based servers and command-line modes of Festival. It has been tested with Festival version 1.96—2.4 onwards. It is not guaranteed to work with earlier versions.

It is possible to install Festival on some Linux systems, such as Ubuntu or Raspian (Raspberry Pi) using :

```
$ sudo apt-get install festival festival-dev
```

## WELSH VOICE INSTALLATION INSTRUCTIONS

The following commands can be used to add the Welsh voice into your Festival installation:

```
$ sudo mkdir -p /usr/share/festival/voices/welsh
$ cd /usr/share/festival/voices/welsh
$ wget --progress=dot:mega -O - https://github.com/PorthTechnolegauIaith/llais_festival/archive/v1.0.tar.gz | sudo tar -zxf -
$ sudo mv llais_festival-1.0/* .
$ sudo rmdir llais_festival-1.0
```

## CONFIGURATION

The voice may be initialised and tested from the command line as follows:

```
$ festival
festival> (voice_cb_cy_llg_diphone)
cb_cy_llg_diphone
festival> (SayText "mae hen wlad fy nhadau yn annwyl i mi")
#<Utterance 0x7f0eab638950>
festival>
```

## TODO & IMPROVEMENTS

Some tokenisation work remains to be done, particularly on complex URLs. If a word cannot be tokenised, an 'uh' sound will be heard in place of the word itself.

The pronunciation of some Welsh words ending in apostrophes may not be similar to their baseforms, if the pronunciation of the baseform is irregular.

The voice falls back to the default diphone (i.e. silence) in the case of syllable-initial consonant clusters ending with consonantal 'i'.

## LIMITATIONS

The voice does not support Unicode, due to limitations within Festival itself. The following conventions are used for Welsh text containing accented vowels:

a+ = â (i.e. vowel followed by plus sign = circumflex/tô bach accent on vowel; similarly for e+, i+, o+, u+, w+, y+)
e: = ë (i.e. vowel followed by colon = diaeresis on vowel; similarly for a:, i:, o:, u:, w:, y:)
a/ = á (i.e. vowel followed by forward slash = acute accent on vowel; similarly for all other Welsh vowels)
a\ = à (i.e. vowel followed by backslash = grave accent on vowel; similarly for all other Welsh vowels)

## CHANGES

See the [Changelog](Changelog) file.


## CONTACT

For any questions regarding this release, please contact Bangor University's Language Technologies Unit <techiaith@bangor.ac.uk>.
