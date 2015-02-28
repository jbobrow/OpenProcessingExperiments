
//Lawrence Jiang, Block 6, User Input
//click and drag mouse to draw circles
//press "space" to clear screen

void setup()
{
  background(0);
  size(800, 600);
}
void draw()
{
}
void mouseDragged()
{ 
  frameRate(100);
  float r =  (random(0, 255));
  float g =  (random(0, 255));
  float b =  (random(0, 255));
  stroke(r, g, b);
  strokeWeight(10);
  fill(r-15, g-15, b-15,255);
  ellipse (mouseX, mouseY, 50, 50);
  ellipse (800-mouseX, mouseY, 50, 50);
  ellipse (mouseX, 600 - mouseY, 50, 50);
  ellipse (800-mouseX, 600 - mouseY, 50, 50);
}
void keyPressed()
{
  float r =  (random(0, 255));
  float g =  (random(0, 255));
  float b =  (random(0, 255));
  if (key==' ')
  {
    background(255-r, 255-g, 255-b);
  }
}
