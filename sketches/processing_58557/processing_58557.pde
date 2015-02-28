
/* Briefing 1
   Composição b) - Bounding Boxes
   Maryana Kruk #27300*/
      
float x1; /*Declarar uma variável decimal para coordenada x do ponto1 */
float x2; /*Declarar uma variável decimal para coordenada x do ponto2*/
float y1; /*Declarar uma variável decimal para coordenada y do ponto1 */
float y2; /*Declarar uma variável decimal para coordenada y do ponto2*/


void setup(){  /*Função para estabelecer as definições do nosso programa/aplicação*/
  size(600,400); /*Estabelecer o tamanho da janela*/
  background(0); /*Definir a cor do fundo (preto)*/
  smooth();  /*Suavizar as formas*/
}

void draw(){ /*Função para desenhar*/
  noStroke(); /*Sem contorno*/
  fill(255); /*Preencher com cor branca*/
  rectMode(CENTER); /*Definir o modo de desenhar o rectângulo (à partir do centro)*/
  float posX = width/3-35; /*Declarar e inicializar uma variável decimal "posX"*/
  float posY = height/2; /*Declarar e inicializar uma variável decimal "posY"*/
  float diam = 200; /*Declarar e inicializar uma variável decimal "diam"*/
  rect(posX,posY,diam,diam); /*Desenhar um rectângulo*/
  posX = width-width/3+35; /*Alterar o valor de "posX"*/
  posY = height/2; /*Alterar o valor de "posY"*/
  rect(posX,posY,diam,diam); /*Desenhar um rectângulo com os novos valores*/
  
  for (int i=0; i<150; i++){  /*Ciclo for, ocorre até "i" ser igual a 149*/
    strokeWeight(2.5); /*Definir a espessura de traço para 2.5 píxeis*/
    x1=random(width/3-134,width/3+64); /*Inicializar a variável "x1" com valor aleatório entre width/3-134 e width/3+64*/
    y1=random(height/2-99,height-101); /*Inicializar a variável "y1" com valor aleatório entre height/2-99 e height-101*/
    x2=random(width/3-134,width/3+64); /*Inicializar a variável "x2" com valor aleatório entre width/3-134 e width/3+64*/
    y2=random(height/2-99,height-101); /*Inicializar a variável "y2" com valor aleatório entre height/2-99 e height-101*/
    stroke(255,0,255,random(5,75)); /*Definir cor do traço e transparência entre 5 e 75%*/
    line(x1,y1,x2,y2); /*Desenhar uma linha */
  }
  
  for (int i=0; i<150; i++){  /*Ciclo for, ocorre até "i" ser igual a 149*/
    x1=random(width-width/3-64,width-width/3+134); /*Inicializar a variável "x1" com valor aleatório entre width-width/3-64 e width-width/3+134*/
    y1=random(height/2-99,height-101); /*Inicializar a variável "y1" com valor aleatório entre height/2-99 e height-101*/
    x2=random(width-width/3-64,width-width/3+134); /*Inicializar a variável "x2" com valor aleatório entre width-width/3-64 e width-width/3+134*/
    y2=random(height/2-99,height-101); /*Inicializar a variável "y2" com valor aleatório entre height/2-99 e height-101*/
    stroke(255,0,255,random(5,75)); /*Definir cor do traço e transparência entre 5 e 75%*/
    line(x1,y1,x2,y2); /*Desenhar uma linha */
  }
     
}
  

