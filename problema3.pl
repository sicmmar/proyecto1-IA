
darVuelta(L_ingreso, L_volteada) :- reverse(L_ingreso, L_volteada).

esPalindromo(L_ingreso) :- reverse(L_ingreso, L_ingreso) .

duplicarLista([], []) :- ! .
duplicarLista([Cabeza|Cola], L) :- X is Cabeza * 2, duplicarLista(Cola, L1), append([X], L1, L) .

%dividirLista()