
void setup() {
 size(400, 400);
}

void draw() {
  for(int x = 10; x <= width - 10; x += 20) {
    for(int y = 10; y <= height - 10; y +=20) {
      line(x, y, width - 10, height - 10);
      ellipse(x, y, 10, 10);
    }
  }
}
