
/* Briefing 1
   Composição b) - Relational
   Maryana Kruk #27300*/
      
float posX; /*Declarar variável decimal para posição horizontal*/
float posY; /*Declarar variável decimal para posição vertical*/
float diam; /*Declarar variável decimal para o diâmetro*/
float x=random(50,width-50); /*Declarar e inicializar variável decimal para posição horizontal*/
float y=random(50,height-50); /*Declarar e inicializar variável decimal para posição vertical*/

void setup(){ /*Função para estabelecer as definições do programa*/
  size(600,600); /*Definir tamanho da janela*/
  background(0); /*Definir cor de fundo - preto*/
  smooth(); /*Função para suavizar as formas*/
  noLoop(); /*Função para não haver repetições do programa*/
  rectMode(CENTER); /*Modo de desenhar o rectângulo, à partir do centro do mesmo*/
}

void draw(){ /*Função para desenhar*/
  noStroke(); /*sem contorno*/
  fill(155,100,255); /*Cor de preenchimento*/
  diam=random(10,50); /*Inicializar a variável "diam" com valores aleatórios entre 10 e 50*/
  rect(x,y,diam,diam); /*Desenhar o 1º rectângulo*/
  for (int i=0; i<25; i++){  /*Ciclo for ocorre até i ser igual a 24*/
    posX=random(50,width-50); /*Inicializar a variavel "posX" com valores aleatórios restrictos*/
    posY=random(50,height-50); /*Inicializar a variavel "posY" com valores aleatórios restrictos*/
    diam=random(10,50); /*Instanciar outra vez a variavel "diam" para obter valores diferentes com cada repetição do ciclo*/
    rect(posX,posY,diam,diam); /*Desenhar um rectângulo com valores diferentes com cada repetição do ciclo*/
    strokeWeight(0.5); /*Espessura do traço igual a 0.5 píxeis*/
    stroke(232,115,5,90); /*Cor e transparência do traço*/
    line(x,y,posX,posY); /*Desenhar uma linha com os diferentes valores*/
    x=posX; /*Alterar o valor de "x"*/
    y=posY; /*Alterar o valor de "y"*/
    
  }   
}

