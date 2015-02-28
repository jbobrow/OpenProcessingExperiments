
/* Briefing 1
   Composição b) - Probabilities
   Maryana Kruk #27300*/
      
float x1; /*Declarar uma variável decimal para coordenada x */
float y1; /*Declarar uma variável decimal para coordenada y */
float diam; /*Declarar uma variável decimal para a largura/altura */
color c= color(0,250,255); /*Declarar e inicializar uma variável de cor */


void setup(){  /*Função para estabelecer as definições do nosso programa/aplicação*/
  size(600,600); /*Estabelecer o tamanho da janela*/
  background(0); /*Definir a cor do fundo (preto)*/
  smooth();  /*Suavizar as formas*/
}

void draw(){ /*Função para desenhar*/
  for (int i=0; i<200; i++){  /*Ciclo for, ocorre até "i" ser igual a 199*/
    x1=random(0,width-50); /*Inicializar a variável "x1" com valor aleatório entre 0 e a largura da janela menos 50 píxeis*/
    y1=random(0,height-50); /*Inicializar a variável "y1" com valor aleatório entre 0 e a altura da janela menos 50*/
    diam=random(25,65); /*Inicializar a variável "diam" com valor aleatório entre 25 e 65*/
    noFill(); /*Sem cor de preenchimento*/
    stroke(c,random(90,100)); /*Definir cor do traço e transparência entre 90 e 100%*/
    rect(x1,y1,diam,diam); /*Desenhar um rectângulo */ 
    
    if (diam<35){ /*Condição "se", estabelece 25% de probabilidade dos quadrados terem cor de preenchimento*/
      fill(c); /*Cor de preenchimento*/
      rect(x1,y1,diam,diam); /*Desenhar um rectângulo*/
    }
  }
  noLoop(); /*Função para não haver repetições, neste caso do "void draw"*/
     
}
  

