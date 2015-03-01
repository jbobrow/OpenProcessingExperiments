
float squareSize = 40;
float offset = squareSize / 3;
int n = 14;
float r = 0;
float inc = TWO_PI / 360;

void setup() {
  size(500, 500);
  smooth(8);
  frameRate(10);
  noFill();
  strokeWeight(squareSize / 16); 
}

void draw() {
  background(0);
  rotate(r);
  
  for (int i = -n; i < n; i++) {
    for (int j = -n; j < n; j++) {
      float x = (squareSize + offset) * i + offset / 2;
      float y = (squareSize + offset) * j + offset / 2;

      stroke(255, 230, 80);
      rect(x, y, squareSize, squareSize);
      stroke(200, 0, 100);
      rect(x + offset * 2, y + offset * 2, squareSize, squareSize);
    }
  }
  
  r += inc;
}
