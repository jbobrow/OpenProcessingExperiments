
int a; 
int x;
int s;
float o=0;
float[] rx;
float[] ry;
float[]rx1;
float[]ry1;
int h;

void setup() {
  size(700, 600);
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
}
void draw() {

  //sol:
  noStroke();
  background(171, 207, 252);
  fill(242, 242, 56);
  ellipse (350, 200, 300, 300);
  // nuvens:
  x++; 
  fill (255);
  ellipse (x-500, 30, 110, 10);
  ellipse (x+175, 120, 89, 10);
  ellipse (x+150, 100, 150, 12);
  ellipse (x-100, 70, 130, 10);
  ellipse (x-175, 190, 100, 14);
  ellipse (x-120, 180, 90, 10);
  ellipse (x-400, 170, 70, 10);
  fill(36, 124, 167);
  rect(0, 250, 700, 400);
  //pássaros:
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

  //praia:
  noStroke();
  fill(228, 234, 182);
  rect(0, 400, 700, 200);
  //mar segunda parte:
  stroke(0, 0, random(100, 255));
  strokeWeight(2);

  for (int i=0; i<300; i++) {
    line(rx[i]+50*sin(o), ry[i], rx1[i]+40*sin(o), ry1[i]);
    o=o+0.0006;
  }
  //bóia:
  fill(252,0,0);
  noStroke();
  ellipse(h++,310,50,50);
  fill(121,126,240);
  ellipse(h++,310,20,20);

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
}
//apertar letra b para piscar a tela:
void keyPressed() {
  char letter='b';
  switch (letter) {
  case 'B':
  case 'b':
    background(234, 232, 144);
    break;
  }
}

