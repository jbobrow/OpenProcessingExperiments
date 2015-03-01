
    int x = 0;

void setup() {
  size(600, 400);
  background(0, 0, 255);
}

void draw() {
  if (mousePressed == true && mouseButton == LEFT ) {
    fill(0, 255 0);
    rect(x, 100, 20, 20);
    x = x + 40;
    mousePressed = false;
  }
  
  if (mousePressed == true && mouseButton == RIGHT {
  fill (0, 255, 0);
  rect(x, 100, 20, 20);
  x = x + 40
  mousePressed = false;
  
}

