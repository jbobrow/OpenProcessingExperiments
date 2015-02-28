
int value = 0;
void setup(){
  size(700,400);
  background(0);
}

void draw(){
  fill(value);
  noStroke();
  rect(mouseX, mouseY, 50, 50);
}

void mouseMoved() {
  value = value + 5;
  if (value > 255) {
    value = 0;
  }
}

