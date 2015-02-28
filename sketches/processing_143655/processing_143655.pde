
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: LEE Hea Rin
// ID: LEE Hea Rin


void setup() {
  size(600, 600);
  background(0);
  noLoop();
}

void draw() {
  for (int i=30; i<width; i+=70) {
    for (int j=30; j<height; j+=70) {
      rectMode(CENTER);
      rect(i,j,30,60);  
      fill(random(255), random(190), random(255), 90);
      rect(j,i,60,30);
    }
  }
}  

