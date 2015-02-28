
void setup()
{
  size(400, 600);
  smooth(0);
}

void draw()
{
  fill(255, 255, 255, 100);
  
  fill( 255, 255, 0 );
  if (frameCount%30<15)
    fill(0, 0, 255);
  ellipse(mouseX, mouseY, 100, 100);
  }

