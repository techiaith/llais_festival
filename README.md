# llais_festival
Llais Deuffon Festival Cymraeg - Welsh Diphone Festival Voice

( [English README](README_en.md) )

```
********************************************************
*             Llais Testun-i-Leferydd Cymraeg          *
*                        ar gyfer                      *
*             Festival Speech Synthesis System         *
*                                                      *
*               Llais : cb_cy_llg_diphone              *
*               Fersiwn : 1.1.0                        *
*                                                      *
*        Uned Technolegau Iaith (Canolfan Bedwyr)      *
*                                                      *
*               Prifysgol Bangor University            *
*                   Copyright (c) 2016                 *
*                   Cedwir Pob Hawl.                   * 
*                                                      *
********************************************************
```

Mae'r cyhoeddiad hwn yn fersiwn wedi'i ddiweddaru o lais gwrwyaidd deuffon o Ogledd Cymru, sy'n gweithio o fewn [fframwaith testun-i-leferydd Festival](http://www.cstr.ed.ac.uk/projects/festival/).
Rhyddhawyd y llais yn wreiddiol fel rhan o broject [WISPR](http://www.e-gymraeg.org/wispr), a'i ariannwyd gan raglen INTERREG IIIA yr Undeb Ewropeiaidd. 

## LLEOLIAD

Mae rhagor o wybodaeth, yn ogystal a demo ar-lein o'r llais ar gael yma:
http://techiaith.cymru/lleferydd/testun-i-leferydd/

## GOFYNION SYSTEM

Mae darpariaeth presennol y llais wedi ei ddylunio ar gyfer gweinyddion wedi eu seilio ar un ai Linux Unix neu a moddau llinell-orchymyn o Festival. Mae wedi ei brofi gyda fersiwn Festival 1.96—2.4 ymlaen. Ni ellir sicrhau y bydd yn gweithio gyda fersiynau cynharach. 

Ar rhai system Linux, fel Ubuntu ac Raspian (Raspberry Pi),  mae modd osod Festival drwy:

```
$ sudo apt-get install festival festival-dev
```

## CANLLAWIAU GOSOD Y LLAIS CYMRAEG

Dylid defnyddio'r camau canlynol i osod y llais o fewn eich gosodiad o Festival:

```
$ sudo mkdir -p /usr/share/festival/voices/welsh
$ cd /usr/share/festival/voices/welsh
$ wget --progress=dot:mega -O - https://github.com/PorthTechnolegauIaith/llais_festival/archive/v1.0.tar.gz | sudo tar -zxf -
$ sudo mv llais_festival-1.0/* .
$ sudo rmdir llais_festival-1.0
```

## FFURFWEDDIAD

Gallwch ddechrau a phrofi y llais o'r linell orchymyn fel hyn: 

```
$ festival
festival> (voice_cb_cy_llg_diphone)
cb_cy_llg_diphone
festival> (SayText "mae hen wlad fy nhadau yn annwyl i mi")
#<Utterance 0x7f0eab638950>
festival>
```

## I'W GWNEUD & GWELLIANAU

Mae rhywfaint o waith tocaneiddio eto i'w wneud, yn enwedig ar URLs cymhleth. Os na ellir tocaneiddio gair, byddwch yn clywed y swn 'uh' yn lle y gair ei hun. 

Efallai na fydd anganiad rhai geiriau Cymraeg sy'n gorffen mewn dyfynodau yn debyg i'w ffurfiau gwraidd os yw anganiad y ffurf wraidd yn afreolaidd.

Mae'r llais yn disgyn yn ol i'r deuffon rhagosodiedig (h.y. distawrwydd) lle bydd clystyrau cytseiniaid sillaf cychwynnol sy'n gorffen gyda 'i' gytseiniol.

## CYFYNGIADAU

Nid yw'r llais yn cefnogi Unicode, oherwydd cyfyngiadau o fewn Festival. Defnyddir y confensiynau canlynol ar gyfer testun Cyrmaeg sy'n cynnwys llafariaid acennog:

a+ = â (i.e. llafariad wedi'i ddilyn gan arwydd plws = accen tô bach ar y llafariad; ac yn yr un modd ar gyfer e+, i+, o+, u+, w+, y+)
e: = ë (i.e. llafariad wedi'i ddilyn gan golon = diaeresis ar y llafariad ; ac yn yr un modd ar gyfer a:, i:, o:, u:, w:, y:)
a/ = á (i.e. llafariad wedi'i ddilyn gan flaenslaes = acen lem ar y llafariad;  ac yn yr un modd ar gyfer pob llafariad Cymraeg arall)
a\ = à (i.e. llafariad wedi'i ddilyn gan ol-slaes =  acen grave ar y llafariad; ac yn yr un modd ar gyfer pob llafariad Cymraeg arall)

## NEWIDIADAU

Gweler y ffeil [Changelog](Changelog).


## CYSYLLTU

Os oes gennych unrhyw gwestiynau ynglyn a'r cyhoeddiad hwn, cysylltwch â Uned Technolegau Iaith, Prifysgol Bangor <techiaith@bangor.ac.uk> os gwelwch yn dda.

