
int lineThickness =4;
 
 
void setup(){
  size (700,700);
  strokeWeight (lineThickness);
  background (300);
}
void draw() {
  if (mousePressed) {
    rectMode(CENTER);
    fill(5,236,24);
    rect (pmouseX, pmouseY, mouseX, mouseY);
    stroke(0);
 
  }
}


