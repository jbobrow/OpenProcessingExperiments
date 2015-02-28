
void setup() {
  size(300, 300);
  textFont(createFont("sans serif", 48));
}

void draw() {
  background(20);

  translate(width/2, height/2);
  for (int i = 0; i < 5; i++) {
    rotate(TWO_PI / 5.0);
    text("Star", mouseX-50, mouseY-50);
  }
}
