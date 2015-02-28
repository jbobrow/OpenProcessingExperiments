
void setup () {
  size (800,450);
  noStroke ();
  smooth ();
  noLoop ();
  background (255);
}
 
void draw () {
  background (255);
  drawCircle (width/2,height/2,mouseX,7);
}
 
void drawCircle (float x, float y, float radius, int num) {
  float r = random (255);
  float b = random (255);
  fill (r,b,b);
  ellipse (x, y, radius, radius);
  if (num > 1) {
    num = num - 1;
    for (int i = 0; i < 4; i++) {
      float a = random (0, TWO_PI);
      float newx = x + cos(a) * 100.0*i;
      float newy = y + sin(a) * 100.0*i;
      drawCircle (newx, newy, radius/2, num);
    }
  }
}
 
void mousePressed () {
  redraw ();
}

