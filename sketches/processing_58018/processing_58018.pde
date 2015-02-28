
void setup() {
  size(300,300);
  background(0);
 }

void draw() {
  
stroke(149,mouseY,mouseX);
  strokeWeight (2);
  fill(0,0,0,0);
  rect(0,0, mouseX, mouseY);
}

