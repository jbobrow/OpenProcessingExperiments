
import processing.video.*;

//project 1
//Sharon Rubin
//srrubin@andrew.cmu.edu
//copyright © Sharon Rubin December 2012 Pittsburgh PA 15213 All Rights Reserved

/////*Playing with Shiffman's recursive branch*/////

float theta;
int x;
int y;
Capture video;

void setup() {
  size(800, 800);
  smooth();
  background(0);
  x = 0;
  y = 0;
  video = new Capture(this, width, height, 15);
}

void draw() {
  if (video.available()) {
    video.read();
  }
  video.loadPixels();
  
  pushMatrix();
  noStroke();
  fill(30, 30, 30, 90);
  rect(0, 0, width, height);
  popMatrix();
  stroke(255);
  drawTree();
  drawTree2();
  drawTree3();
  drawTree4();
  drawCenter();
}
  
  
void drawTree() {
  
  pushMatrix();
  float a = (mouseX / (float) width) * 90f;
  theta = radians(a+(frameCount));
  translate(0,0);
  rotate(radians(135));
  color c = video.pixels[(width/2) + height/2*video.width];
  stroke(c);
  line(x,y,0,-300);
  translate(0,-300);
  branch(170);
  popMatrix();
}


void drawTree2() {
  pushMatrix();
  float a = (mouseX / (float) width) * 90f;
  theta = radians(a+frameCount);
  translate(width,0);
  rotate(radians(225));
  line(x,y,0,-300);
  translate(0,-300);
  branch(170);
  popMatrix();
}

void drawTree3() {
  pushMatrix();
  float a = (mouseX / (float) width) * 90f;
  theta = radians(a+frameCount);
  translate(0,height);
  rotate(radians(45));
  line(x,y,0,-300);
  translate(0,-300);
  branch(170);
  popMatrix();
}

void drawTree4() {
  pushMatrix();
  float a = (mouseX / (float) width) * 90f;
  theta = radians(a+frameCount);
  translate(width,height);
  rotate(radians(-45));
  line(x, y, 0, -300);
  translate(0,-300);
  branch(170);
  popMatrix();
}

void branch(float h) {
  h *= 0.61803398875;
  if (h > 2) {
    pushMatrix();
    rotate(theta);
    line(x, y, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
    
    pushMatrix();
    rotate(-theta);
    line(x, y, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
  }
}

void centerBranch(float h) {
  h *= 0.61803398875;
  if (h > 2) {
    pushMatrix();
    theta += 35;
    rotate(theta);
    line(x, y, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
    
    pushMatrix();
    rotate(-theta);
    line(x, y, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
    
    
    pushMatrix();
    rotate(-theta+radians(90));
    line(x, y, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
    
    pushMatrix();
    rotate(-theta-radians(90));
    line(x, y, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
    
    pushMatrix();
    rotate(theta+radians(90));
    line(x, y, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
    
    pushMatrix();
    rotate(theta-radians(90));
    line(x, y, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
    
    pushMatrix();
    rotate(theta-radians(180));
    line(x, y, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
    
    pushMatrix();
    rotate(theta+radians(180));
    line(x, y, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
    
    pushMatrix();
    rotate(-theta+radians(180));
    line(x, y, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
    
    pushMatrix();
    rotate(-theta-radians(180));
    line(x, y, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
  }
}


void drawCenter() {
  pushMatrix();
  translate(width/2, height/2);
  centerBranch(30);
  popMatrix();
  
}

