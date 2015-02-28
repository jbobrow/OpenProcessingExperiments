
void setup() {
  size(300, 300);
}

void draw() {
  background(255);
  if (mouseX < width/2 && mouseY < height/2) {
    fill(98, 135, 232);
    rect(0, 0, 150, 150);
  } else if (mouseX > width/2 && mouseY > height/2) {
    fill(232, 98, 123);
    rect(150, 150, 300, 300);
  } else if (mouseX > width/2 && mouseY < height/2) {
    fill(57, 55, 209);
    rect(150, 0, 150, 150);
  } else if (mouseX < width/2 && mouseY > height/2) {
    fill(196, 32, 119);
    rect(0, 150, 150, 150);
  }
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);
}

