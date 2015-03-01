
void setup() {
  size(500, 500);
}

void draw() {
  fill(0, 10);
  stroke(0);
  rect(0, 0, width-1, height-1);
  
  stroke(255);
  for (int i = 0; i <= width; i += 100) {
    line(i, height, mouseX, mouseY);
    line(width, i, mouseX, mouseY);
    line(i, 0, mouseX, mouseY);
    line(0, i, mouseX, mouseY);
  }
}


