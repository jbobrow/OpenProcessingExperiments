
//KEYBOARD EVENTS
boolean drawT = false;

void setup()
{
  size(200, 200);
  noStroke();
}
void draw()
{
  background(200);

  if (drawT)
  {
    rect(20, 20, 160, 50);
    rect(75, 40, 50, 140);
  }
}
void keyPressed()
{
  if( (key=='t') || (key=='T') )
  {
    drawT = true;
  }
}  
void keyReleased()
{
  drawT = false;
}

