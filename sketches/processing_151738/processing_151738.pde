
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
  while (i < 500)
  { 

    float x = random (width);
    float y = 0; 
    float probability = random (0, 100);
    
    if (probability < 10)
    {
      y = random (0, height/3);
    }
    else if (probability >= 10 && probability < 30)
    {
      y = random (height/3, height*2/3);
    }
    else
    {
     y = random ( height*2/3, height);
    }
    
    ellipse (x, y, 10, 10);

    i = i +1;
  }
}




void mousePressed ()
{
  background (#57385c);
}

