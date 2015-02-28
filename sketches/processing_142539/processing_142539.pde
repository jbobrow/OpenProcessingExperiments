
// SOS iDesign
// KU DYNAMIC MEDIA
// David Mrugala

void setup() {
  size(600, 400);
  noLoop(); // important, otherwise Processing continues to draw continously
  background(32,50,74);
}

void draw() {
  stroke(170,205,211);
  // grid with random strokeWeight applied on points
  for (int i = 10; i < width-9; i = i + 10) {
    for (int j = 10; j < height; j = j + 10) {
      strokeWeight(random(10));
      point(i, j);
    }
  }
}

void keyPressed() {
  background(32,50,74); 
  redraw();
}

