% Hijo(Persona1,  Persona2) persona  1  es  hijo  de  la persona 2:- ! .
hijo(diana, marta) :- ! .
hijo(diana, bruce) :- ! .
hijo(rachel, marta) :- ! .
hijo(rachel, bruce) :- ! .
hijo(may, marta) :- ! .
hijo(may, bruce) :- ! .
hijo(enrique, marta) :- ! .
hijo(enrique, bruce) :- ! .

hijo(mary, diana) :- ! .
hijo(mary, peter) :- ! .
hijo(harry, diana) :- ! .
hijo(harry, peter) :- ! .

hijo(clark,rachel) :- ! .
hijo(clark,barry) :- ! .
hijo(lois,rachel) :- ! .
hijo(lois,barry) :- ! .

hijo(ezio,may) :- ! .
hijo(ezio,ben) :- ! .
hijo(lorenzo,may) :- ! .
hijo(lorenzo,ben) :- ! .
hijo(sergio,may) :- ! .
hijo(sergio,ben) :- ! .

hijo(tony, pepper) :- ! .
hijo(lara, pepper) :- ! .
hijo(tony, enrique) :- ! .
hijo(lara, enrique) :- ! .

% Padre/Madre(Persona1, Persona2)  persona 1 es padre o madre de la persona 2
padre(bruce, [may,rachel,diana,enrique]) :- ! .
padre(peter, [may, harry]) :- ! .
padre(barry, [clark,lois]) :- ! .
padre(may, [ezio,lorenzo,sergio]) :- ! .
padre(enrique, [lara,tony]) :- ! .

padre(marta, [may,rachel,diana,enrique]) :- ! .
padre(diana, [may, harry]) :- ! .
padre(rachel, [clark,lois]) :- ! .
padre(ben, [ezio,lorenzo,sergio]) :- ! .
padre(pepper, [lara,tony]) :- ! .

% Pareja(Persona1, Persona2) persona 1 es pareja de la persona 2.
pareja(marta, bruce) :- ! .

pareja(diana, peter) :- ! .
pareja(rachel, barry) :- ! .
pareja(may, ben) :- ! .
pareja(pepper,enrique) :- ! .

% Hermano/Hermana(Persona1,  Persona2) persona 1 es hermano de la persona 2.
hermano([rachel,may,enrique], diana) :- ! .
hermano([diana,may,enrique], rachel) :- ! .
hermano([rachel,diana,enrique], may) :- ! .
hermano([rachel,may,diana], enrique) :- ! .


hermano([ezio,sergio], lorenzo) :- ! .
hermano([lorenzo,sergio], ezio) :- ! .
hermano([ezio,lorenzo], sergio) :- ! .

hermano([mary], harry) :- ! .
hermano([harry], mary) :- ! .

hermano([clark], lois) :- ! .
hermano([lois], clark) :- ! .

hermano([lara], tony) :- ! .
hermano([tony], lara) :- ! .


%%%%%%%%%%%%%%%% REGLAS %%%%%%%%%%%%%%%%%%%

esHermano(X,Y) :- hermano(Hermanos, X) , member(Y,Hermanos) .

esHijo(Padre, Hijo) :- padre(Padre, Hijos), member(Hijo, Hijos) .

primo(W,Z) :- hijo(W,X), hijo(Z,M) , esHermano(X,M) .

sobrino(Posible_tio, Posible_sobrino) :- hijo(Posible_sobrino, Y) , pareja(Y,W) , esHermano(W, Posible_tio) ; 
                                        hijo(Posible_sobrino, X), esHermano(X, Posible_tio).

tio(Persona, Posible_tio) :- sobrino(Posible_tio, Persona) .