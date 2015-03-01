
void setup() {
  size(800, 600);
}

void draw() {
  background(0);
  for (float i=0; i<height; i+=5.3) {
    stroke(87, 215, 240);

strokeWeight(.4);
    line(mouseX, mouseY, 0, i);
    line(mouseX, mouseY, width, i);
  }
  for (float i=0; i<width; i+=5.3) {
    line(mouseX, mouseY, i, 0);
    line(mouseX, mouseY, i, height);
  }
}

