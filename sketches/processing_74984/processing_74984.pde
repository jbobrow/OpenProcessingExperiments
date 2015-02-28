

void setup() {
  size (400, 400);
}

void draw() {


  background (0);
  for (int y = 0; y <= height; y= y + 40) {
    for (int x=0; x <= width; x=x +40) {
      noStroke();
      fill (255);
      rect (x, y, mouseX+ (-mouseY), mouseY +(-mouseX));
    }
  }
}

