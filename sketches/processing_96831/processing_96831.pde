
void setup() {
  size(400, 400);
  noSmooth();
  fill(500);
  background(500);
}

void draw() {
  if (mousePressed) {
    stroke(0);
  } else {
    stroke(255);
  }
  ellipse(mouseX-0, mouseY, mouseX+15, mouseY); 
}



