
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: Hong Jiyae
// ID: 201420117


void setup() {
  size (1024, 768);
  smooth();
  noLoop();
}

void draw() {
  background(255);
  strokeWeight(random(8));
  for (int i = 0; i < width; i = i + 80) {
    for (int j = 0; j < height; j = j +80) {
      noFill();
      stroke(247, 192, 214);
      ellipse(i, j, 30, 30);
      stroke(223, 146, 177);
      ellipse(i+20, j, 30, 30);
      stroke(177, 112, 176);
      ellipse(i+113, j+20, 30, 30);
      stroke(163, 214, 190);
      ellipse(i+20, j+120, 30, 30);
      stroke(230, 219, 125);
      ellipse(i, j+120, 30, 30);
      stroke(191, 187, 188);
      ellipse(i-13, j+20, 30, 30);
      stroke(255);
      fill(231,15,109,200);
      ellipse(i+130,j+140,8,8);
    }
  }
}

void keyPressed() {
  background(0);
  redraw();
} 

