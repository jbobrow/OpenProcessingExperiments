
//create a field of circles
void setup() {
  size(600, 600);
  noLoop();//don't loop through the draw loop
}

void draw() {
  background(20, 200, 40);
  noStroke();
  fill(0, 40, 255);
  for ( int yPos = 0; yPos <= height; yPos += height/10) {
    //draw 10 ellipses up and down
    for (int xPos = 0; xPos <= width; xPos = xPos + 50) {
      //draw ellipses 50 pixels apart left and right
      ellipse(xPos, yPos, 25, 25);
    }
  }
}
