
PGraphics pg;

void setup () {
  size (400, 400);
  stroke (255);
  pg = createGraphics (100, 100, P2D);
}

float y = 100;

void draw() {
  fill (0, 12);
  rect (200, 200, 50, 50);
  fill (255);
  noStroke();
    ellipse(mouseX, mouseY, 60, 60);

  pg.beginDraw();
  pg.background(0);
  pg.noFill();
  pg.stroke(255);
  pg.ellipse (mouseX-60, mouseY-60, 60, 60);
  pg.endDraw();

  image (pg, 60, 60);

  y = y - 1;
  if (y < 0) {
    y = height;
  }
  line(0, y, width, y);
}


