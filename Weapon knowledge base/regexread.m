%Funkcja tworząca dłuuugie wyrażenie regularne na podstawie tabeli G.Edges
function matchStr=regexread(G,defaultString)
mtrx=G.Edges{:,:}; %zamiana tabeli na macierz
uniqmtrx=(unique(mtrx))'; %transpozycja i wybór wyłącznie unikalnych nazw krawędzi (żeby wyrażenie nie było za dłuuugie)

uniqmtrxjoin=char(join(uniqmtrx,"\>|\<")); %zamian macierzy 2D na 1D i dodanie niezbędnych znaków pomiędzy nazwami aby działało poprawie (zobacz sb jak działa)
uniqmtrxjoin=join(['\<',uniqmtrxjoin,'\>']); % dodanie znaku na początku i końcu wyrażenia żeby działało poprawnie 

matchStr = regexpi(defaultString,uniqmtrxjoin,'match'); % sprawdzanie czy w naszym pytaniu są wyrazy z tabeli np "Beryl", regexpI<-- to I na końcu oznacza żeby nie zwracał uwagi na wielkość liter
end