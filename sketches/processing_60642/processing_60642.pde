
int x = 200;
int y = 200;
int w = 100;
int h = 100;

void setup() {
  size(500, 500);
  background(0);
}

void draw() {
  background(0);
  fill(255);

  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    println("Over");
    fill(255, 0, 0);
  }

  rect(x, y, w, h);
} 

void mousePressed() {
  saveFrame("thumbnail.png");
}

