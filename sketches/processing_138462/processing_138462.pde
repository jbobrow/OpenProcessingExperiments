
/**
Yingying Yang
Creative Computing Section B
Wk 4 Assignment - Motion
Base code from Getting Started with Processing by Casey Reas & Ben Fry
*/

float angle = 0.0;
float offset = 250;
float scalar = 2;
float speed = 0.05;
float x;
float y;
int bcolor;
int bsize = 10;

void setup() {
size(500, 500);
smooth();
frameRate(200);
background(255);
}

void draw() {
  if (mousePressed) {
    fill(random(0,255),map(mouseX,0,width,0,255),map(mouseY,0,height,0,255));
    noStroke();
    x = offset + cos(angle) * scalar;
    y = offset + sin(angle) * scalar;
    ellipse(x, y, bsize, bsize);
    angle += speed;
    scalar += speed;
  }
}

void mousePressed() {
  if (mousePressed) {
    bsize = round(random(10,50));
  }
}

void keyPressed() {
  background(255);
  scalar = -2;
  }




