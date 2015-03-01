
void setup()
{
    frameRate(15);
}

boolean licht = true;

void draw()
{
  if(mousePressed)
  {
    licht = !licht;
  }
  
      
  if(licht)
  {
      background(255);
  }
  else
  {
      background(0);
  }
}

