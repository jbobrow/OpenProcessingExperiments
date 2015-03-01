
/*
Original 144 Trapezes von Vera Molnar 
http://dam.org/artists/phase-one/vera-molnar/artworks-bodies-of-work/144-trap-zes
*/
float margin = 100;
float padding = 90;
int rows = 5;
int columns = 5;

float randomnessX = 25;

int randomSeedNum = 0;

void setup ()
{
  size (700, 700);
  smooth();
  
}

void draw ()
{
  background (247);
  
  randomSeed (randomSeedNum);
  
  float xSteps = ( width - 2*margin - (columns-1)*padding ) / columns;
  float ySteps = ( height - 2*margin - (rows-1)*padding ) / rows;
  
  float x = margin;
  float y = margin;
  
  fill(0);
  stroke (0, 200);
  strokeWeight (2);
  
  while (y <= height-margin)
  {
    x = margin;
    
    while (x <= width-margin)
    {
      quad (
      x            + random (-randomnessX, randomnessX),   y,
      x + xSteps   + random (-randomnessX, randomnessX),   y,
      x + xSteps   + random (-randomnessX, randomnessX),   y + ySteps,
      x            + random (-randomnessX, randomnessX),   y + ySteps
      );
      
      x = x + xSteps + padding;
    }
    y = y + ySteps + padding;
  }
}

void keyPressed ()
{
  if (key == '+')
  {
    randomSeedNum = randomSeedNum + 3;
  }
  
  if (key == '-')
  {
    randomSeedNum = randomSeedNum - 3;
  }
  
  if (key == 'm')
  {
    randomnessX = randomnessX+3;
  }
  
  if (key == 'n')
  {
    randomnessX = randomnessX-3;
    
    if (randomnessX < 0) 
    {
      randomnessX = 0;
    }
  }
  
  if (key == 'w')
  {
    margin = margin + 4;
  }
  
  if (key == 's')
  {
    margin = margin - 4;
  }
  
  if (key == 'a')
  {
    padding = padding + 4;
  }
  
  if (key == 'd')
  {
    padding = padding - 3;
  }
  
  if (key == 'p')
  {
    rows = rows +1;
  }
  
  if (key == 'o')
  {
    rows = rows -1;
    
    if (rows < 1)
    {
      rows = 1;
    }
  }
  
   if (key == 'i')
  {
    columns = columns +1;
  }
  
  if (key == 'u')
  {
    columns = columns -1;
    
     if (columns < 1)
    {
      columns = 1;
    }
  }
}


