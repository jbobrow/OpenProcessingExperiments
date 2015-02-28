
void setup() {
  size(400, 400);
}

void draw() {
  for(int i = 0; i < 50; i += 2) {
    point(mouseX + i, mouseY + i);
  }
}
