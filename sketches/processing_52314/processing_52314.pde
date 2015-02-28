
int w;
int h;
int r;
int g;
int b;
int t;

void setup() {
  
  size(750, 750);
  smooth();
  strokeWeight(5);
  background(255);
  noStroke();
  fill(0);
  frameRate(60);
}

void draw() {
  
  w = abs(mouseX - pmouseX);
  h = abs(mouseY - pmouseY);
  r = (int)random(64);
  g = (int)random(128, 255);
  b = (int)random(196);
  t = (int)random(64);
  
  
  if (keyPressed)
  {
    background(255);
  }
  if (mousePressed)
  {
    fill(r, g, b, t);
    ellipse(mouseX, mouseY, w, w);
    ellipse(width-mouseX, mouseY, w, w);
  }
}

