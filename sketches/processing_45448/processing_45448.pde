
void setup() {
  size(780, 780);
  background(192, 64, 0);
  smooth();
}

void draw() {
  if (mousePressed) {
    fill(125);
    
  } else {
    fill(340);
  }

line(mouseX, mouseY, 0, 0);
stroke(255);
}


