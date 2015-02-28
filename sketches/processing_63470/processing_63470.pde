
size (600, 600);// tamanho da janela

background (0);// cor de fundo (preto)


smooth();//suavizar as formas

int cdpm = 1000;// definiçao de uma variavel com o numero de objectos = 1000

float posX, posY;//variavel para a posiçao x e para a posiçao y
float r, g, b;// variavel para a as cores r- verelho, g- verde, b- azul
float px, py;//variavel para a posiçao x e y


  
posX = width/2;//definiçao das coordenadas das variavel posX
posY = height/2;//definiçao das coordenadas das variavel posy
  
px = width/2;//definiçao das coordenadas das variavel px
py = height/2;//definiçao das coordenadas das variavel py

for ( int i = 0; i < cdpm; i++){  //variavel para gerar o numero de objectos a desenhar
  
  posX = width/2 + random (-i, i);//definiçao da coordenada da variavel da posX com a geraçao de objectos
  posY = height/2 + random (-i, i);//definiçao da coordenada da variavel da posY com a geraçao de objectos
  
  g = map ( i, 0, cdpm, 0, 255);//definição do valor da variavel g- verde(mapeamento)
  b = map ( i, 0, cdpm, 0, 255);//definição do valor da variavel b- azul(mapeamento)
  
  fill (0, 0, b, 90);//definição da cor e do 4 parametro o alpha
  ellipse (posX, posY, 50, 50);// desenho de uma elipse
  
  
  fill (0, g, 0);// definiçao da cor
  ellipse (posX, posY, 25, 25);//desenho de elipse
  
  stroke (255);//definição da cor do contorno
  line (px, py, posX, posY);//desenho de linhas que se relacionam com a elipse
  
}




