
size (600, 600);//definir o tamanho da janela

background (255);// definir a cor de fundo


for ( int i = 0; i < 200; i++){// defenir um parametro para gerar um numero de objectos = a 200
 
  stroke (random (255), 0, 0);//cor vermelha aleatoria no contorno
  strokeWeight (random (15));// definir o contorno com uma espessura aleatoria ate 15px
  
  fill (0, random (255), random (255));// cor aleatoria para o prenchimento nos parametros (g,b / verde e azul)
  ellipse (random (width), random (height), 50, 50);//desenho de elipses com 50 px de raio e posição aleatoria




}

