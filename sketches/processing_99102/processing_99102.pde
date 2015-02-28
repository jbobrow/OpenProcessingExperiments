
void setup() {
  size(600, 600);
}

void draw() {
  if (mousePressed) {
    fill(0,250,0);
    rect(mouseX, mouseY, 80, 80);
  } else {
    fill(255,0,0);
    ellipse(mouseX, mouseY, 80, 80);
  }
  
}
