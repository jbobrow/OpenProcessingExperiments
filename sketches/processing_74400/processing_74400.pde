
/**
 * Continuous Lines. 
 * 
 * Click and drag the mouse to draw a line. 
 */
 
void setup() {
  size(640, 500);
  background(100,255,100);

}

void draw() {

  stroke(10);
  if(mousePressed) {
   strokeWeight(5) ; 
   stroke(255);
    line(mouseX,mouseY, pmouseX, pmouseY);
  }
}

