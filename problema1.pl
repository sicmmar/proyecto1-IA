% Hijo(Persona1,  Persona2) persona  1  es  hijo  de  la persona 2:- ! .
hija(diana, marta) .
hija(diana, bruce) .
hija(rachel, marta) .
hija(rachel, bruce) .
hija(may, marta) .
hija(may, bruce) .

hija(mary, diana) .
hija(mary, peter) .

hija(lara, pepper) .
hija(lara, barry) .


hijo(barry, marta) .
hijo(barry, bruce) .

hijo(harry, diana) .
hijo(harry, peter) .

hijo(clark,rachel) .
hijo(clark,enrique) .
hijo(lois,rachel) .
hijo(lois,enrique) .

hijo(ezio,may) .
hijo(ezio,ben) .
hijo(lorenzo,may) .
hijo(lorenzo,ben) .
hijo(sergio,may) .
hijo(sergio,ben) .

hijo(tony, pepper) .
hijo(tony, barry) .

% Padre/Madre(Persona1, Persona2)  persona 1 es padre o madre de la persona 2


% Pareja(Persona1, Persona2) persona 1 es pareja de la persona 2.
pareja(marta, bruce) :- ! .

pareja(diana, peter) :- ! .
pareja(rachel, enrique) :- ! .
pareja(may, ben) :- ! .
pareja(pepper,barry) :- ! .

% Hermano/Hermana(Persona1,  Persona2) persona 1 es hermano de la persona 2.



%%%%%%%%%%%%%%%% REGLAS %%%%%%%%%%%%%%%%%%%

esHermano(X,Y) :- hermano(Hermanos, X) , member(Y,Hermanos) .

esHijo(Padre, Hijo) :- padre(Padre, Hijos), member(Hijo, Hijos) .

primo(W,Z) :- hijo(W,X), hijo(Z,M) , esHermano(X,M) .

sobrino(Posible_tio, Posible_sobrino) :- hijo(Posible_sobrino, Y) , pareja(Y,W) , esHermano(W, Posible_tio) ; 
                                        hijo(Posible_sobrino, X), esHermano(X, Posible_tio).

tio(Persona, Posible_tio) :- sobrino(Posible_tio, Persona) .