
// Homework 4, 01-24-13
// Xinran Lu, xinranl@andrew.cmu.edu
// Copyright Xinran Lu January 2013 Pittsburgh PA 15232

int r = 100; //radius
int n = 3; //number of handles
float x, y; //position of flower
float a, b, c, g; //colors

void setup() {
  size(400, 400);
  smooth();
  x = width/2;
  y = height/2;
  a = 255;
  b = 255;
  c = 255; 
  g = 0;
}

void draw() {
  
  background(g);
  stroke(a, b, c);
  fill(a, b, c);
  strokeWeight(3);
  beginShape();
  for (int i = 0; i < n; i++) {
    vertex(x, y);
    vertex(x+sin(TWO_PI/n*i)*r, y+cos(TWO_PI/n*i)*r);
    ellipse(x+sin(TWO_PI/n*i)*r, y+cos(TWO_PI/n*i)*r, 20, 20);
  }
  endShape();  
}

void keyPressed() {
  if (key == ' ') {
    a = random (100, 200);
    b = random (100, 200);
    c = random (100, 200);
    g = random (0, 150);
  }
  
  if (key == CODED) {
    if (keyCode == UP) n++;
    if (keyCode == DOWN && n > 3) n--;
  }
}

void mouseDragged () {
 if(abs(mouseX - x) < 20 && abs(mouseY-y) < 20)
 {
 x = mouseX;
 y = mouseY;
 }
 
}
