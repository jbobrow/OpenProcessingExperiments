
int x;
int y;
void setup() {
  size(480, 420);
  background(160, 64, 0);
  x = 170;
  y = 350;
}

void draw() {
  if (mousePressed) {
    x = mouseX;
    y = mouseY;
    fill(0);
    
  } else {
    stroke(60,64,0);
    fill(255);
  }
  line(mouseX, mouseY, x, y);
  ellipse(mouseX, mouseY, 30, 30);
}
