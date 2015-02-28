
void setup() {
  size(800, 800);
  background(153);
  smooth();
}

 void draw() {
  noFill();
  strokeWeight(0.5);
  stroke(mouseX/2, mouseY/2, 0);
    bezier(400, 400, mouseX, mouseY, 40, 40, mouseY, 800);
    bezier(400, 0,mouseX, 400, mouseY, mouseX, 400, 800);
    
}

