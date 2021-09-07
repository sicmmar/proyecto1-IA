%1
darVuelta(L_ingreso, L_volteada) :- reverse(L_ingreso, L_volteada).

%2
esPalindromo(L_ingreso) :- reverse(L_ingreso, L_ingreso) .

%3
duplicarLista([], []) :- ! .
duplicarLista([Cabeza|Cola], L) :- X is Cabeza * 2, duplicarLista(Cola, L1), append([X], L1, L) .

%4
tamanoLista([],0) :- ! .
tamanoLista([_|Cola], L) :- tamanoLista(Cola, L1), L is L1 + 1.

mitadLista(Lista, Mitad) :- tamanoLista(Lista, Long), Mitad is round(Long / 2) .

dividir(_, 0, []) :- ! .
dividir([Cabeza|Cola], Contador, Lista) :- C1 is Contador - 1, dividir(Cola, C1, L1), append([Cabeza], L1, Lista ) .

dividirLista(Entrada,Lista1, Lista2) :- mitadLista(Entrada,Mitad), dividir(Entrada, Mitad, Lista1), 
        reverse(Entrada, Volteada), tamanoLista(Volteada, Long), Atras is Long - Mitad, dividir(Volteada, Atras, L2), reverse(L2, Lista2).

%5
insertar(Elemento,Entrada,Pos,Lista) :- Pos >= 0, tamanoLista(Entrada, Long), Pos < Long + 1,
                                    dividir(Entrada,Pos,Lista1), append(Lista1, [Elemento], Nueva),
                                    reverse(Entrada, Volteada), Atras is Long - Pos, dividir(Volteada, Atras, L2),
                                    reverse(L2,Lista2), append(Nueva, Lista2, Lista) .