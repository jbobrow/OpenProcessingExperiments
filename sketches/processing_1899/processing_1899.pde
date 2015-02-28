
int x, y;

void setup() {
  size(255, 255);
  noStroke();
  frameRate(60);
}

void draw() {
  background(random(0, 64));
  for(int i = 0; i < y / 2; i++) {
    fill(x);
    triangle(
    random(width), random(height), 
    random(width), random(height), 
    random(width), random(height));
  }
}

void mouseDragged() {
  x = mouseX;
  y = mouseY;
}

void mousePressed() {
  x = mouseX;
  y = mouseY;
}

