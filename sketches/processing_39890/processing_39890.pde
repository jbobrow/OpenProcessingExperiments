
void setup() {
  size(485, 485);
}

void draw() {
  background(0);
  for (int y=0;y<height;y=y+35) {
    for (int x=0;x<width;x=x+35) {

      stroke(mouseX);
      fill(x, 31, random(160));
      rect(x, y, 30, 30);
    }
  }
}

