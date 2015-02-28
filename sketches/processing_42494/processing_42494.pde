
void setup() {
  size(1200, 700);
  background(0);
  smooth();
  noStroke();
}



void draw() {

  



 





  // draw
 stroke(255);
  cursor(HAND);
  strokeWeight(15);
  
  if (mousePressed && mouseButton==LEFT ) {
    line(mouseX, mouseY, mouseX+35, mouseY-35);
  }
}

 









