
//Do some cool things with lines
void setup() {
  size(600, 600);
  smooth();
}
void draw() {
  background(20, 200, 240);
  stroke(230, 100, 100);
  line(0, height*.5, width, height*.5); 
  for (int xPos = 0; xPos <= width; xPos = xPos + 10) {
    //draw lines 10 pixels apart to the mouse
    line(xPos, 0, mouseX, mouseY);
    //draw lines 10 pixels apart away from the mouse
    line(xPos, height, mouseX, height-mouseY);
  }
}
