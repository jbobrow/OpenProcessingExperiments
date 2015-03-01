
float r;
float g;
float b;
float a;

int minDiam = 10;
int maxDiam = 100;
int diam;
int increment = 5;

void setup() {
  size(800,800);
  background(255);
  diam = minDiam;
  smooth();    
}

void draw() {
  r = random(150);
  g = random(150);
  b = random(150);
  a = random(255);
// set to 150 to avoid really harsh colors
  background(r,g,b,a);
  frameRate(1);
}
 void mouseDragged() {
  frameRate(30);
  r = random(200);
  g = random(200);
  b = random(200);
  a = random(255);
  noStroke();
  fill(r,g,b,a);
  ellipse(mouseX, mouseY, diam, diam);
  diam = diam + increment;
  if (diam > maxDiam || diam < minDiam) {
    increment = -increment;
  }
 }
 void mouseClicked() {
  frameRate(8);
  r = random(150);
  g = random(150);
  b = random(150);
  a = random(255);
  background(r,g,b,a);
}


