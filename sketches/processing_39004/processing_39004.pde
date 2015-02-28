
void setup () {
  size (400, 400);
  smooth ();
  background (0);
  
}
  
void draw() {
    for (int x=16; x<height; x+=30) {
    for (int y=20; y<width; y+=32) {
      float r = random(4);
      if (r>1) {
        myBldg (x, y, random (50, 100));
      }
      else {
        blank (x, y);
      }
    }
    }
    noLoop();
}
        
        
        
        
        
        
 // 
void myBldg (float x, float y, float w) {
  pushMatrix ();
  translate (x, y);
  rectMode (CORNERS);
  fill (100);
  rect (-10, 12, 10, 6);
  rect (-20, 12, 6, 10);
  popMatrix();
}

void blank (float x, float y) {
  pushMatrix ();
  translate (x, y);
  noStroke ();
  fill (0);
  rect (-10, 12, 10, 6);
  popMatrix ();
}  

