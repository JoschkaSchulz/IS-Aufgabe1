:-begin_tests(stammbaumTest).
:-consult(stammbaumkopie).

test(a):- true.

test(vater):- vater(harry, charles),!.
test(vater_fail1, [fail]):- vater(charles, harry),!.
test(vater_fail2, [fail]):- vater(harry,diana),!.

test(mutter):- mutter(harry,diana),!.
test(mutter_fail1, [fail]):- mutter(diana,harry),!.
test(mutter_fail2, [fail]):- mutter(harry, charles),!.

test(onkel):- istOnkel(harry,george),!.
test(onkel_fail,[fail]):- istOnkel(harry,william),!.

test(opa):- opa(charles,george),!.
test(opa_fail,[fail]):- opa(harry,diana),!.

test(vorfahre):-vorfahre(georgeVI,george),!.
test(vorfahre_fail,[fail]):- vorfahre(gorge,georgeVI),!.

test(geschwister):-geschwister(william,harry),!.
test(geschwister_fail,[fail]):-geschwister(william,kate),!.

test(bruder):- bruder(charles,anne),!.
test(bruder_fail,[fail]):- bruder(anne,charles),!.

test(schwester):-schwester(anne,charles),!.
test(schwester_fail,[fail]) :- schwester(charles, anne),!.

test(tante_fail,[fail]):-istTante(kate,george),!.

test(schwager):-schwager(timothy,camilla),!.




%test(vorfahre):- X is georgeVI, Y is george.

:-end_tests(stammbaumTest).
