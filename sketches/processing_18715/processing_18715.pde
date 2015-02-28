
void setup () {
  size (250, 250);
  background (0);
  smooth ();
  frameRate (10);
}
 
void draw () {
  fill (0, 50);
  noStroke ();
  rect (0,250,width,height);
  
  fill (#F93E13, 200);
  for (int i = 0; i <= mouseY; i += 5) {
    rect (0, random (i), width-10, random (i));
  }
  fill (#F9C806, 200);
  for (int i = 0; i <= mouseY; i += 5) {
    rect (50, random (i), width-60, random (i));
  }
  fill (#E4304A, 200);
  for (int i = 0; i <= mouseY; i += 5) {
    rect (70, random (i), width-40, random (i));
  }
  fill (#F77C10, 200);
  for (int i = 0; i <= mouseY; i += 5) {
    rect (150, random (i), width-50, random (i));
  }
}


