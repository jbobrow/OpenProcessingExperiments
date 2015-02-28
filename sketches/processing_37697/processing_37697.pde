
void setup () {
  size (500, 500);
  smooth ();
}

void draw () {
  background (0, 206, 255);
  sailboat (150,190);
  wave (-20, 200);
  sailboat (250, 250);
  wave (25, 260);
  wave (10, 320);
  sailboat (400,365);
  wave (-20, 380);
  wave (0, 440);
}

void sailboat (int x, int y) {
  noStroke ();
  fill (240, 128, 229);
  arc (x, y, 100, 90, 0, PI);
  fill (188, 160, 84);
  rect (x-5, y-100, 10, 100);
  if (mouseX >= x) {
    fill (0, 255, 172);
    triangle (x+5, y-100, x+5, y-50, x+50, y-75);
  } else {
    fill (0,255,172);
    triangle (x-5,y-100, x-5,y-50, x-50,y-75);
  }
  fill (255, 255, 255, 150);
  ellipse (x, y+10, 10, 10);
  ellipse (x-20, y+10, 10, 10);
  ellipse (x+20, y+10, 10, 10);
}

void wave (int a, int b) {
  stroke (21, 10, b/2);
  noFill ();
  strokeWeight (6);
  for (int i=1; i<520; i += 50) {
    arc (a+i, b, 50, 50, 0, PI);
  }
}

