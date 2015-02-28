
void setup () {
  size (500, 500);
  smooth ();
  background (0, 206, 255);
}

void draw () {
  if (mousePressed) {
    sailboat (mouseX, mouseY);
  }
}


void sailboat (int x, int y) {
  noStroke ();
  fill (random (150, 255), 0, 229);
  arc (x, y, 100, 90, 0, PI);
  fill (188, 160, 84);
  rect (x-5, y-100, 10, 100);
  fill (0, 255, random(100, 220));
  triangle (x-5, y-100, x-5, y-50, x-50, y-75);
  fill (255, 255, 255, 150);
  ellipse (x, y+10, 10, 10);
  ellipse (x+20, y+10, 10, 10);
  ellipse (x-20, y+10, 10, 10);
}
         
