% Funkcja sprawdzająca położenie wykrytych wyrazów z zapytania, w grafie sieci semantycznej
% Działa na bezpośrednio połączone węzły, we właściwym kierunku
% Znajdzie hk417 round, wywali błąd przy round hk417 - gramatyka zadawania
% pytań w języku ang - what round has/is hk417? What hk417 is round?



function output=regexpcheck(G,matchStr)

pp=table();

output=0;

for h=1:length(matchStr)
    for i=1:height(G.Nodes)
        if strcmpi(G.Nodes.Name(i),matchStr(h))==1
            nodeIDout = nearest(G,G.Nodes.Name(i),1);
            nodeIDin = nearest(G,G.Nodes.Name(i),1,'Direction','incoming'); %sprawdzanie położenia 
            if isempty(nodeIDout)==0
                nodeIDs=nodeIDout;
            elseif isempty(nodeIDin)==0
                nodeIDs=nodeIDin;
            end
            xxx=G.Nodes.Name(i);
            for z=1:length(nodeIDs)
                for i=1:height(G.Edges.EndNodes)
                    if strcmpi(G.Edges.EndNodes(i,1),xxx)==1 && strcmpi(G.Edges.EndNodes(i,2),nodeIDs(z))==1
                        pp(z,:)=table(G.Edges.EndNodes(i,1),G.Edges.EndNodes(i,2),G.Edges.EdgeName(i)); %robi tabele z sąsiadów wykrytych słów (zobacz jak działa - debug)  
                        
                        for i=1:height(pp)
                            for j=1:width(pp)
                                if strcmpi(string(table2cell(pp(i,j))),matchStr(1))==1
                                    ppi=pp(i,:);
                                    for k=1:width(ppi)
                                        if strcmpi(string(table2cell(ppi(:,k))),matchStr(2))==1
                                            output=table2cell(ppi(:,(k+1)));  %daje odpowiedź kilku argumentów jesli jest pytanie np jakie są karabiny nato
                                        end
                                    end
                                end
                            end
                        end
                        
                    elseif strcmpi(G.Edges.EndNodes(i,1),nodeIDs(z))==1 && strcmpi(G.Edges.EndNodes(i,2),xxx)==1 && length(matchStr)<3
                        output=cell(output);
                        output(z)=nodeIDs(z); %daje odpowiedź jednoargumentową np jaki jest kolor beryla                 
                    end
                end
            end
        end
    end
end

if iscell(output)==0
    output=1;
end

end
