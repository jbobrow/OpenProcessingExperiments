
void setup() {
  size(600, 600);
}

void draw() {
  background(150);
  if(mousePressed) {
  ellipse(mouseX, mouseY, 150, 50); // makes elipse follow mouse
} else {
  ellipse(mouseX, mouseY, 50, 50);
}
}
  

