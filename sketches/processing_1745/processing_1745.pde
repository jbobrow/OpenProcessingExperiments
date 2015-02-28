
float a = 0;
float b = 0;

void setup() {
  size(600, 600);
  smooth();
  background(255);
}

void draw() {
  noFill();
  strokeWeight(2);
  stroke(mouseX, mouseY, 255);
  ellipse(width/2, height/2, a, b);
  filter(BLUR, 0.6);
  ellipse(width/2, height/2, b, a);
  a += 10;
  b += 20;
  if (b > height) {
    filter(BLUR, 0.6);
    b = -a;
  }
  if (a > width) {
    filter(INVERT);
    a = -b;
  }
}

