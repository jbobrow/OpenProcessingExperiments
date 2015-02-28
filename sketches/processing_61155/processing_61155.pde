
int totalObj;//variavel para o numero total de quadrados
float r,g,b;//variavel para a cor dos quadrados
float percent;//variavel para a percentagem de quadrados a cores
float probabilidade;//variavel para a probabilidade
int countProbabilidade;//variavel para contar quantos quadrados foram pintados

void setup(){/*Função que serve para fazer as definições*/
 size(500,500);//tamanho da tela
 smooth();//suavizar as formas
 noLoop();//definir para que não haja loop na composição
 totalObj = 200;//numero total de quadrados na composição
 percent = 50;//percentagem dos quadrados pintados (25%)
 probabilidade = 200 - percent;//teste de probabilidades
   countProbabilidade = 0;//counter de verificação dos quadrados pintados
}

void draw(){/*Função para desenhar*/
 background(0);//cor de fundo
 for (int i = 0; i < totalObj; i = i+1){//ciclo para os quadrados até desenhar 200 objectos
 float posX = random(width);//variavel de x1 dos quadrados
 float posY = random(height);//variavel de y1 dos quadrados
 float posX2 = random(width);//variavel de x2 dos quadrados
 float posY2 = random(height);//variavel de y2 dos quadrados
 float posX3 = random(width);//variavel de x3 dos quadrados
 float posY3 = random(height);//variavel de y3 dos quadrados
 float posX4 = random(width);//variavel de x4 dos quadrados
 float posY4 = random(height);//variavel de y4 dos quadrados
 
 
 if (random(200) > probabilidade){//condição para a probabilidade da cor seja vermelha
   r = 255;//cor vermelha
   g = 0;//cor verde
   b = 0;//cor azul
   
   countProbabilidade = countProbabilidade +1;//iniciar a variavel "countProbabilidade"

 }
 else{//se a condição if não se verificar entao executar condição else( cor branca)
   r = 255;//cor vermelha
   g = 255;//cor verde
   b = 255;//cor azul
 }
 fill(r,g,b);//cor dos quadrados
//quad(x1,y1,x2,y2,x3,y3,x4,y4);
quad(posX,posY,posX2,posY2,posX3,posY3,posX4,posY4);//desenhar os quadrados
noStroke();//sem contorno
 }
}

