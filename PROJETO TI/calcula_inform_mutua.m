function [infor_mutua, variacao,maximo, x1, y1, width, height] = calcula_inform_mutua(query,target,alfa,step)
    query = leFormato2(query);
    target = leFormato2(target);
    ncol_t = size(target,2);
    nline_t = size(target,1);
    ncol_q = size(query,2);
    nline_q = size(query,1);
    n_line = 1;
    n_col = 1;
    n_windowsver = floor((nline_t - nline_q)/step)+1;
    n_windowshor = floor((ncol_t - ncol_q)/step)+1; 
    infor_mutua = zeros(n_windowsver, n_windowshor);
    q = reshape(query, 1, []);
    entropia_query = entropia_ex6(query, alfa);
    for y2 = nline_q:step:nline_t
        y1 = y2 - nline_q + 1;
        for x2 = ncol_q:step:ncol_t
            x1 = x2-ncol_q+1;
            window = target((y1:y2),(x1:x2));
            entropia_window = entropia_ex6(window,alfa);
            w = reshape(window, 1, []);
            fonteConjunta = [q(:) w(:)];
            fonteConjunta = table(fonteConjunta(:,1),fonteConjunta(:,2));
            alfabetoConjunto = unique(fonteConjunta);
            [~, fonteTraduzida] = ismember(fonteConjunta, alfabetoConjunto, 'rows');
            fonteTraduzida = fonteTraduzida(:)';
            alfabetoTraduzido = unique(fonteTraduzida);
            entropia_conjunta = calcula_agrupado(fonteTraduzida,alfabetoTraduzido);
            infor_mutua_val = entropia_query + entropia_window - entropia_conjunta;
            infor_mutua(n_line, n_col) = infor_mutua_val;
            n_col = n_col + 1;
        end
        n_col = 1;
        n_line = n_line + 1;
    end
    variacao = entropia_query - infor_mutua;
    maximo = max(max(infor_mutua));
    [iy,ix]= find(infor_mutua==maximo);
    x1 = (ix-1) * step;
    width = ncol_q;
    y1 = (iy-1) * step;
    height = nline_q;
end