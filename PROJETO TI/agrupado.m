function [h] = agrupado(fonte)
    f = leFormato2(fonte);
    if (mod(numel(f), 2) == 1)
        f = f(1:end-1);
    end
    paresFonte = reshape(double(f)', 2, [])';
    paresFonte = table(paresFonte(:,1),paresFonte(:,2));
    paresAlfabeto = unique(paresFonte);
    [~, fonteTraduzida] = ismember(paresFonte, paresAlfabeto, 'rows');
    fonteTraduzida = fonteTraduzida(:)';
    alfabetoTraduzido = unique(fonteTraduzida);
    h = calcula_agrupado(fonteTraduzida,alfabetoTraduzido);
    h = h/2;
    calculahistagrup(fonteTraduzida,alfabetoTraduzido);
    
end