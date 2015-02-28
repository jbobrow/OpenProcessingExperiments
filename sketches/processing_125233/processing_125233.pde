
void setup() {
  size(600, 600);
}

void draw() {
  // background(0);
  fill(0, mouseX, mouseY);
  
  //symétrie avec quatre rectangles
  rect(mouseX, mouseY, 25, 25);

  rect(width-mouseX, mouseY, 25, 25);

  rect(mouseX, height-mouseY, 25, 25);

  rect(width-mouseX, height-mouseY, 25, 25);

  println(mouseX);
}

