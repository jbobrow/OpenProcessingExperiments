
void setup() {
  size(500, 360);
  background(102);
  smooth();
  strokeWeight (2.5);
}

void draw() {
    stroke(225);
  }

void mousePressed()
{
 
    ellipse(mouseX, mouseY, 55, 55);
    filter(BLUR, 0.58);
   
}
