
void setup() {
  size(400, 400);
  smooth();
}
void draw() {
  background(255);
  for (int y=0; y<height; y=y+10) {
      for (int x=0; x<width; x=x+10) {
        ellipse(x, y, 5, 5);
      }
    }
  if (keyPressed &&key == 'z') {
    background(255);
    for (int y=0; y<height; y=y+10) {
      for (int x=0; x<width; x=x+10) {
        ellipse(x, y, 5, y);
      }
    }
  }
}


