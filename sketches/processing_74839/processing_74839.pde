
void setup() {
  size(400, 200);
  background(255);
}

void draw() {
  if (mousePressed) {
    background(255);
    for (int y = 0; y <= height; y = y + 40) {
      for (int x = 0; x <= width; x = x + 40) {
        if (y == 40) {
          stroke(255, 0, 0);
          }
        else {
          stroke(0);
        }
        line(x, y, mouseX, mouseY);
      }
    }
  }
  else {
    background(255);
    for (int y = 0; y <= height; y = y + 40) {
      for (int x = 0; x <= width; x = x + 40) { 
        if (y == 40) {
          noStroke();
          fill(255, 0, 0);
        }
        else { 
          fill(0);
        }
        ellipse(x, y, 5, 5);
      }
    }
  }
}
