function h = calcula_agrupado(f,alfa)
if (nargin == 1)
        alfa = unique(f);
end
px = zeros(size(alfa));
    for k = 1 : length(alfa)
        i = find(f == alfa(k));
        px(k) = length(i)/numel(f);
    end
    if (size(px,2) < size(px,1))
         px = px';
    end
    h = -px(px ~= 0) * log2(px(px~=0)');
end