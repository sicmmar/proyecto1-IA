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
padre(marta, [diana,rachel,may,barry]) :- ! .
padre(bruce, [diana,rachel,may,barry]) :- ! .

padre(diana, [mary,harry]) :- ! .
padre(peter, [mary,harry]) :- ! .

padre(rachel, [clark,lois]) :- ! .
padre(enrique, [clark,lois]) :- ! .

padre(may, [ezio,lorenzo,sergio]) :- ! .
padre(ben, [ezio,lorenzo,sergio]) :- ! .

padre(pepper, [lara,tony]) :- ! .
padre(barry, [lara,tony]) :- ! .

% Pareja(Persona1, Persona2) persona 1 es pareja de la persona 2.
pareja(marta, bruce) :- ! .
pareja(bruce, marta) :- ! .

pareja(diana, peter) :- ! .
pareja(peter, diana) :- ! .
pareja(rachel, enrique) :- ! .
pareja(enrique, rachel) :- ! .
pareja(may, ben) :- ! .
pareja(ben,may) :- ! .
pareja(pepper,barry) :- ! .
pareja(barry,pepper) :- ! .

% Hermano/Hermana(Persona1,  Persona2) persona 1 es hermano/a de la persona 2.
hermano(barry, [diana,rachel,may]).

hermano(harry, [mary]).

hermano(clark, [lois]). 
hermano(lois, [clark]) :- ! . 

hermano(ezio, [lorenzo,sergio]) . 
hermano(lorenzo, [ezio,sergio]) . 
hermano(sergio, [lorenzo,ezio]) . 

hermano(tony, [lara]). 


hermana(diana, [barry,rachel,may]).
hermana(rachel, [barry,diana,may]).
hermana(may, [barry,diana,rachel]).

hermana(mary, [harry]).

hermana(lara, [tony]). 

%%%%%%%%%%%%%%%% REGLAS %%%%%%%%%%%%%%%%%%%

esHermano(X,Y) :- hermano(X, Hermanos) , member(Y,Hermanos) ;
                hermana(X, Hermanos), member(Y, Hermanos).

esHijo(Padre, Hijo) :- hijo(Hijo, Padre) ; hija(Hijo, Padre).

primo(Primo1,Primo2) :- esHijo(Padre1,Primo1), esHijo(Padre2,Primo2), esHermano(Padre1,Padre2) .

sobrino(Posible_tio, Posible_sobrino) :- esHijo(Posible_tio, Hijo) , primo(Hijo,Posible_sobrino).

tio(Persona, Posible_tio) :- sobrino(Posible_tio, Persona) .

esAbuelo(Abuelo,Nieto) :- esHijo(Padre, Nieto), esHijo(Abuelo, Padre).

esCulpable(Culpable) :- esAbuelo(bruce, Culpable),
                        primo(clark, Culpable),
                        tio(Culpable, barry),
                        hermana(_,Hermanos), member(Culpable,Hermanos).

imprimirHijos(_) :- fail, ! .

imprimirHijos(Persona) :- forall(esHijo(Persona, Hijo), (tab(5),write('  |  '))),nl, 
                        forall(esHijo(Persona, Hijo), (tab(5),write(Hijo))),nl,
                        forall(esHijo(Persona, Hijo), imprimirHijos(Hijo)).

imprimirPareja(Persona) :- pareja(Persona, Esposo), tab(10), write(Persona), write('--'), write(Esposo), nl,
                        imprimirHijos(Persona).

imprimirArbol(Persona) :- imprimirPareja(Persona),
                        imprimirHijos(Persona).

arbol(Persona) :- pareja(Persona, Esposo), tab(10), write(Persona), write('--'), write(Esposo), nl,
                forall(esHijo(Persona, Hijo), (tab(5),write('  |  '))),nl, 
                forall(esHijo(Persona, Hijo), (tab(5),write(Hijo))),nl,
                forall(esHijo(Persona, Hijo), imprimirHijos(Hijo)).