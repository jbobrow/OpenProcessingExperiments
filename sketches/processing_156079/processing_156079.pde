
/*
Original 144 Trapezes von Vera Molnar 
http://dam.org/artists/phase-one/vera-molnar/artworks-bodies-of-work/144-trap-zes
*/
float margin = 100;
float padding = 100;
int rows = 6;
int columns = 6;

float randomnessX = 20;

int randomSeedNum = 0;

int red = 0;
int green = 0;
int blue = 0;
int transparency = 255;

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
  
  //noFill();
  fill (red, green, blue, transparency);
  stroke (0, 200);
  
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
    randomSeedNum = randomSeedNum + 1;
  }
  
  if (key == '-')
  {
    randomSeedNum = randomSeedNum - 1;
  }
  
  if (key == 'm')
  {
    randomnessX = randomnessX+1;
  }
  
  if (key == 'n')
  {
    randomnessX = randomnessX-1;
    
    if (randomnessX < 0) 
    {
      randomnessX = 0;
    }
  }
  
  if (key == 'w')
  {
    margin = margin + 1;
  }
  
  if (key == 'j')
  {
    margin = margin - 1;
  }
  
  if (key == 'a')
  {
    padding = padding + 1;
  }
  
  if (key == 'd')
  {
    padding = padding - 1;
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
  
if (key == 'r')
  {
    red = red + 10;
  }

if (key == 'g')
  {
    green = green + 10;
  }

if (key == 'b')
  {
    blue = blue + 10;
  }

if (key == 't')
  {
    transparency = transparency - 10;
  }

  if (key == 's') saveFrame ("polygon_#####.png");
  println (frameCount);

}

