function [file,ext] = leFormato2(f)
    %L� o formato do ficheiro inserido
    %E usa a fun��o de leitura correspondente
    [~, ~, format] = fileparts(f);
    switch format
        case ".txt"
            file = fileread(f);
        case ".bmp"
            file = imread(f);
        case ".wav"
            [file,~] = audioread(f);
        otherwise
            disp("Erro! Formato n�o reconhecido.");
    end
    ext = format;
end

