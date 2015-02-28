
float x;
float y;

void setup() {
  size(500, 500);
}

void draw() {
  background(x);
  map(x, 0, 255, 0, height);
  noStroke();
  fill(#988A8B);
  rect(150, 100, 200, 400);
  rect(200, 50, 100, 50);
  rect(237.5, 25, 25, 25);
  x = map(mouseY, 0, height, 255, 0);
  for(float z = 162.5; z < 350; z += 50) {
    for(float c = 112.5; c < 400; c += 50) {
      fill(y);
      map(y, 0, 255, 0, height);
      y = map(mouseY, 0, height, 170, 255);
      rect(z, c, 25, 25);
    }
  }
  strokeWeight(3);
  fill(0);
  rect(225, 450, 50, 50);
}
