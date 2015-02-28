
//Simple line drawings, but under logic

void setup() {
  size (500, 500);
  smooth ();
  background (255);
  colorMode (RGB, width);
  //line (100, 0, 100, height);
}


void draw () {
  
  stroke (0, random(100));
  
  strokeWeight (1);  
  for (int A =  7; A < width-19; A += 7) {
    line (A, random (0), A, random (height/5));
  }
  strokeWeight (1.3);
  for (int B =  11; B < width-17; B += 11) {
    line (B, random (height/5), B, random (2*height/5));
  }
  strokeWeight (1.5);
  for (int C = 13; C < width-13; C += 13) {
    line (C, random (2*height/5), C, random (3*height/5));
  }
  strokeWeight (1.7);
  for (int D = 17; D < width-11; D += 17) {
    line (D, random (3*height/5), D, random (4*height/5));
  }
  strokeWeight (2);
  for (int E = 19; E < width-7; E += 19) {
    line (E, random (4*height/5), E, random (height));
  }
  
}



