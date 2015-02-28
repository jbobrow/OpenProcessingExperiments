
void setup() {
  size(800, 600); 
  smooth();
  background(0);
}

void draw() {
  if (mousePressed) {
    fill(0);
  } else {
    fill(255);
  }

ellipse(mouseX, mouseY, 80, 80);
  
}

