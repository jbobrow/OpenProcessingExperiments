
//yumi wang processing
// project 2
 

 
//initialise display
int randomX = 0;
int randomY = 0;
int WWX = 180;
int WWY = 180;
 
float pointR;
float pointG;
float pointB;

float[] x = new float[20];
float[] y = new float[20];
float segLength = 10;

void setup() {
  size(400, 400);
  background(89,140,65);
  ellipseMode (CENTER);
  noStroke ();
  fill (25,216,155);
  frameRate(5);
  smooth(); 
  strokeWeight(5);
  stroke(89 ,90 , 60);
}

void draw() {
  background(mouseY,mouseX,mouseX);
  dragSegment(0, mouseX, mouseY);
    ellipseMode (CENTER);
  noStroke ();
  fill (250,216,255);
   float ran = random(0,500);
  randomX = int(ran);
  ran = random(0,400);
  randomY = int(ran);
WWX=randomX;
  WWY=randomY;

  for(int i=0; i<x.length-1; i++) {
    dragSegment(i+1, x[i], y[i]);
  }
}

void dragSegment(int i, float xin, float yin) {
  float dx = xin - x[i];
  float dy = yin - y[i];
  float angle = atan2(dy, dx);  
  x[i] = xin - cos(angle) * segLength;
  y[i] = yin - sin(angle) * segLength;
  segment(x[i], y[i], angle);
}

void segment(float x, float y, float a) {
  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
  popMatrix();

 
//torso//
ellipseMode(CENTER);
rectMode(CENTER);
stroke(0);
ellipse(WWX+7,WWY+20,8,8);
ellipse(WWX+8,WWY+20,8,8);
 
 
//body
pointR = random(255);
pointG = random(255);
pointB = random(255);
fill(pointR,pointG,pointB);
stroke(0);
ellipse(x,WWX+10,WWY+8,WWY+5);


stroke(0);
fill(150);
rect(WWX+100,WWY+100,20,100);
 
//belt
fill(12,45,98);
rect(mouseX-10,mouseY-10,20,10);
ellipse(mouseX-10,mouseY-10,20,10);
 
//head
fill(255);
ellipse(WWX+100,WWY+70,60,60);

//faceß
fill(0);
ellipse(WWX+81,WWY+70,16,32);
ellipse(WWX+119,WWY+70,16,32);
//torso
stroke(0);
line(WWX+90,WWX+150,WWX+80,WWY+160);
line(WWX+110,WWX+150,WWX+120,WWY+160);
 
stroke(0);
line(WWX+70,WWX+100,WWX+90,WWY+100);
line(WWX+130,WWX+100,WWX+90,WWY+100);

 
//hat
fill(115,10,220);
arc(WWX+100, WWY+50, 60, 50, TWO_PI-PI/2, TWO_PI);
arc(WWX+100, WWY+50, 60, 50,  PI, TWO_PI-PI/2);
 
 
 
triangle(WWX+30, WWY+35, WWX+100, WWY+20, WWX+170, WWY+35);



}



