clc, clear
opcoes = ["lyrics.txt","landscape.bmp","MRI.bmp","MRIbin.bmp","soundMono.wav","Exercicio 6"];
for i = 1:length(opcoes)
    fprintf("%d - %s\n", i, opcoes(i));
end
opc = input('Qual o ficheiro que deseja abrir?(Digite o número)  ');
if ((1 <= opc) && (opc <= 5))
    n = input("Deseja introduzir algum alfabeto?(Sim-1/Nao-0) ");
    if (n == 1)
        alfa = input("Insira um alfabeto: ");
        figure;
        subplot(1,2,1);
        calculahist2(opcoes(opc),alfa);
        fprintf("Entropia = %f\n", entropia2(opcoes(opc), alfa));
        fprintf("Número médio de bits = %f\n", Huffman2(opcoes(opc),alfa));
        subplot(1,2,2);
        fprintf("Entropia Agrupado = %f\n" , agrupado(opcoes(opc)));
        
    else
        figure;
        subplot(2,1,1);
        calculahist2(opcoes(opc));
        fprintf("Entropia = %f\n", entropia2(opcoes(opc)));
        fprintf("Número médio de bits = %f\n", Huffman2(opcoes(opc)));
        subplot(2,1,2);
        fprintf("Entropia Agrupado = %f\n" , agrupado(opcoes(opc)));
    end
elseif (opc == 6)
    opcoes6 = ["target_original.bmp", "target_noise.bmp", "target_inverted.bmp", "target_lightning_contrast.bmp","target1.bmp","target2.bmp","target3.bmp","target4.bmp"];
    for i = 1:length(opcoes6)
        fprintf("%d - %s\n", i, opcoes6(i));
    end
    alfa = 0:255;
    query = "query.bmp";
    opc1 = input('Qual o primeiro ficheiro que deseja abrir?(Digite o número)  ');
    [infor_mutua1,variacao,maximo,x,y,width,height] = calcula_inform_mutua(query,opcoes6(opc1),alfa,15);
    fprintf("Informação Mutua:\n");
    disp(infor_mutua1);
    fprintf("Informação Mutua Máxima:\n");
    disp(maximo);
    fprintf("Variação:\n");
    disp(variacao);
    figure;
    imshow(opcoes6(opc1));
    rectangle('Position', [x, y, width, height], 'LineWidth', 2, 'LineStyle', '--', 'EdgeColor', 'r');
else
    disp("Introduza um número válido\n");
end
  
