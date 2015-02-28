
void setup() {
  size(500, 500);
  background(60, 120, 120);
  smooth();
}
 
void draw() {
  if (mousePressed) {
    strokeWeight(2);
    fill(70, 100, 0);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
   
  println(second());
   
}

