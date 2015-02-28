
void setup () {
  background(0);
  size (400, 400); 
  strokeWeight(3); 
  stroke(255);
}
void draw() {
  if (mousePressed == true) 
    line (pmouseX, pmouseY, mouseX, mouseY); 
}
