

// Konkuk University 
// Department of Dynamic Media 
// SOS iDesign 
// Name: Park Seeun
// ID: 201420078 

void setup() {
  size(600, 600);
  background(255);
  noLoop();
}

void draw() {
  background(255);
  stroke(0);
  noFill();

  for (int s = 0; s < width; s = s + 10) {
    for (int j = 0; j < height; j = j +10) {
      strokeWeight(random(1));
      stroke(255);
      fill(random(255), random(150), random(255), 50);
      rect(s, j, 10, 10);
    }
  }
}

