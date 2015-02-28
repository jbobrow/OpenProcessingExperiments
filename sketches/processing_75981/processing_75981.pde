
int r = 2;


void setup() {
  size(400, 400);
  background(250, 120);
}

void draw() {


  for (int x=10; x< width; x = x+20) {
    for (int y=10; y<height; y = y+20) {
      stroke(random(r));
      fill(255, 30);
      ellipse(x, y, 40, 40);
    }
  }

  r = mouseY;
}
