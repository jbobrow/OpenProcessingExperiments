
//Bianca Elisa Gabardo
//25/02/2014
//O trabalho Praia de Bianca Elisa Gabardo está licenciado com uma Licença Creative Commons - Atribuição-CompartilhaIgual 4.0 Internacional.
int a; 
int x;
int s;
float o=0;
float[] rx;
float[] ry;
float[]rx1;
float[]ry1;
int c;
int h;
int modulo=6;
int ancho=modulo*100;
int alto=modulo*100;
PFont myFont;


void setup() {
  size(700, 600);
  //texto:
  myFont= createFont ("ScriptS-48.vlw", 48);
  textFont(myFont);
  textAlign(CENTER, 700);

  //mar primeiraa parte:
  background(171, 207, 252);
  rx= new float[300];
  rx1= new float[300];
  ry= new float[300];
  ry1= new float[300];
  for (int i=0; i<300; i++) {
    rx[i]=random(-200, 900);
    ry[i]=random(250, 410);
    rx1[i]= random(-200, 900);
    ry1[i]=ry[i];
  }
  //pássaros:
  noStroke();
  fill(100);
  triangle(50, 50, 80, 50, 65, 100);
  fill(171, 207, 252);
  triangle(40, 50, 80, 50, 65, 80);
  fill(100);
  triangle(90, 90, 120, 90, 105, 120);
  fill(171, 207, 252);
  triangle(80, 90, 120, 90, 105, 107);
  fill(100);
  triangle(70, 115, 100, 135, 80, 160);
  fill(171, 207, 252);
  triangle(70, 110, 100, 135, 80, 140);
}
void draw() {
  int xx;
  //sol:
  noStroke();
  //background(171, 207, 252);
  fill(242, 242, 56);
  ellipse (350, 200, 300, 300);
  // nuvens:
  x++;
  xx=x/10; 
  fill (255);

  nuvens(xx);

  //arco-íris:
  smooth();
  strokeWeight(2*modulo);
  stroke(255, 0, 0);
  noFill();
  arc(0, alto/2.45, ancho/1.72, alto/3.2, TWO_PI-PI/2, TWO_PI);
  stroke(242, 154, 39);
  arc(0, alto/2.45, ancho/1.85, alto/3.7, TWO_PI-PI/2, TWO_PI);
  stroke(242, 242, 39);
  arc(0, alto/2.45, ancho/1.98, alto/4.12, TWO_PI-PI/2, TWO_PI);
  stroke(39, 173, 242);
  arc(0, alto/2.45, ancho/2.12, alto/4.60, TWO_PI-PI/2, TWO_PI);

  //praia:
  noStroke();
  fill(228, 234, 182);
  rect(0, 400, 700, 200);

  //mar segunda parte:
  stroke(0, 0, random(100, 255));
  strokeWeight(2);

  for (int i=0; i<300; i++) {
    line(rx[i]+50*sin(o/10.0), ry[i], rx1[i]+40*sin(o/10.0), ry1[i]);
    o=o+0.0006;
  }  
  //bóia:
  bola(xx%width, 310);

  //Rede:
  strokeWeight(1);
  for (int a = 600; a >500; a-=10) {
    noFill();
    stroke(0, 0, 0);
    bezier(300, 400, 150, a, 20, 400, 15, 400);
  }
  strokeWeight(4);
  line(300, 390, 300, 500);
  line(15, 390, 15, 500);
  //texto:
  fill(150);
  text("Praia", 550, 550);
}
//apertar letra b e mudar fundo:
void keyPressed() {
  char letter='b';
  switch (letter) {
  case 'B':
  case 'b':
    background(234, 232, 144);
    //pássaros:
    noStroke();
    fill(100);
    triangle(50, 50, 80, 50, 65, 100);
    fill(234, 232, 144);
    triangle(40, 50, 80, 50, 65, 80);
    fill(100);
    triangle(90, 90, 120, 90, 105, 120);
    fill(234, 232, 144);
    triangle(80, 90, 120, 90, 105, 107);
    fill(100);
    triangle(70, 115, 100, 135, 80, 160);
    fill(234, 232, 144);
    triangle(70, 110, 100, 135, 80, 140);
    break;
  }
}
//boia:
void bola(int x, int y) {
  pushStyle();
  fill(252, 0, 0);
  noStroke();
  ellipse(x, y, 50, 50);
  fill(121, 126, 240);
  ellipse(x, y, 20, 20);
  popStyle();
}

void nuvens(int xx) {
  ellipse (xx%width-500, 30, 110, 10);
  ellipse (xx%width+175, 120, 89, 10);
  ellipse (xx%width+150, 100, 150, 12);
  ellipse (xx-100, 70, 130, 10);
  ellipse (xx-175, 190, 100, 14);
  ellipse (xx%width-120, 180, 90, 10);
  ellipse (xx-400, 170, 70, 10);
  fill(36, 124, 167);
  rect(0, 250, 700, 400);
}

