function output=longpath(G,matchStr)

mtrx=G.Edges{:,:}; %zamiana całej tabeli g.edges (zobacz jak wyglada ta tabela) na macierz

for k=1:length(matchStr)
    for i=1:height(mtrx)
        for j=1:width(mtrx)
            if strcmpi(mtrx(i,j),matchStr(k))==1 
                dd(k).pp(i,j)=1;
            else
                dd(k).pp(i,j)=0;   %opracowanie struktury 0 i 1. 1 tam gdzie wykryty wyraz z pytania pasuje do tego w tabeli      
            end
        end
    end
end

AAA=[dd(1).pp,dd(2).pp,dd(3).pp,dd(4).pp]; %zamiana struktury na maacierz 0 i 1

sAAA=sum(AAA,2); %suma 0 i 1 w wierszach macierzy

for i=1:height(sAAA)
    if sAAA(i)>1 && sAAA(i)<3 
       opi(i,:)=(G.Edges(i,:)); % obliczanie prawdopodbieństwa o która daną padło pytanie. Jeżeli suma w wierszu jest 2 tzn że pewnie z tego wierszu tabeli g.edges potrzebna jest informacja (padło o nią pytanie)
    end 
end

% powstawały nieścisłości tą metodą wiec na sztywno dodałem poniższy kod

mtrx2=opi{:,:};

for i=1:height(mtrx2)
    for j=1:width(mtrx2)
        if isempty(mtrx2{i,j})==0 % musaiłem na sztywno bo nie miałem innego pomysłu ;c jak się zgadamy to wytłumaczę czemu
            if strcmpi(mtrx2{i,j},matchStr{1})==0 && strcmpi(mtrx2{i,j},matchStr{2})==0 && strcmpi(mtrx2{i,j},matchStr{3})==0 && strcmpi(mtrx2{i,j},matchStr{4})==0
                if strcmpi(matchStr{1},'owner')==1
                    if strlength(mtrx2(i,j))>7
                        output=mtrx2(i,j); %przeczytaj dozwolone pytania. jeśli pierszym wykrytym wyrazem w pytaniu jest owner tzn że pytanie jest o właściciela broni o numerze jakimś
                    end
                elseif strcmpi(matchStr{1},'number')==1
                    if strlength(mtrx2(i,j))<8 && strcmpi(mtrx2{i,j+1},matchStr{4})==1 && strcmpi(mtrx2{i,j+2},matchStr{3})==1
                        output=mtrx2(i,j); %przeczytaj dozwolone pytania. jeśli pierszym wykrytym wyrazem w pytaniu jest number tzn że pytanie jest numer czyjejś broni
                    end
                elseif strcmpi(matchStr{1},'type')==1
                    if strcmpi(mtrx2{i,j-1},matchStr{4})==1 && strcmpi(mtrx2{i,j+1},matchStr{1})==1
                        output=mtrx2(i,j); %przeczytaj dozwolone pytania. jeśli pierszym wykrytym wyrazem w pytaniu jest number tzn że pytanie jest numer czyjejś broni
                        return
                    end
                elseif strcmpi(matchStr{1},'grip')==1
                    if strcmpi(mtrx2{i,j-1},matchStr{4})==1 && strcmpi(mtrx2{i,j+1},matchStr{1})==1
                        output=mtrx2(i,j); %przeczytaj dozwolone pytania. jeśli pierszym wykrytym wyrazem w pytaniu jest number tzn że pytanie jest numer czyjejś broni
                        return
                    end
                end
            end
        end
    end
end

end