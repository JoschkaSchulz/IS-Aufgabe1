:-begin_tests(stammbaumTest).
:-consult(stammbaumkopie).

test(a):- true.
test(onkel):- istOnkel(harry,george),!.
test(opa):- opa(charles,george),!.
test(vorfahre):-vorfahre(georgeVI,george),!.
test(geschwister):-geschwister(william,harry),!.
test(not_geschwister):-not(geschwister(william,kate)),!.
test(bruder):- bruder(charles,anne),!.
test(not_bruder):-not(bruder(anne,charles)),!.
test(schwester):-schwester(anne,charles),!.
test(not_Tante):-not(istTante(kate,george)),!.
test(schwager):-schwager(timothy,camilla),!.




%test(vorfahre):- X is georgeVI, Y is george.

:-end_tests(stammbaumTest).
