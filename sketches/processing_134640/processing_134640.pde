
float x;
float y;
float easing = 0.01;
float diameter = 12;

void setup() {
  size (800, 800);
}

void draw () {
  float targetX = mouseX;
  float targetY = mouseY;

  int randomz = round(random(0, 255));

  x += (targetX - x) * easing;
  y -= (targetY + y) * easing;

  fill (randomz, randomz);
  ellipse (mouseX, mouseY, x, y);

  fill (randomz, randomz);
  rect (mouseX-mouseY, mouseY-mouseX, pmouseX, pmouseY);
}



