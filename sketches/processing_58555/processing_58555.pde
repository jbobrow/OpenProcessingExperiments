
/* Briefing 1
   Composição b) - 1D Grid
   Maryana Kruk #27300*/
      
float posX=20; /*Declarar e inicializar variável decimal para posição horizontal*/
float posY; /*Declarar variável decimal para posição vertical*/
float diam = 50; /*Declarar e inicializar variável decimal para o diâmetro*/


void setup(){ /*Função para estabelecer as definições do programa*/
  size(600,200); /*Definir tamanho da janela*/
  background(255); /*Definir cor de fundo - branco*/
  smooth(); /*Função para suavizar as formas*/
  noLoop(); /*Função para não haver repetições do programa*/
  rectMode(CENTER); /*Modo de desenhar o rectângulo, à partir do centro do mesmo*/
  ellipseMode(CENTER); /*Modo de desenhar a elipse, à partir do centro da mesma*/
}

void draw(){ /*Função para desenhar*/
  for (int i=0; i<10; i++){  /*Ciclo for ocorre até i ser igual a 9*/
    posX=posX+50; /*Alterar o valor de "posX", aumentando 50 píxeis de cada vez que ocorre o ciclo*/
    posY=height/2; /*Inicializar variável de "posY", com o valor igual ao centro vertical da janela*/
    noStroke(); /*sem contorno*/
    fill(10); /*Cor de preenchimento*/
    rect(posX,posY,diam,diam); /*Desenhar um rectângulo com valores novos de cada vez que ocorre o ciclo*/
    fill(250); /*Cor de preenchimento*/
    ellipse(posX,posY,diam,diam); /*Desenhar uma elipse com valores novos de cada vez que ocorre 
                                    o ciclo(iguais aos parametros dos rectângulos)*/

  }   
}

