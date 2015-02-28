
void setup() {
  size(500, 500);
  background(0);
  smooth();
  strokeWeight(5);
  stroke(255, 0, 0);
  for(int i = 1; i <= 4; i++) {
    for(int j = 1; j <= 4; j++) {
      drawTarget(i*100, j*100);
    }
  }
}

void drawTarget(int x, int y) {
  fill(255);
  for(int i = 0; i < 5; i++) {
    ellipse(x, y, 80-(i*20), 80-(i*20));
  } 
}

