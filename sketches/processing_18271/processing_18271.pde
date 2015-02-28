
float A;
float B;
float C;
float D;
float E;
float F;
float G;
PFont police;
float H;
float I;
float J;

void setup() {
  size(500,600);
  smooth();
  police=loadFont("poliiice.vlw");
  background(255);
  textFont(police,50);
  G=100;
  H=300;
}

void draw() {
  frameRate(10);
  A=random(500);
  B=random(600);
  C=random(500);
  D=random(600);
  E=random(500);
  F=random(600);
  I=random(600);
  J=random(100);

  if(keyCode==ENTER) {
    strokeWeight(1.5);
    stroke(0);
    fill(255,230,3,200);
    ellipse(A,B,15,15);
    ellipse(A-2,B-1,1,1);
    ellipse(A+2,B-1,1,1);
    arc(A,B+1,8,8,radians(10),radians(170));
    strokeWeight(2.5);
    stroke(35,3,255,175);
    fill(255);
    rect(C,D,35,20);
    rect(C+5,D+8,6,9);
    line(C+11,D+10,C+14,D+8);
    line(C+14,D+8,C+18,D+3);
    line(C+18,D+3,C+18,D+7);
    line(C+18,D+7,C+21,D+8);
    line(C+21,D+8,C+21,D+17);
    line(C+21,D+17,C+14,D+17);
    line(C+14,D+17,C+11,D+15);
    line(C+23,D+5,C+26,D+3); 
    line(C+26,D+3,C+26,D+14);
    line(C+23,D+14,C+29,D+14);
    stroke(0);
    strokeWeight(1.5);
    line(E,F,E,F+10);
    ellipse(E+6,F+8,4,4);
    line(E+12,F,E+12,F+10);
  }

  if (G>500) {
    H=I;
    G=J;
    background(255);
  }
}

void keyTyped() {
  G=G+50;
  fill(0);
  text(key,G,H);
}


