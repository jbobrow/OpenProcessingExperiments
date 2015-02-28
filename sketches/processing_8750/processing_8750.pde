
/**
 * Click. 
 * 
 * Move the mouse to position the shape. 
 * Press the mouse button to invert the color. 
 */
// modified by schien@mail.ncku.edu.tw to demo mouse functions

void setup() {
  size(200, 200);
  //fill(126);
  noFill();
  background(102);
  rectMode(CENTER);
}

void draw() {
  line(mouseX-66, mouseY, mouseX+66, mouseY);
  line(mouseX, mouseY-66, mouseX, mouseY+66); 
}

void mouseReleased() {
  stroke(0);
}
void mousePressed() {
  stroke(255);
}
void mouseDragged() {
  rect(mouseX, mouseY, 66, 66);
}



