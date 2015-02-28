
void setup() {
  size(700, 500);
  background(255);
  smooth();
  frameRate(8);
}

void draw() {
  stroke(0);
  strokeWeight(random(.5,15.5));
  strokeCap(SQUARE);
  if(mousePressed) {
    line(700-mouseX, 500-mouseY, 700-pmouseX, 500-pmouseY);
    line(mouseX, mouseY, pmouseX, pmouseY);
   
  }
 
}
