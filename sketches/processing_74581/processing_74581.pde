
//homework 8
//Sharon Rubin
//srrubin@andrew.cmu.edu
//copyright © Sharon Rubin October 2012 Pittsburgh PA 15213 All Rights Reserved

float xtime = 0.0;
float ytime = 100.0;
float increment = 0.01;


void setup() {
  size (600, 600);
  stroke(255);
  smooth();
}

void draw() {
  background(18, 18, 40);
  noiseArc();
  keyPressed();
  drawEllipses();
  drawLine();
}

void drawEllipses() {
  fill(255, 0, 0, 95);
  noStroke();
  int x = 0;
  int y = 0;
  while ((x < width+100)) {
    ellipse(x, y, width/20, height/20);
    ellipse(x, height/5, width/20, height/20);
    ellipse(x, 2*(height/5), width/20, height/20);
    ellipse(x, 3*(height/5), width/20, height/20);
    ellipse(x, 4*(height/5), width/20, height/20);
    ellipse(x, height, width/20, height/20);
   x+=width/5;
 } 
  
}

void noiseArc() {
  float x = noise(xtime)*2*PI;
  float y = noise(ytime)*2*PI;
  xtime += 0.01;
  ytime += 0.01;
  fill(200);
  arc(width/2, height/2, width/2, height/2, x, y);
}

void drawLine() {
  if (mousePressed == true) {
    stroke(100);
    float length = noise(xtime)*200;
    float length2 = noise(ytime)*150;
    line(width/2, height/2, width/2, (height/2)+length);
    line(width/2, height/2, width/2, (height/2)-length);
    line(width/2, height/2, width/2+length, height/2);
    line(width/2, height/2, width/2-length, height/2);
    line(width/2, height/2, width/2+length2 , height/2+length2);
    line(width/2, height/2, width/2-length2 , height/2+length2);
    line(width/2, height/2, width/2-length2 , height/2-length2);
    line(width/2, height/2, width/2+length2 , height/2-length2);
    }  
}

void keyPressed() {
  if (key == ' ') {
    fill(147, 180, 2, 95);
    noStroke();
    int x = 0;
    int y = 0;
    rectMode(CENTER);
    float wd = noise(xtime)*200;
    float ht = noise(ytime)*200;
    while ((x < width+100)) {
      rect(x, y, wd, ht);
      rect(x, height/5, wd, ht);
      rect(x, 2*(height/5), wd, ht);
      rect(x, 3*(height/5), wd, ht);
      rect(x, 4*(height/5), wd, ht);
      rect(x, height, wd, ht);
      x+=width/5;
    }
  }
}

