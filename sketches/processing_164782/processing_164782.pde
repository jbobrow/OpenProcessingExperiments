
void setup() {
  size(400,400);
}

void draw() {
  background(204, 100, 100);
  if (mouseX > 150) {
    cursor(HAND);
  } else {
    cursor(ARROW);
    
  }
  line(mouseX, 0, mouseX, height);
  line(0, mouseY, height, mouseY);
}



