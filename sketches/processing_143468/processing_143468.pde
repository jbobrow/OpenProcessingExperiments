
// SOS iDesign
// KU DYNAMIC MEDIA
//Name: KIM chaeyeon
//ID: 201420073


void setup() {
  size(600, 600);
  background(600, 0, 0);
  //  noLoop();
}

void draw() {
  noStroke();
  fill(10); // adds more transparency
  rect(0, 0, width, height);

  // grid filled with ellipses
  for (int i = 75; i < width-25; i = i + 50) {
    for (int j = 75; j < height-25; j = j + 50) {
      stroke(150);
      strokeWeight(25);
      noFill();
      ellipse(i, j, 50, 50);
    }
  }
}



