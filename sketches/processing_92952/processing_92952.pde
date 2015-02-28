


void setup() {

  size(800, 800);
  background(50);
}

void draw() {

  if (mousePressed==false) {
    drawLightning();
  }
}

void drawLightning() {

  float  x = mouseX;
  float y = mouseY;

  float a = x + random(100);
  float b = y + random(100);

  color c1 = color(random(255), random(255), random(255));
  fill(c1);

  ellipse(a, b, 40, 40);

  x = a;
  y = b;
}

