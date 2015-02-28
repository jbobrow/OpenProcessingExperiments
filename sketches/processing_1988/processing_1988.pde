
/**
 * Drawing with a circle
 *
 * Click and drag the mouse to draw a line.
 */

 
void setup() {
  size(400, 300);
  background(172, 218, 224);
}

void draw() {
  stroke(188, 178, 146);
  if(mousePressed) {
    line(mouseX, mouseY, pmouseX, pmouseY);
    ellipse(mouseX, mouseY, 20,20);
    fill (150, 100, 80, 50);
    smooth();
  }
}

