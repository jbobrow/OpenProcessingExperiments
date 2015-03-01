
float x = 0;
float y = 0;
float easing = 0.05; // Numbers 0.0 to 1.0

void setup() {
  size(500, 500);
  smooth();
  noStroke();
  noCursor();
}

void draw() {
  background(0);
  float targetX = mouseX;
  float targetY = mouseY;
  float dx = targetX - x;
  float dy = targetY-y;
  x += (targetX - x) * easing;
  y += (targetY - y) * easing;

  if (abs(dx) > 1.0)  {
    x += dx * easing;
  }

  if (abs(dy) > 1.0)  {
    y += dy * easing;
  }

  fill(120,250,250,100);
  ellipse(mouseX, mouseY, 50, 50);
  fill(255,255,75,80);
  quad(x, y,0,60,0,0,60,0);
}


