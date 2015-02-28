
void setup () {
  size (1000,1000);
  noStroke ();
  smooth ();
  noLoop ();
  background (255);
}
 
void draw () {
  if (!mousePressed) return;
  background (255);
  drawRect (width/2,height/2,mouseX,7);
}
 
void drawRect (float x, float y, float radius, int num) {
  float r = random (255);
  float b = random (255);
  fill (r,b,b);
  rect (x, y, mouseX, mouseY);
  if (num > 1) {
    num = num - 1;
    for (int i = 0; i < 4; i++) {
      float a = random (0, TWO_PI);
      float newx = x + cos(a) * 100.0*i;
      float newy = y + sin(a) * 100.0*i;
      drawRect (newx, newy, radius/2, num);
    }
  }
}
 
void mousePressed () {
  redraw ();
}


