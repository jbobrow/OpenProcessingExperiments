
//put a square in the bottom right third of the screen
int oneThirdOfWidth = 600 / 3;
int twoThirdsOfWidth = oneThirdOfWidth *2;
void setup() {
  size(600, 580);
  stroke(255, 240, 245);
  strokeWeight(3);
}
void draw() {
  background(20, 30, 150);
  //if the mouse is in the bottom right corner
  if (mouseX > twoThirdsOfWidth) { //last third
    if (mouseY > height/2) { //bottom half
      rect(500, 380, 30, 30);  //draw a rectangle
    }
  }
  //dividing lines
  line(oneThirdOfWidth, 0, oneThirdOfWidth, height);
  line(twoThirdsOfWidth, 0, twoThirdsOfWidth, height);
  line( 0, height/2, width, height/2);
}
