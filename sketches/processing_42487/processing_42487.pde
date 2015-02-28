
void setup() {
  size(500, 500);
  background(10, 100, 100);
  smooth();
}
 
void draw() {
  if (mousePressed) {
    stroke(mouseX, second(), 45);
    strokeWeight(1);
    fill(10, 80, 100);
    ellipse(mouseX, mouseY, pmouseX, pmouseY);
  }
   
  println(second());
   
}

