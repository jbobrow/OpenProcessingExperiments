
void setup() {
  size(500, 500);
  background(#FFFABF);
}

void draw() {
  if (mousePressed == true) {
    background(#fffabf);
  } else {
    strokeWeight(random(1));
    stroke(#BFD0FF);
    fill(#BFD0FF);
    bezier(mouseX, mouseY, mouseX + random(50), mouseY + random(50), mouseX + random(50), mouseY + random(50), mouseX, mouseY);
  }
}


