%%Funkcja dodawania krawędzi

function [G,exists]=addingEdge(G,AddEdgeFrom,AddEdgeTo,AddNewEdgeName)

exists=0;
%petla spawdza czy już taka krawędź nie itnieje - zapobieganie redundancji danych
for i=1:length(G.Edges.EndNodes)
    if strcmp(G.Edges.EndNodes(i,1),AddEdgeFrom)==1 && strcmp(G.Edges.EndNodes(i,2),AddEdgeTo)==1 && strcmp(G.Edges.EdgeName(i),AddNewEdgeName)==1
        exists=1;
    end
end

%jeśli nieistnieje, to dodaje
if exists==0
        G = addedge(G,AddEdgeFrom,AddEdgeTo);
        
        for i=1:length(G.Edges.EdgeName)
            if iscellstr(G.Edges.EdgeName(i))==0
                G.Edges.EdgeName(i)={AddNewEdgeName};
            end
        end
        
end
end
    