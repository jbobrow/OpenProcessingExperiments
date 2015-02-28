
void setup () {
  size(1280, 720);
  colorMode(HSB, 255);
  background(#FFFFFF);
}

void draw () {
  if (mousePressed) {
    background(#FFFFFF);
    stroke(50);
  }
  else {
    stroke (255);
  }
  variableEllipse(mouseX, mouseY, pmouseX, pmouseY);
  fill(mouseY, height, height);
}

void variableEllipse (int x, int y, int px, int py) {
   float speed = abs(x-px) + abs(y-py);
   stroke(speed);
   ellipse(x, y, speed, speed);
}
