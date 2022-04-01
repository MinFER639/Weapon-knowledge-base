%%Funkcja dodawania krawędzi

function G=adding(G,AddNodeName,AddEdgeFrom,AddEdgeTo,AddNewEdgeName)

G = addnode(G,AddNodeName); %wywołanie funkcji MATLABA(ML) "addnode" dodającej węzeł jeżeli taki jeszcze nie istnieje
G = addedge(G,AddEdgeFrom,AddEdgeTo); %wywołanie funkcji MATLABA(ML) "addnode" dodającej krawędź od do

for i=1:length(G.Edges.EdgeName)
if iscellstr(G.Edges.EdgeName(i))==0
    G.Edges.EdgeName(i)={AddNewEdgeName}; %pętla sprawdzająca gdzie jest puste miejsce w tabeli i jak napotka puste dodaje nawę nowej krawędzi
end
end
end