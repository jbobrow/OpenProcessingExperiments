
// konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name : LEE HeaRin
// ID: 201420102

void setup() {
  size(1024, 768);
  background(255);
  smooth();
  noLoop();
}
void draw() {
  for ( int i=10; i<width; i+=100) {
    for ( int j=10; j<height; j+=120) {
      noStroke();
      fill(random(255), random(90), random(255), 90);
      rect(j+80, i+30, 30, 10);
      rect(i+80, j-30, 10, 30);
      rect(j-80, i+30, 10, 30);
      rect(i+80, j-30, 30, 10);
      rect(i+120, j-40, 10, 30);
    }
  }
}
