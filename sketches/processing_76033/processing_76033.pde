
void setup() {
  
  size(800, 800);
  background(255);
  smooth();
}

void draw() {
  fill(150, 30);
  rect(0, 0, 800, 800);
  
  translate(10, 10);
  fill(0,150, 255);
  if (mousePressed == true) {
  fill(255); }
  ellipse(mouseX, mouseY, 50, 50);
}


