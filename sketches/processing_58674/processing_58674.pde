
size (600,480); // define o tamanho da janela
smooth(); // suaviza as formas

PImage img; // dizer ao programa que vamos importar uma imagem
img = loadImage("night.jpg"); // carrega a imagem para o programa
image (img, 0,0); // coloca a imagem na janela

  fill(255); // define a cor de preenchimento da forma
  ellipse(500,290,120,230); // constroi a forma e posiçao da elipse
  
  noStroke(); // retira a linha de contorno da forma
  fill(211,210,205); // define a cor de preenchimento da forma
  ellipse(500,265,110,160); // constroi a forma e posiçao da elipse
  
  fill(255); // define a cor de preenchimento da forma
  stroke(142,129,89); // define a cor da linha de contorno
  ellipse(500,200,100,110); // constroi a forma e posiçao da elipse
  
  fill(201,189,150); // define a cor de preenchimento da forma
  stroke(142,129,89); // define a cor da linha de contorno
  ellipse(500,200,90,100); // constroi a forma e posiçao da elipse
  
  fill(0); // define a cor de preenchimento da forma
  ellipse(480,190,20,20); // constroi a forma e posição da elipse
  
  fill(0); // define a cor de preenchimento da forma
  ellipse(520,190,20,20); // constroi a forma e posição da elipse
  
  fill(100,96,80); // define a cor de preenchimento da forma
  triangle(495,215,505,215,500,235); // constroi a forma e posiçao do triangulo
  
  noStroke(); // retira a linha de contorno da forma
  fill(93,55,15); // define a cor de preenchimento da forma
  rect(460,400,200,10); // constroi a forma e posoçao da rectangulo
  
  fill(255,177,21); // define a cor de preenchimento da forma
  rect(480,390,15,10); // constroi a forma e posoçao da rectangulo
  
   fill(255,177,21); // define a cor de preenchimento da forma
  rect(500,390,15,10); // constroi a forma e posoçao da rectangulo
  
  PFont myFont; // diz ao programa que vamos importar um tipo de letra
  myFont = loadFont ("ACaslonPro-Italic-48.vlw"); // carrega o tipo de letra para o programa
  textFont(myFont, 50); // define o tamanho do tipo de letra
  text("are you afraid of the dark?", 100,450); // introduz o texto entre aspas e define a sua posição
