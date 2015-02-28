
//Gustavo Batista Machado
//O trabalho Estudo Geométrico - versão 4 de Gustavo Machado está licenciado com uma Licença Creative Commons - Atribuição 4.0 Internacional. Baseado no trabalho disponível em http://www.openprocessing.org/sketch/141382.
//Formas geomÃ©tricas interativas com mouse e teclado
//Interaja utilizando as teclas 'R', 'G' e 'B' e movimentando o mouse na tela para alterar as formas

//FunÃ§Ã£o determinante da chuva
int pingos=1000;
int num=20;
int l=200;
int a=l;
int x=mouseX;
int y=mouseY;
float [] chuvax;
float [] chuvay;

color c1= color(255, 0, 0);//vermelho
color c2= color(0, 255, 0);//verde
color c3= color(0, 0, 255);//azul
color c4= color(255, 255, 0);//amarelo
color c5= color(255, 0, 255);//magenta
color c6= color(255);//branco

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
    //retÃ¢ngulos em fundo vermelho
  case 'R':
  case 'r':
    background (c1);
    retangulorandomico(mouseX/2, mouseY/2, 2*l/3, 2*l/3, c6);
    retangulorandomico(mouseX/4, mouseY/4, l/6, a/6, c6);
    retangulorandomico(5*mouseX/6, 5*mouseY/6, l/3, a/3, c6);
    break;

    //elipses em fundo verde
  case 'G':
  case 'g':
    background(c2);
    elipserandomica(mouseX, mouseY, l, a, c6);
    elipserandomica(mouseX/4, mouseY/4, l/2, a/2, c6);
    elipserandomica(5*mouseX/6, 7*mouseY/8, l/3, a/3, c6);
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

void retangulorandomico (int x, int y, int l, int a, color c6) {
  stroke(c1);
  strokeWeight(4);
  if (x>y)
    fill(c4);
  else
    fill(c6);
  for (int i=0; i<num; i++) {
    rect(int(random(x, (x+l))), int(random(y, (y+a))), l, a);
  }
}

void elipserandomica (int x, int y, int l, int a, color c6) {
  stroke(c2);
  strokeWeight(4);
  if (x>y)
    fill(c5);
  else
    fill(c6);
  for (int i=0; i<num; i++) {
    ellipse(int(random(x, (x+l))), int(random(y, (y+a))), l, a);
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
