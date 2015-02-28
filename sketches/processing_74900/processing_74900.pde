
PImage nbc;
PImage nbc2;

float a;
float b;
float c;
float f;
float g;


float d;
float x;
float y;
int i = 0;


void setup() {
  size(1000, 700);
  background(0); 
  smooth(); 
  nbc = loadImage("nbc.png");
  nbc2 = loadImage("nbc2.png");
}


void draw() {
  for (int i=0; i<255; i++) { 
    a=random(30-i);
    b=random(20-i);
    c=random(10-i);
    f=random(5-i);
    g=random(5-i);
    d = random(-10, 3);
    x = random(width);
    y = random(height);
    noStroke();
    fill(a, b, c, 150);
    ellipse(x, y, d, d);
    frameRate (2000);
  }
}


void mouseReleased() {
  image(nbc, 0, 0, 1000, 700);
}

void mouseDragged() {
  image(nbc2, 0, 0, 1000, 700);
}


