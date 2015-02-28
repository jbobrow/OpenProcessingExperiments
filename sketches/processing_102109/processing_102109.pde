
void setup() {
  size(640,680);
  background(255);
}

void draw() {
}

void mouseDragged() {
  float speed = dist(mouseX, mouseY, pmouseX, pmouseY);
  int width = int(constrain(speed, 1, 20));
  strokeWeight(width);
  line(mouseX, mouseY, pmouseX, pmouseY);
}

void mousePressed() {
  if (mouseButton == RIGHT) {
    // Right click to clear
    background(255);
  } else if (mouseEvent.getClickCount() == 2) {
    // Double click to change color
    float r = random(50);
    stroke(r*5);
  }
}
