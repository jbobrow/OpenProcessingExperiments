
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: CHOI Jihye
// ID: 201420116


float x;
float y;

void setup() {
  size(600, 600);
  background(255);
  smooth();

  noLoop();
}

void draw () {

  for (int y = 0; y <=height; y +=50) {
    for (int x = 0;x <=width; x +=50) {
      noStroke();
      //fill(random(255), random(50), random(250));
      fill(random(255), random(255), 255, 200);
      ellipse(x, y, 40, 40);
    }
  }
}

