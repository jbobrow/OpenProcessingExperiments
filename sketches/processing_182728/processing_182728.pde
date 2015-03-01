
void setup() {
  size(300,300);
}

void draw() {
stroke(200,mouseX, mouseY);
line(0, 0, mouseX, mouseY);
}
