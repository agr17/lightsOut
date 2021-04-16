cell(0..n-1,0..n-1).
action(tog(X,Y)) :- cell(X,Y).

ad(X,Y,X',Y') :- cell(X,Y), cell(X',Y'), |X-X'|+|Y-Y'|<2.

#program final.

% no puede ser que quede una celda a on
:- h(ce(_,_),on).  

#show o/1.
