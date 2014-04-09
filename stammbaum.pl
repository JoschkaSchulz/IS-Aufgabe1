mann(william).
mann(harry).
mann(charles).
mann(george).
mann(georgeVI).
mann(philip).
mann(timothy).
mann(andrew).
mann(edouard).
mann(mark).
mann(peter).
mann(severn).

frau(kate).
frau(diana).
frau(elisabethI).
frau(elisabethII).
frau(margaret).
frau(camilla).
frau(anne).
frau(sarah).
frau(sophie).
frau(autumn).
frau(zara).
frau(louise).
frau(savannah).
frau(beatrix).
frau(eugenie).

verheiratet(william, kate).
verheiratet(georgeVI, elisabethI).
verheiratet(philip, elisabethII).
verheiratet(charles, camilla).
verheiratet(timothy, anne).
verheiratet(edouard, sophie).
verheiratet(peter, autumn).

kindVon(elisabethII, georgeVI).
kindVon(elisabethII, elisabethI).
kindVon(margaret, elisabethI).
kindVon(margaret, georgeVI).
kindVon(charles, elisabethII).
kindVon(charles, philip).
kindVon(anne, elisabethII).
kindVon(anne, philip).
kindVon(andrew, elisabethII).
kindVon(andrew, philip).
kindVon(edouard, elisabethII).
kindVon(edouard, philip).
kindVon(william, diana).
kindVon(william, charles).
kindVon(harry, diana).
kindVon(harry, charles).
kindVon(peter, anne).
kindVon(peter, mark).
kindVon(zara, anne).
kindVon(zara, mark).
kindVon(beatrix, sarah).
kindVon(beatrix, andrew).
kindVon(eugenie, sarah).
kindVon(eugenie, andrew).
kindVon(louise, sophie).
kindVon(louise, edouard).
kindVon(severn, sophie).
kindVon(severn, edouard).
kindVon(george, kate).
kindVon(george, william).
kindVon(savannah, autumn).
kindVon(savannah, peter).

vater(Vater,Kind) :- kindVon(Kind, Vater), mann(Vater).
mutter(Mutter,Kind) :- kindVon(Kind, Mutter), frau(Mutter).

opa(Opa,Enkel) :- vater(Opa,vater(Vater,Enkel));vater(Opa,mutter(Mutter,Enkel)).
oma(Oma,Enkel) :- mutter(Oma, mutter(Mutter, Enkel));mutter(Oma,vater(Vater,Enkel)).

vorfahre(Vorfahre,Nachfahre) :- kindVon(Nachfahre,Vorfahre).
vorfahre(Vorfahre,Nachfahre) :- kindVon(Z,Vorfahre),vorfahre(Z,Nachfahre).

geschwister(Mensch_1,Mensch_2):- vater(Vater,Mensch_1),vater(Vater,Mensch_2) ; mutter(Mutter,Mensch_1),mutter(Mutter,Mensch_2).

bruder(Bruder,Mensch_1):- mann(Bruder),geschwister(Bruder,Mensch_1).
schwester(Schwester,Mensch_1):-frau(Schwester),geschwister(Schwester,Mensch_1).


