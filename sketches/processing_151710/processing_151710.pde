
int ars = 0;


void setup ()
{
  size (600, 600);
  smooth();
}

void draw ()
{
  background (#57385c);
  randomSeed (ars);

  float maxDistance = dist (0, 0, width/2, height/2);

  int i = 0;

  while ( i < 500)
  {
    float x = random (width);
    float y = random (height);
    float distance = dist (x, y, width/2, height/2);
    float myAlpha = map (distance, 0, maxDistance, 255, 0);
    float myDiameter = map (distance, 0, maxDistance, 50, 5);

    stroke (#A75265, myAlpha);
    fill (#ffedbc, myAlpha);
    ellipse (x, y, myDiameter, myDiameter);
    
    i = i+1;
  }
}

void mousePressed ()
{
  if (mouseButton == LEFT) 
  {
    ars = ars +1;
  }
  else
  {
    ars = ars -1;
  }
}

