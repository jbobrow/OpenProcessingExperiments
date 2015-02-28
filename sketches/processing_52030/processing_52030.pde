
void setup() {
  size(500, 500);
  smooth();
}

void draw() {
  background(0);
  strokeWeight(2);
  for (int x=10;x<500;x=x+20) {
    for (int y=10;y<500;y=y+20) {
      ellipse(x, y, 20, 20);
    }
  }
}        
