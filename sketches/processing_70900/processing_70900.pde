
//  Parameters for fiddling

float noiseScale = 0.015;
float zinc = 2;

//  \Fiddle

int z = 0;
boolean bw = true;

void setup()
{
  size (400, 400);
}

void draw() 
{
  z += zinc;

  for (int x=0; x<width; x++)
  {
    for (int y=0; y<height; y++)
    {
      if (bw)
      {
        stroke(255*(noise(noiseScale*x, noiseScale*y, noiseScale*z ) ));
      }
      else
      {
        stroke(255*(noise(noiseScale*x, noiseScale*y, noiseScale*z  )), 
               255*(noise(noiseScale*x, noiseScale*y, noiseScale*z+1)), 
               255*(noise(noiseScale*x, noiseScale*y, noiseScale*z+2)));
      }
      
      point (x, y);
    }
  }
}

void keyPressed()
{
  if (key == 'c')
    bw = !bw;
}
