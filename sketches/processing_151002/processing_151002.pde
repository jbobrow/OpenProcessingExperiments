
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: kim sun min
// ID: 201420066

float angle;

void setup() {
 // setupAudio();
  size (600, 600);
  smooth();
}
float r = random(-5, 5);
float cX = 5;

void draw() {
  background(0);
  noStroke();
  angle += 0.001;
//  getVolume();
 // float X = map(volume, 0, 200, 30, 150);
// float Y = map(volume, 0, 200, 30, 150);

  for (int i = 0; i <= height; i = i +50) {
    for (int j = 0; j <= width; j = j +50) {
      fill(random(255), random(255), random(255), 100);
      ellipse (i, j, X, Y);
    }
  }  

  cX = cX + 0.5;
  if (cX == 100) {
    cX = 0;
  }
}
