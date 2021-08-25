function h = calculahist2(f,alfa)
    [f,formato] = leFormato2(f);
    if (nargin == 1)
        alfa = unique(f);
        if(formato == ".txt")
            alfa = eliminaCaracteresEspeciais2(alfa);
        end
    else
        alfa = unique(alfa);
    end
    h = zeros(size(alfa));
    for k = 1 : length(alfa)
        i = find(f == alfa(k));
        h(k) = length(i);
    end
    desenhaHist2(formato, alfa, h);
end