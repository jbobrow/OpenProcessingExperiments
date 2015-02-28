
float x, y;
boolean bullet;
float bx, by, bAng;

void setup() {
  size(400, 400);
  x = y = 200;
}

void draw() {
  background(204);

  float ang = atan2(mouseY-y, mouseX-x);

  float x2 = cos(ang) *50 + x;
  float y2 = sin(ang) *50 + y;

  strokeWeight(5);
  line(x, y, x2, y2);
  ellipse(x, y, 40, 40);

  if (bullet) {
    fill(100);
    ellipse(bx, by, 10, 10);
    bx += cos(bAng) * 10;
    by += sin(bAng) * 10;

    if (bx < 0 || bx > width) bullet = false;
    if (by < 0 || by > width) bullet = false;
  }
}

void keyPressed() {
  if (key == 'w')
    y = y - 10;
  if (key == 's')
    y = y + 10;
  if (key == 'd')
    x = x + 10;
  if (key == 'a')
    x = x - 10;
}

void mousePressed() {
  if (!bullet) {
    bullet = true;

    bx= x;
    by = y;
    bAng = atan2(mouseY-y, mouseX-x);
  }
}


