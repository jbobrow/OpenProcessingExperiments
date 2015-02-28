
 // Konkuk University
 // Department of Dynamic Media
 // SOS iDesign
 // Name: Hyeri Joeng
 // ID: 201420107

void setup() {
  size(600, 600);
  background(255);
  smooth();
}

void draw() {
  for (int a = 20; a< width; a = a+40) {
    for (int b = 20; b< width; b = b+40) {
      strokeWeight(2);
      stroke(0);
      noFill();
      rect(20,20,a,b);
      fill(0);
      rect(a,b,20,20);
    }
  }
}
