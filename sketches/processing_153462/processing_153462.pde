
// just for fun / circles interactive

void setup() {
  size(440,440);
  ellipseMode(CENTER);
  smooth();
  noStroke();
}


void draw() {
  background(255);
  PVector mouse = new PVector(mouseX, mouseY);
  for(int x = width / 20; x < width; x += width / 10) {
    for(int y = height / 20; y < height; y += height / 10) {
      float val = PVector.dist(new PVector(x,y), mouse);
      val = max(10.0, 100.0 - val);
      float size = 10.0 + val / 10.0;
      fill(0,val);
      ellipse(x, y, size, size);
    }
  }
}
