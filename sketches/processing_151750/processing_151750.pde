
void setup ()
{
  size (600, 200);
  smooth();
  frameRate (3);
}

void draw ()
{
  background (#57385c);

  fill (#ffedbc);
  stroke (#A75265);
  strokeWeight (3);

  int columns = 12;
  float rectWidth = float (width) / columns;

  int i = 0;
  while ( i < columns)
  {
    float y = 0;
    
    if (i % 2 == 0)
    {
      y = 0;
    }
    else 
    {
      y = height/3;
    }
    
    rect (i*rectWidth, y, rectWidth, height*2/3);
    i = i + 1;
  }
}

