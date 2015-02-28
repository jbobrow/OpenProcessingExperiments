
float drip = 0;
float dripX = 0;
float dripY = 0;
 
void setup()
{
  size(600, 600);
  
  // draw white background Xs
  stroke(255);
  drawX(width/2, height/2, 25);
  drawX(300, 400, 50);
}

void draw()
{
  if (mousePressed == true)
  {
    stroke(0);
    drawX(mouseX, mouseY, 40);
    dripX = mouseX + 40;
    dripY = mouseY + 40;
  }

  // draw drip line down the screen until new drip 
  // position is set
  stroke(0);
  float nextY = dripY + 10;
  line(dripX, dripY, dripX, nextY);
  dripY = nextY;
  
  
  // how to use vertices to draw shapes
  // (top left corner)
  beginShape();
  vertex(30, 20);
  vertex(75, 20);
  vertex(82, 34);
  vertex(32, 44);
  vertex(40, 80);
  endShape();
}

// x, y are center of x, 
// xSize is half the width and height of the end x shape
void drawX(float x, float y, float xSize)
{
  line(x - xSize, y - xSize,x + xSize, y + xSize);
  line(x + xSize, y - xSize, x - xSize, y + xSize);
}
