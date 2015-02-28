
size (800, 800);// definir o tamanho da janela

background (0);//definir a cor de fundo (preto)

float r;//variavel para a cor r - vermelho
float g;//variavel para a cor g - verde
float b;//variavel para a cor b _ azul

r = random (255);// vermelho aleatorio em qualquer tom da cor
g = random (255);//verde aleatorio em qualquer tom da cor
b = random (255);//azul aleatorio em qualquer tom da cor


smooth();//suavizar as formas

ellipseMode (CENTER);// definir o modo de posição da elipse para o centro
ellipse (400, 400, 800, 800);//desenho de uma elipse

for ( int i = 0; i < 10000; i++){//variavel para gerar um numero de objectos = 10000
  
  fill (0, 0, b);//cor aleatoria no azul
  ellipse (random  (200, 300) , random (150,250), 10, 10);
  //geral uma parcela de objectos(elipses) situadas entre os px 200, e 300
  
  ellipse (random  (500, 600) , random (150,250), 10, 10);
  //geral uma parcela de objectos(elipses) situadas entre os px 500, e 600
  
  fill (0, g, b);// a cor aleatoria no verde 
  ellipse (random  (375, 425) , random (300,450), 10, 10);
  //geral uma parcela de objectos(elipses) situadas entre os px 375, e 425
  
  fill (r, 0, 0);//a cro aleatoria no vermelho
  ellipse (random  (150, 650) , random (550,600), 10, 10);
 //geral uma parcela de objectos(elipses) situadas entre os px 150, e 650
  
  
}

