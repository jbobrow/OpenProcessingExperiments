
boolean drawn;

void setup()
{
  smooth();
  size(500, 500);
  background(255, 255, 255);
  strokeWeight(3);
  drawn = false;
}

void draw()
{
  if(!drawn)
  {  
    drawWave();
    drawn = true;
  }
}

void drawWave()
{
  noFill();
  stroke(0);
  float rad = 0;
  
  for(int i = 0; i <= 500; i++)
  {
    for(int j = -15; j < 515; j+= 5)
    {
      if(j % 3 != 0) point(i, j + 10 * sin((1.0/3.0) * (rad + j * PI/32)));
    }
    rad += PI/32;
  }
}

                
                
