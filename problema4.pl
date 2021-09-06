num(1). 
num(2). 
num(3). 
num(4).

diferente(A, B, C, D) :- num(A), num(B), num(C), num(D), 
                    A\=B, A\=C, A\=D, B\=C, B\=D, C\=D .

imprimir(A, B, C, D) :- 
    write(' '), write(A), write(' | '), write(B), write(' || '), write(C), write(' | '), write(D), nl.

resuelto(F1C1, F1C2, F1C3, F1C4, 
        F2C1, F2C2, F2C3, F2C4, 
        F3C1, F3C2, F3C3, F3C4, 
        F4C1, F4C2, F4C3, F4C4) :-
	diferente(F1C1, F1C2, F1C3, F1C4),
	diferente(F2C1, F2C2, F2C3, F2C4),
	diferente(F3C1, F3C2, F3C3, F3C4),
	diferente(F4C1, F4C2, F4C3, F4C4),
	diferente(F1C1, F2C1, F3C1, F4C1),
	diferente(F1C2, F2C2, F3C2, F4C2),
	diferente(F1C3, F2C3, F3C3, F4C3),
	diferente(F1C4, F2C4, F3C4, F4C4),
	diferente(F1C1, F1C2, F2C1, F2C2),
	diferente(F1C3, F1C4, F2C3, F2C4),
	diferente(F3C1, F3C2, F4C1, F4C2),
	diferente(F3C3, F3C4, F4C3, F4C4).


sudoku(F1C1, F1C2, F1C3, F1C4, 
        F2C1, F2C2, F2C3, F2C4, 
        F3C1, F3C2, F3C3, F3C4, 
        F4C1, F4C2, F4C3, F4C4) :- 
        
        resuelto(F1C1, F1C2, F1C3, F1C4, 
                F2C1, F2C2, F2C3, F2C4, 
                F3C1, F3C2, F3C3, F3C4, 
                F4C1, F4C2, F4C3, F4C4),nl,
                
        nl,write('Solución para sudoku:'),nl,nl,
        imprimir(F1C1, F1C2, F1C3, F1C4),
        write('---|---||---|---'),nl,
        imprimir(F2C1, F2C2, F2C3, F2C4),
        write('===|===||===|==='),nl,
        imprimir(F3C1, F3C2, F3C3, F3C4),
        write('---|---||---|---'),nl,
        imprimir(F4C1, F4C2, F4C3, F4C4),nl.