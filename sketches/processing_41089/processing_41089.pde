
int x=10;
int y=10;
float z=30;

void setup() {
  size(400, 400);
  background(255);
  smooth();
}

void draw() {
  if (mousePressed) {
    x += 2;
    y += 2;
    z -= 0.01;
    fill(mouseY, mouseX, z);
    strokeWeight(z);
    ellipse(mouseX, mouseY, x, y);
  }
  else{
    x=10;
    y=10;
    z=30;
  }
}

