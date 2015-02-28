
// Practice1002: Moving Line
// by Mei


void setup() {
  size(480, 120);
  background(200);
  smooth();
}
void draw() {
  if (mousePressed) {
    stroke(120+mouseX, mouseY, 0, 60);
  } 
  else {
    stroke(255);
  }
  float firstX;
  firstX = width/2;
  float firstY;
  firstY = height/2;
  float secondX;
  secondX = mouseX+10;
  float secondY;
  secondY = mouseY+10;
  strokeWeight(1);
  line(firstX, firstY, secondX, secondY);
} 
void keyPressed() {
  saveFrame("screen-####.png");
  }



