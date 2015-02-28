
//Homework 5
//Sabrina Li
//Copyright Sabrina Li January 2014 Pittsburgh, PA

float wd, ht;

void setup() {
  size(400, 400);
  background(0, 0, 0);
  smooth();
  
  wd = width/8;
  ht = width/8;
  
  noStroke();
  fill(255, 255, 255, 80);
}

void draw() {
  frameRate(10);
  fill(255, 255, 255, 80);
  figure(mouseX, mouseY);
}

void mousePressed() {
  fill(0, 255, random(255));
  figure(mouseX, mouseY);  
}

/*void keyPressed() {
  saveFrame("hw5-####.jpg");
}*/

void figure(float fx, float fy) {
  triangle(fx, fy, fx-.5*wd, fy+ht, fx+.5*wd, fy+ht);
  triangle(fx-.5*wd, fy+ht, fx-wd, fy+2*ht, fx, fy+2*ht);
  triangle(fx+.5*wd, fy+ht, fx, fy+2*ht, fx+wd, fy+2*ht);
}


