
void setup() {
  size(400, 400);
  smooth();
  background(50);
}

void draw() { //sets up grid for circles
  for (int m = 0; m < width; m += 30) {
    for (int b = 0; b < width; b += 30) {
      circles (m, b);
    }
  }
  for (int y = 7; y < width; y += 30) {
    for (int x = 7; x < width; x += 30) {
      rectangles (x, y);
    }
  }
  noLoop();
}

void rectangles(float x, float y) {
  pushMatrix();
  translate (0, 0);
  stroke(random(255));
  strokeWeight(random(3));
  rect(x, y, 15, 15); 
  popMatrix();
}

void circles(float x, float y) {
  pushMatrix();
  translate (0, 0);
  stroke(random(255));
  strokeWeight(random(3));
  noFill();
  ellipse(x, y, 15, 15); 
  popMatrix();
}


