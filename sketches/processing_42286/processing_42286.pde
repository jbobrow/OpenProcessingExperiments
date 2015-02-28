
//Author: Herbert Hsu
//Purpose: creating effect with loops
//Concept: demonstrating how colorful Tetris perform an air-raid at night

void setup() {
  size (600, 450);

  smooth();
  frameRate(16);
}
float a=second();
float b=3*second();
float c=5*second();
float d=6*second();
float e=8*second();
float f=2*second();
float g=7*second();
float h=second();
//float i=1;
float x1=second()-50;
float x2=second();
float x3=second()+20;
float y=second()+40;
float y1=second()-60;
float z=second()+40;
float z1=second();
int m=20;

void draw() {
  //THE SKY (h)
  h=h+0.2;
  // background(85*sin(h)); 
  background(20);
  fill(255, 233, 95, 150*sin(h));
  rect(0, 0, 600, 450);
  noStroke();

  //THE SMALL Z 1 (a)

  a=a+0.5;
  fill(15*a, 10*c, 120);
  beginShape();
  vertex(width-20*a, x1);
  vertex(width-20*a, x1+10);
  vertex(width-20-20*a, x1+10);
  vertex(width-20-20*a, x1);
  vertex(width-30-20*a, x1);
  vertex(width-30-20*a, x1-10);
  vertex(width-10-20*a, x1-10);
  vertex(width-10-20*a, x1);
  endShape(CLOSE);
  if (a>30) {
    a=0;
    fill(255, 233, 95, 100);
    ellipse(0, x1, 30, 30);
    x1=x1+100;
    fill(30);
  }
  else if (x1>400) {
    x1=0;
  }
  //THE SMALL Z 2 (c)
  c=c+1;
  fill(0, 15*c, 15*d);
  beginShape();

  vertex(width-20*c, x2+100);
  vertex(width-20*c, x2+110);
  vertex(width-20-20*c, x2+110);
  vertex(width-20-20*c, x2+100);
  vertex(width-30-20*c, x2+100);
  vertex(width-30-20*c, x2+90);
  vertex(width-10-20*c, x2+90);
  vertex(width-10-20*c, x2+100);
  endShape(CLOSE);
  if (c>30) {
    c=0;
    fill(255, 233, 95, 100);
    ellipse(0, x2+100, 30, 30);
    x2=x2+150;
  }
  else if (x2>400) {
    x2=80;
  }
  //THE SMALL Z 3 (d)
  d=d+0.7;
  fill(100+10*d, 66, 145-10*c);
  beginShape();
  vertex(width-20*d, x3+100);
  vertex(width-20*d, x3+110);
  vertex(width-20-20*d, x3+110);
  vertex(width-20-20*d, x3+100);
  vertex(width-30-20*d, x3+100);
  vertex(width-30-20*d, x3+90);
  vertex(width-10-20*d, x3+90);
  vertex(width-10-20*d, x3+100);
  endShape(CLOSE);
  if (d>30) {
    d=0;
    fill(255, 233, 95, 100);
    ellipse(0, x3+100, 30, 30);
    x3=x3+210;
  }
  else if (x3>400) {
    x3=0;
  }
  //THE I 1(b)

  b=b+0.3;
  fill(255-4*b, 100, 100+4*b);
  beginShape();
  vertex(width-12*b, y);
  vertex(width-12*b, y+2*m);
  vertex(width-8*m-12*b, y+2*m);
  vertex(width-8*m-12*b, y);
  endShape(CLOSE);
  if (b>50) {
    fill(255, 233, 95, 100);
    ellipse(0, y+m, 60, 60);
    b=0;
    y=y+60;
  }
  else if (y>400) {
    y=50;
  }
  //THE I 2(e)
  e=e+0.5;
  fill(255-6*e, 130+3*e, 41);
  beginShape();
  vertex(width-12*e, y1);
  vertex(width-12*e, y1+2*m);
  vertex(width-8*m-12*e, y1+2*m);
  vertex(width-8*m-12*e, y1);
  endShape(CLOSE);
  if (e>50) {
    fill(255, 233, 95, 100);
    ellipse(0, y1+m, 60, 60);
    e=0;
    y1=y1+140;
  }
  else if (y1>400) {
    y1=0;
  }
  //THE O 1 (f)
  f=f+0.8;
  fill(255, 190-4*f, 41+6*f);

  beginShape();
  vertex(width-12*f, z);
  vertex(width-12*f, z+4*m);
  vertex(width-4*m-12*f, z+4*m);
  vertex(width-4*m-12*f, z);
  endShape(CLOSE);
  if (f>50) {
    fill(255, 233, 95, 100);
    ellipse(0, z+m, 60, 60);
    f=0;
    z=z+200;
  }
  else if (z>400) {
    z=0;
  }
  //THE O 2 (g)
  g=g+0.4;
  fill(117, 204-6*g, 204-5*g);
  beginShape();
  vertex(width-12*g, z1);
  vertex(width-12*g, z1+4*m);
  vertex(width-4*m-12*g, z1+4*m);
  vertex(width-4*m-12*g, z1);
  endShape(CLOSE);
  if (g>50) {
    fill(255, 233, 95, 100);
    ellipse(0, z1+m, 60, 60);
    g=0;
    z1=z1+200;
  }
  else if (z1>400) {
    z1=100;
  }

}

void keyPressed(){
saveFrame("the air-raid alarm.jpg");
    }


