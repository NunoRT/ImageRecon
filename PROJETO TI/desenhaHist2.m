function desenhaHist2(formato, alfa, h)
%Desenha o histograma conforme
%o ficheiro escolhido
    bar(double(alfa),h);
    ylabel("Freq. absoluta");
    switch formato
        case ".txt"
            xlabel("Código ASCII");
        case ".bmp"
            xlabel("Claridade");
        case ".wav"
            xlabel("Amplitude");
        otherwise
            fprintf("Erro! Formato não reconhecido.");
    end
end

