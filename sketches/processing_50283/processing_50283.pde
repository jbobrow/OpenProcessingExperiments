
void setup() {
  size(500, 500);
  smooth();
}

void draw() {
  if (mousePressed) {
    fill(0,255,0);
    line(mouseX, mouseY, 100, 100);
  } 
  else {
    fill(0,255,0);
    line(mouseX, mouseY, 80, 80);
    ellipse(mouseX, mouseY, 100,100);
  }
}


