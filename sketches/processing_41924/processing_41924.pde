
int x = 0;
int y = 0;

void setup() {
  size(400, 400);
  smooth();
  background(251, 255, 59);
}

void draw() {
  smooth();

fill(5, 204, 237);

  if (mousePressed) {
    stroke(251, 255, 59);
    ellipse(mouseX, mouseY, 20, 20);
  }
}

                
                
