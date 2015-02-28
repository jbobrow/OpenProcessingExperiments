
int angle = 0;

void setup() {
  size(300, 500);
  background(150,200,200);
  smooth();
  noStroke();
  
  fill(0, 102);
}


void draw() {
  // Draw only when mouse is pressed
  if (mousePressed == true) {
    angle += 10;
    float val = cos(radians(angle)) * 20.5;
    for (int a = 0; a < 360; a += 75) {
      float xoff = cos(radians(a)) * val;
      float yoff = sin(radians(a)) * val;
      fill(227,15,150);
      ellipse(mouseX + xoff, mouseY + yoff, val, val);
    }
    fill(227,203,16);
    ellipse(mouseX, mouseY, 4, 4);
  }
}


