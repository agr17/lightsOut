#program dynamic.

h(ce(X,Y), on) :- 'h(ce(X,Y), off), _ad(X,Y,X',Y'), o(tog(X',Y')).
h(ce(X,Y), off) :- 'h(ce(X,Y), on), _ad(X,Y,X',Y'), o(tog(X',Y')).

% Prohibido que una celda sea afectada dos veces en un mismo t
:- o(tog(X,Y)), o(tog(X',Y')), (X,Y)!=(X',Y'), _ad(X,Y,A,B), _ad(X',Y',A,B). 

% registra todas las celdas tocadas anteriormente
tocada(X,Y) :- o(tog(X,Y)).
tocada(X,Y) :- 'tocada(X,Y).
:- o(tog(X,Y)), 'tocada(X,Y).

% Inertia: c(F,V)=value V has changed
h(F,V) :- 'h(F,V), not c(F).
c(F)   :- 'h(F,V), h(F,W), V!=W.  

% Action generation
{ o(A): _action(A) }.

% minimizar
#minimize {1,X,Y : o(tog(X,Y)) }.
