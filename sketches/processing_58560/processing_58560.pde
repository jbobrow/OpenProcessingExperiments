
/* Briefing 1
   Composição b) - Layers
   Maryana Kruk #27300*/
      

void setup(){  /*Função para estabelecer as definições do nosso programa/aplicação*/
  size(500,350); /*Estabelecer o tamanho da janela*/
  background(0); /*Definir a cor do fundo (preto)*/
  smooth();  /*Suavizar as formas*/
}

void draw(){ /*Função para desenhar*/
  noStroke(); /*Sem contorno*/
  float posX; /*Declarar uma variável decimal */
  float posY; /*Declarar uma variável decimal */
  float diam; /*Declarar uma variável decimal */
  
  for (int i=0; i<260; i++){  /*Ciclo for, ocorre até "i" ser igual a 259*/
    posX=random(-20,width); /*Inicializar a variável posX com valor aleatório enre -20 e a largura da janela*/
    posY=random(-20,height); /*Inicializar a variável posY com valor aleatório enre 0 e a altura da janela*/
    diam=random(45,90); /*Inicializar a variável diam com valor aleatório enre 45 e 90*/
    fill(255,255,0,random(5,75)); /*Preencher com cor amarela e transparência entre 5 e 75%*/
    rect(posX,posY,diam,diam*1); /*Desenhar um rectângulo */
  }
      
  for (int i=0; i<260; i++){  /*Ciclo for, ocorre até "i" ser igual a 259*/  
    posX=random(width/3,width); /*Inicializar a variável posX com valor aleatório enre 1 terço da largura da janela e a largura total*/
    posY=random(0,height); /*Inicializar a variável posY com valor aleatório enre 0 e a altura da janela*/
    diam=random(45,90); /*Inicializar a variável diam com valor aleatório enre 45 e 90*/
    fill(0,250,255,random(75,95)); /*Preencher com azul claro e transparência entre 75 e 95%*/
    ellipse(posX,posY,diam,diam*1); /*Desenhar uma elipse */
  }
    
  for (int i=0; i<260; i++){  /*Ciclo for, ocorre até "i" ser igual a 259*/
    posX=random(width-width/3,width+10); /*Inicializar a variável posX com valor aleatório enre width-width/3 e width+10*/
    posY=random(-20,height+20); /*Inicializar a variável posY com valor aleatório enre -20 e a altura da janela+20*/
    diam=random(45,90); /*Inicializar a variável diam com valor aleatório enre 45 e 90*/
    fill(255,50,50,random(10,75)); /*Preencher com vermelho e transparência entre 10 e 75%*/
    rect(posX,posY,diam,diam*1); /*Desenhar um rectângulo */
    }
  
  noLoop();  /*Função para não haver repetições, neste caso do "void draw"*/
}
  

