%funcaopulso
yyaxis left
Tempo= 0:0.00000001:0.000015; %espaço no eixo que se quer analisar
y = rectangularPulse((10^5)*Tempo/2), [1 0]; %pulso retangular de pico 1V e tamanho 10us
ylim([-0.5 2])%limites do eixo y mostrados no gráfico

figure %criando nova figura
plot(Tempo, y,'g-') %plotando a funcao Y

hold on %juntando todos os graticos a partir de agora

%parametros do circuito RL
R= 200000; %resistencia 
L= 0.2; %indutância
tau= L/R; 
Vs= 1; %tensão de entrada = 1




%Funcao V(t)
Vt= Vs.*exp(-Tempo./tau).*heaviside(Tempo);
plot(Tempo,Vt,'b-')%funcao encontrada no site Electrical Academia
xlabel('Tempo');%nomeando os eixos
ylabel('Tensão');

ylim([-0.5 2])

%funcao da corrente
I1= (Vs/R)-(Vs/R)*exp(-Tempo/tau); %formula do livro



yyaxis right %alternando para o eixo y da direita
plot(Tempo,I1,'b--')

ylabel('Corrente');



legend('Pulso','Tensão','Corrente')

hold off