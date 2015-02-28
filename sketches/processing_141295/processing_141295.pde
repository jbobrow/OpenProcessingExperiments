
//Gustavo Batista Machado
//O trabalho Estudo GeomÃ©trico - versÃ£o 3 de Gustavo Machado estÃ¡ licenciado com uma LicenÃ§a Creative Commons - AtribuiÃ§Ã£o 4.0 Internacional. Baseado no trabalho disponÃ­vel em http://www.openprocessing.org/sketch/141295.

//Formas geomÃ�Â©tricas interativas com mouse e teclado
//Interaja utilizando as teclas 'R', 'G' e 'B' e movimentando o mouse na tela para alterar as formas

//FunÃ�Â§Ã�Â£o determinante da chuva
int pingos=1000;
int num=20;
float [] chuvax;
float [] chuvay;

color c1= color(255, 0, 0);//vermelho
color c2= color(0, 255, 0);//verde
color c3= color(0, 0, 255);//azul
color c4= color(255, 255, 0);//amarelo
color c5= color(255, 0, 255);//magenta

void setup() {
  size(600, 600);
  frameRate(8);

  //valores para pingos
  chuvax = new float [pingos];
  chuvay = new float [pingos];
  for (int i=0; i<pingos; i++) {
    chuvax[i]=floor(random(-width, width));
    chuvay[i]=floor(random(-height, -10));
  }
}

void draw() {

  smooth();

  switch(letter) {
    //retÃ�Â¢ngulos em fundo vermelho
  case 'R':
  case 'r':
    background (c1);
    retangulorandomico();
    break;

    //elipses em fundo verde
  case 'G':
  case 'g':
    background(c2);
    elipserandomica();
    break;

    //chuva em fundo azul
  case 'B':
  case 'b':
    background(c3);
    for (int i=0; i<pingos; i++) {
      pingo(i);
    }
    break;
  }
}

char letter='a';

void keyPressed() {
  letter=key;
}

void retangulorandomico () {
  stroke(c1);
  strokeWeight(4);
  if (mouseX>width/2)
    fill(c4);
  else
    fill(255);
  for (int i=0; i<num; i++) {
    rect(int(random(width)), int(random(height)), mouseX/2, mouseY/2);
  }
}

void elipserandomica () {
  stroke(c2);
  strokeWeight(4);
  if (mouseX>width/2)
    fill(c5);
  else
    fill(255);
  for (int i=0; i<num; i++) {
    ellipse(int(random(width)), int(random(height)), mouseX/2, mouseY/2);
  }
}

void pingo (int i) {
  stroke(255);
  strokeWeight(1);
  line (chuvax[i], chuvay[i], chuvax[i]+(mouseX/10), chuvay[i]+(mouseY/10));
  chuvax[i]=chuvax[i]+5;
  chuvay[i]=chuvay[i]+8;
  if (chuvay[i] > height) {
    chuvax[i]=floor(random(-width, width));
    chuvay[i]=floor(random(-height, -10));
  }
}
