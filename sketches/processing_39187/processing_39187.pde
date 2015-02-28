
//Iv Shqevi
// Lecture5.1

void setup () {
  size (400, 400);
  smooth ();
  background (255);
}
//determaning the spaces 
void draw() {
  for (int x=30; x<height; x+=44) {
    for (int y=10; y<width; y+=50) {
      float B = random(4);// creating a pattern
      if (B>1) {
        B (x, y, random (70, 90)); // for the circle and the rectangle
      }
      else {
        C (x, y); // for the second rectangle 
      }
    }
  }
  noLoop();
}
void B (float x, float y, float w) {
  pushMatrix ();
  translate (x, y);
  ellipseMode (CORNERS);
  fill (0);
  ellipse (-10, 12, 10, 6);
  rect (-20, 24, 6, 10);
  popMatrix();
}

void C (float x, float y) {
  pushMatrix ();
  translate (x, y);
  noStroke ();
  fill (0);
  rect (-20, 12, 6, 24);
  popMatrix ();
}


