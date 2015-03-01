
void setup() {
  size(640, 360); 
  background(255); 
  noStroke(); 
  frameRate(24);
}

void draw () {
  int gridSize = 40;
  changingTriangle();
  for (int x = gridSize; x <= width - gridSize; x += gridSize) {
    for (int y = gridSize; y <= height - gridSize; y += gridSize) {
      changingTriangle();
      stroke(random(200,255),100);
      line(x, y, width/2, height/2);
    }
  }
}

void changingTriangle () {
 int gridSize = 40;
 for (int x = gridSize; x <= width - gridSize; x += gridSize) {
    for (int y = gridSize; y <= height - gridSize; y += gridSize) {
      fill (random (0-100), random (0,100), random (100,255));
      triangle (x, y, x+5, y-10, x+10, y);
}
}
}




