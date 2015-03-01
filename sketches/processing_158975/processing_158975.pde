
void setup() {
  size(800, 300);
  background(0);
}

void draw() {
  if(mousePressed) {
    stroke(255,0,255);
    fill(0);
    ellipse(mouseX, mouseY, 35, 35);
} else {
    stroke(0,153,153);
    fill(0);
    ellipse(mouseX, mouseY, 35, 35);
}
}



