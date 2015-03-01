
void setup (){
  size (400, 800);
  smooth ();
}

void draw() {
  frameRate (30);
  for (float i=0; i<400; i++) {
    drawX (400-i*0.5, (300-i)*3, i/3, i*0.8, i+30, 30);
  }
}

void drawX (float r, float g, float b, float x, float y, float v) {
  noStroke ();
  fill (r/2, g/2, b*1.2, 3);
  float X=random (x);
  float Y=random (y);
  ellipse (X, Y, r/3, r/3);
  ellipse (X*2, Y*2, r, r/2);
  ellipse (X*3, Y*0.3, r/2, r/2);
}





