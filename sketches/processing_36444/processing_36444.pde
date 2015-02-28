
int value1 = 255;
int value2 = 255;
void setup(){
  size(700,400);
  background(0);
}

void draw(){
  fill(value1, value2, 0);
  noStroke();
  rect(mouseX, mouseY, 50, 50);
  fill(0,50);
  rect(0,0,700,400);
}

void mouseMoved() {
  value1 = value1 + 5;
  value2 = value2 + 5;
  if (value1 > 255) {
    value1 = 0;
    value2 = 0;
  }
}

