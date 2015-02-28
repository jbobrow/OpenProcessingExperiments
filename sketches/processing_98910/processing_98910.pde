
float row;
float column;

void setup()
{
  size(400, 400);
  background(255, 255, 255);
  smooth();

  
}

void draw()
{
  if ( (mouseX <= width/2 ) && (mouseY <= height/2 ) )
  {
    fill(0, 0, 255);
  }
  else
  {
    fill(255, 0, 0);
  }

  ellipse(mouseX, mouseY, 50, 50);
  
}
