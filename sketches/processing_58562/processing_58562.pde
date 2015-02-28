
/* Briefing 1
   Composição b) - Random
   Maryana Kruk #27300*/
      

void setup(){  /*Função para estabelecer as definições do nosso programa/aplicação*/
  size(500,300); /*Estabelecer o tamanho da janela*/
  background(0); /*Definir a cor do fundo (preto)*/
  smooth();  /*Suavizar as formas*/
}

void draw(){ /*Função para desenhar*/
  for (int i=0; i<260; i++){  /*Ciclo for, ocorre até "i" ser igual a 259*/
    float posX=random(0,width); /*Declarar e inicializar uma variável decimal com valor aleatório enre 0 e a largura da janela*/
    float posY=random(0,height); /*Declarar e inicializar uma variável decimal com valor aleatório enre 0 e a altura da janela*/
    float diam=random(45,90); /*Declarar e inicializar uma variável decimal com valor aleatório enre 45 e 90*/
    float ponto=random(1,diam/6); /*Declarar e inicializar uma variável decimal com valor aleatório enre 1 e diam/6*/
    fill(random(255),random(255),random(255),random(5,95)); /*Preencher com cor aleatória e transparência entre 5 e 95%*/
    ellipse(posX,posY,diam,diam*1); /*Desenhar uma elipse */
    fill(0); /*Preencher com cor preta*/
    ellipse(posX,posY,ponto,ponto); /*Desenhar uma elipse */
  }
  
  noLoop();  /*Função para não haver repetições, neste caso do "void draw"*/
}
  

