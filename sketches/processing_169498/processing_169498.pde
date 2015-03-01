
void setup() {
  size(500, 500);
  background(#FC6703);
}

void draw() {
  if (keyPressed == true) {
    strokeWeight(random(1));
    bezier(mouseX, mouseY, mouseX + random(-500, 500), mouseY + random(-500, 500), mouseX + random(-500, 500), mouseY + random(-500, 500), mouseX, mouseY);
}
  else if (mousePressed == true) {
  background(#FC6703);
}
  else {
    noStroke();
    fill(#1D0FF2);
    strokeWeight(1);
    bezier(mouseX, mouseY, mouseX + random(-50, 50), mouseY + random(-50, 50), mouseX + random(-50, 50), mouseY + random(-50, 50), mouseX, mouseY);
  }
}


