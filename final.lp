#program dynamic.

% Llevamos la cuenta de las veces que una celda fue afectada
% para ver si ha cambiado o no
changed(X,Y) :- _cell(X,Y), #count { X',Y': _ad(X,Y,X',Y'), o(tog(X',Y')) } = N, N\2=1.

h(ce(X,Y), on) :- 'h(ce(X,Y), off), changed(X,Y).
h(ce(X,Y), off) :- 'h(ce(X,Y), on), changed(X,Y).

% registra todas las celdas tocadas anteriormente
tocada(X,Y) :- o(tog(X,Y)).
tocada(X,Y) :- 'tocada(X,Y).
:- o(tog(X,Y)), 'tocada(X,Y).

% Inertia
h(ce(X,Y),V) :- 'h(ce(X,Y),V), not changed(X,Y).

% Action generation
{ o(A): _action(A) }.

% minimizar
#minimize {1,X,Y : o(tog(X,Y)) }.
