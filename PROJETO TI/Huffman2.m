function nMedioBits = Huffman2(f,alfa)
    if(nargin == 1)
        h = calculahist2(f);
    else
        h = calculahist2(f, alfa);
    end
    HLen = hufflen2(h);
    aux = HLen .* h;
    nMedioBits = sum(aux) / sum(h);
end
%Calcula o n�mero m�dio de bits numa dada fonte
%calculaHist devolve uma matriz com as frequ�ncias
%absolutas de cada s�mbolo pertencente ao alfabeto
%da fonte

%hufflen(h) devolve o comprimento dos c�digos de
%Huffman de cada s�mbolo (ou seja, o n�mero de bits
%necess�rio para representar esses mesmos s�mbolos)

%� atribu�da a aux uma matriz que resulta da multiplica��o
%elemento-a-elemento dos comprimentos dos c�digos pelas
%suas respetivas frequ�ncias absolutas

%A partir daqui, o n�mero m�dio de bits � f�cil de
%calcular: ser� a soma de todos os elementos de aux
%a dividir pela soma das frequ�ncias absolutas de todos
%os s�mbolos