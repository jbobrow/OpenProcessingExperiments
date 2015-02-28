
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: Your Hyeri Kim
// ID: Your 201420075 Hyeri Kim





void setup() {
  size(600, 600);
  background(255);
  smooth();
}


void draw() {
  for (int a =20; a<width; a = a+20) {
   for (int b =20; b<width; b = b+20) {
      noFill();
      rect(a, b, 25, 25);
      rect(a, b, 10, 10);
      stroke(0);
      strokeWeight(3);


    }
  }
}

