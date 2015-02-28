
int value = 0;

void draw() {
  background(0);
  fill(value);
  for(int x = 10; x < 100; x += 10) {
    for(int y = 10; y < 100; y +=10) {
  ellipse(x, y, 10, 10); }
  }
}
void keyPressed() {
  if (value == 0) {
    value = 255;
  } else {
    value = 0;
  }
}
