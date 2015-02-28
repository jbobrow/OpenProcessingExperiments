
int maxcolour=255;

void setup() {
  size(800, 600);
  fill(0);
}

void draw() {
  if (mousePressed) {
    fill (random(maxcolour),random(maxcolour),random(maxcolour));
  } else {
    fill (random(maxcolour),random(maxcolour),random(maxcolour));
  }
  ellipse(-pmouseX+800, -pmouseY+600, 100, 100);
  noStroke();
}

