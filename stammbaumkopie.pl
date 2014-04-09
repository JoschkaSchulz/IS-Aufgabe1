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
verheiratet(kate,william).
verheiratet(georgeVI, elisabethI).
verheiratet(elisabethI,georgeVI).
verheiratet(philip, elisabethII).
verheiratet(elisabethII,philip).
verheiratet(charles, camilla).
verheiratet(camilla,charles).
verheiratet(timothy, anne).
verheiratet(anne,timothy).
verheiratet(edouard, sophie).
verheiratet(sophie,edouard).
verheiratet(peter, autumn).
verheiratet(autumn,peter).
%verheiratet(X,Y):- verheiratet(Y,X),!.

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

%kind und vorfahr umgedreht
vater(Kind,Vater) :- kindVon(Kind, Vater),
	mann(Vater).

mutter(Kind,Mutter) :- kindVon(Kind, Mutter),
	frau(Mutter).

%Grosselternn mit kindVon vereinfacht
opa(Opa,Enkel) :- vater(Vorfahre,Opa),
	kindVon(Enkel,Vorfahre).

oma(Oma,Enkel) :- mutter(Vorfahre,Oma),
	kindVon(Enkel,Vorfahre).

vorfahre(Vorfahre,Nachfahre) :- kindVon(Nachfahre,Vorfahre).
vorfahre(Vorfahre,Nachfahre) :- kindVon(Z,Vorfahre),vorfahre(Z,Nachfahre).

%geschwister
vollGeschwister(Mensch_1,Mensch_2):- mutter(Mensch_1,Mutter),
	mutter(Mensch_2,Mutter),
	vater(Mensch_1,Vater),
	vater(Mensch_2,Vater),
	Mensch_1\=Mensch_2.

halbGeschwister(Mensch_1,Mensch_2):- mutter(Mensch_1,Mutter),
	mutter(Mensch_2,Mutter),
	vater(Mensch_1,Vater1),
	vater(Mensch_2,Vater2),
	Vater1\=Vater2.
halbGeschwister(Mensch_1,Mensch_2):-mutter(Mensch_1,Mutter1),
	mutter(Mensch_2,Mutter2),
	vater(Mensch_1,Vater),
	vater(Mensch_2,Vater),
	Mutter1\=Mutter2.

geschwister(Mensch_1,Mensch_2):- vollGeschwister(Mensch_1,Mensch_2).
geschwister(Mensch_1,Mensch_2):- halbGeschwister(Mensch_1,Mensch_2).

%Bruder Schwester
bruder(Bruder,Mensch_1):- mann(Bruder),
	geschwister(Bruder,Mensch_1).

schwester(Schwester,Mensch_1):-frau(Schwester),
	geschwister(Schwester,Mensch_1).

%Onkel Tante
istOnkel(Onkel,Mensch_1):- kindVon(Mensch_1,X),
	bruder(Onkel,X).
istOnkel(Onkel,Mensch_1):-kindVon(Mensch_1,X),
	geschwister(Tante,X),
	verheiratet(Onkel, Tante).

istTante(Tante,Mensch_1):- kindVon(Mensch_1,X),
	schwester(Tante,X).
istTante(Tante,Mensch_1):-kindVon(Mensch_1,X),
	geschwister(Onkel,X),
	verheiratet(Onkel, Tante).

%Grossneffe steht auch für die Grossnichte
grossOnkel(GrossOnkel,GrossNeffe):-opa(Opa,GrossNeffe),
	bruder(GrossOnkel,Opa).
grossOnkel(GrossOnkel,GrossNeffe):-oma(Oma,GrossNeffe),
	bruder(GrossOnkel,Oma).
grossOnkel(GrossOnkel,GrossNeffe):-opa(Opa,GrossNeffe),
	schwester(GrossTante,Opa),
	verheiratet(GrossOnkel,GrossTante).
grossOnkel(GrossOnkel,GrossNeffe):-oma(Oma,GrossNeffe),
	schwester(GrossTante,Oma),
	verheiratet(GrossOnkel,GrossTante).

grossTante(GrossTante,GrossNeffe):-opa(Opa,GrossNeffe),
	schwester(GrossTante,Opa).
grossTante(GrossTante,GrossNeffe):-oma(Oma,GrossNeffe),
	schwester(GrossTante,Oma).
grossTante(GrossTante,GrossNeffe):-opa(Opa,GrossNeffe),
	bruder(GrossOnkel,Opa),
	verheiratet(GrossOnkel,GrossTante).
grossTante(GrossTante,GrossNeffe):-oma(Oma,GrossNeffe),
	bruder(GrossOnkel,Oma),
	verheiratet(GrossOnkel,GrossTante).

%Basen
cousin(Mensch_1,Mensch_2) :- kindVon(Mensch_1,Eltern_1),
	kindVon(Mensch_2,Eltern_2),
	geschwister(Eltern_1,Eltern_2),
	mann(Mensch_1).
cousine(Mensch_1,Mensch_2) :- kindVon(Mensch_1,Eltern_1),
	kindVon(Mensch_2,Eltern_2),
	geschwister(Eltern_1,Eltern_2),
	frau(Mensch_1).

%Schwager mit oder klausel da reihenfolge bei verheiratet eine rolle spielt evtl if then else ?
schwager(Schwager,Mensch) :- mann(Schwager),
	verheiratet(Schwager,X),
	verheiratet(Mensch,Y),
	geschwister(X,Y).
	/*;
	mann(Schwager),
	verheiratet(Schwager,X),
	verheiratet(Y,Mensch),
	geschwister(X,Y).*/

schwaegerin(Schwaegerin,Mensch) :- frau(Schwaegerin),
	verheiratet(X,Schwaegerin),
	verheiratet(Mensch,Y),
	geschwister(X,Y).
	/*;
	frau(Schwaegerin),
	verheiratet(X,Schwaegerin),
	verheiratet(Y,Mensch),
	geschwister(X,Y).*/
