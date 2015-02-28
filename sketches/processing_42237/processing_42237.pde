
void setup() {
  size(400, 400);
  background(220);
  smooth();
}

void draw() {
  if (mousePressed) {
    stroke(mouseX, second(), 255);
    strokeWeight(5);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
  
  println(second());
  
}


