
import processing.opengl.*;

float count = 0.0;
float speed = 1.0/60.0;
int ps;

PFont font;

void setup() {
  size(600, 600, OPENGL);
  smooth();
  frameRate(60);
  rectMode(CENTER);
  textAlign(CENTER);
  textSize(64);
  fill(204);
  font = loadFont("HelveticaNeue-Bold-64.vlw");
  textFont(font);
}

void draw() {
  
  pointLight(255, 255, 255, width/2, height/2, 600);
  background(51);
  
  fill(204);
  
  translate(width/2+120, height/2, -600);
  rotateY(-2*TWO_PI/60);
  
  int s = second();
  count += speed;
  if(ps != s) count = 0.0;
  for (int i = 0; i < 60; i++) {
    pushMatrix();
    rotateX((s+count-i)*TWO_PI/60.0);
    translate(0, 0, 600);
    text(nf(i,2), 0, 24);
    popMatrix();
  }
  
  translate(-100, 0, 0);
  int m = minute();
  for (int i = 0; i < 60; i++) {
    pushMatrix();
    rotateX((m+(s+count)/60.0-i)*TWO_PI/60.0);
    translate(0, 0, 600);
    text(nf(i,2), 0, 24);
    popMatrix();
  } 
  
  translate(-100, 0, 360);
  int h = hour();
  for (int i = 0; i < 24; i++) {
    pushMatrix();
    rotateX((h+(60*m+s)/3600.0-i)*TWO_PI/24.0);
    translate(0, 0, 240);
    text(nf(i,2), 0, 24);
    popMatrix();
  }
  
  ps = s;
  
  fill(204, 51);
  stroke(0, 102);
  
  translate(0, 0, 300);
  rect(0, 0, 2000, 70);
  
}

