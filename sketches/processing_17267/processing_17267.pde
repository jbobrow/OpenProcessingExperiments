
int r = 100;
int c = 255;

void setup() {
  size(255, 255);
  smooth();
}

void draw() {
  background(255);
  fill(c);
  noStroke();
  ellipse(width/2, height/2, r, r);
}

void mouseMoved() {
    c = mouseY;
    c= -mouseY;
}

void mouseDragged() {
  r = mouseX;
  
}

