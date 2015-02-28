
int x = 0;
int y = 0;

void setup() {
  size(500, 500);
  background(255);
  smooth();
}
void rectangles(int xPos, int yPos) {
  noStroke();
  fill(random(0, 255), mouseY, mouseX);
  ellipse (mouseX, mouseY, 50, 50);
}
void draw() {
  if (mousePressed) {
    for (x = 0; x <= 500; x += 200) {
      for (y = 0; y <= 500; y += 200) {
        rectangles(0, 0);
      }
    }
  }
  if (keyPressed){
    background(255);
  }
}




