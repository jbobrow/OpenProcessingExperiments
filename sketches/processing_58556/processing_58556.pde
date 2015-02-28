
/* Briefing 1
   Composição b) - 2D Grid
   Maryana Kruk #27300*/
      
int x=80; /*Declarar e inicializar variável inteira para posição horizontal*/
int y=30; /*Declarar e inicializar variável inteira para posição vertical*/
float diam=10; /*Declarar e inicializar variável decimal para diâmetro*/
color c=color(10); /*Declarar e inicializar variável de cor*/


void setup(){ /*Função para estabelecer as definições do programa*/
  size(600,600); /*Definir tamanho da janela*/
  background(255); /*Definir cor de fundo - branco*/
  smooth(); /*Função para suavizar as formas*/
  noLoop(); /*Função para não haver repetições do programa*/
  ellipseMode(CENTER); /*Modo de desenhar a elipse, à partir do centro desta*/
}

void draw(){ /*Função para desenhar*/
  fill(c); /*Preeencher com cor "c"*/
  for ( x=80; x<550; x+=60){  /*Ciclo for ocorre até x ser igual a 549*/
    y=30; /*Alterar o valor de "y"*/
    c=c+10; /*Alterar o alor de "c"*/
    diam=diam+5; /*Alterar o valor de "diam", aumentando 5 píxeis de cada vez que ocorre o ciclo*/
    noStroke(); /*sem contorno*/
    fill(c); /*Preencher com cor "c" */
    ellipse(x,y,diam,diam); /*Desenhar uma elipse com valores novos de cada vez que ocorre o ciclo*/
    for (y=30; y<600; y+=60){ /*Ciclo for, ocorre até y ser igual a 599*/
      ellipse(x,y,diam,diam); /*Desenhar uma elipse com valores novos de cada vez que ocorre o ciclo*/
    }
  }   

}

