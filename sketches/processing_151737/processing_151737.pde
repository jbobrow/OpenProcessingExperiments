
void setup ()
{
  size (600, 200);
  smooth();
  background (#57385c);
  frameRate (1);
}

void draw ()
{
  background (#57385c);

  fill (#ffedbc);
  stroke (#A75265);
  strokeWeight (3);

  int i = 0;
  while (i < 50)
  { 

    float x = random (width);
    float y = 0; 
    float probability = random (0, 100);
    
    if (probability < 20)
    {
      y = height/3;
    }
    else if (probability >= 20 && probability < 70)
    {
      y = height/2;
    }
    else
    {
      y = height * 2/3;
    }
    
    ellipse (x, y, 10, 10);

    i = i +1;
  }
}




void mousePressed ()
{
  background (#57385c);
}

