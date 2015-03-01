
void setup() {
  size(1000, 800);
}
void draw() {
  monster();
}
void monster() {
  background(255);
  rectMode(CENTER);
  fill(0);
  rect(mouseX, mouseY, 500, 300);
  fill(255);
  ellipse(mouseX+90, mouseY-50, 50, 50);
  ellipse(mouseX-90, mouseY-50, 50, 50);
}

