%%Funkcja dodawania węzła

function [G,exists]=addingNode(G,NodeName)

exists=0;

%sprawdza czy węzeł istnieje
for i=1:length(G.Nodes.Name)
    if strcmp(G.Nodes.Name(i),NodeName)==1
        exists=1;
    end
end

%jeśli nie, to dodaje
if exists==0
 
    G = addnode(G,NodeName);
    
end
end