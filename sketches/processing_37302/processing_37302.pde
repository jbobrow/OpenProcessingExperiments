
boolean B;
void setup()
{
  size (500, 500);
  background(0);
  fill(255);
  rect (0,450,500,50);
  fill (0);
  textAlign(CENTER);
  text ("press any key to clear the screen and click to start",0,450,500,50);
  fill(60);
  text("by Joshua Z.",0,475,500,25);
}
void draw()
{
  noFill();
  stroke(random (200), random (200), random (200));
  if (B)
  {
    stroke (random (200, 255), random (200, 255), random (200, 255));
    line (random (500), random (500), mouseX, mouseY);
    ellipse (mouseX, mouseY, 25, 25);
  }
}
void keyPressed()
{
  background(0);
}
void mousePressed()
{
  B=true;
}
void mouseReleased()
{
  B=false;
}


