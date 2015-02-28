
void setup() {
  size(500, 500);
  background(0);
  smooth();
}
 void draw() {
  if (mousePressed) {
    
    stroke(mouseX, second(), 30);
    strokeWeight(10);
    strokeJoin(ROUND);
    rect(mouseX, mouseY, pmouseX, pmouseY);
  }
    println(second());
   
}
