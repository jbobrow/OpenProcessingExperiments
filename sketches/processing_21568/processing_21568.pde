
int [ ] positionX = new int [200];
int [ ] positionY = new int [200];

void setup () 
{
  size (400, 400);
  smooth ();
  
  for (int i = 0; i < positionX.length; i++)
  {
    positionX [i] = 0;
    positionY [i] = 0;
  }
}

void draw ()
{
  background (255);
  for (int i = 0; i < positionX.length - 1; i++)
  {
    positionX [i]= positionX [i + 1];
    positionY [i]= positionY [i + 1];
  }
  
  positionX [positionX.length - 1] = mouseX;
  positionY [positionY.length - 1] = mouseY;
  
  for (int i = 0; i < positionX.length; i++)
  {
    noStroke ();
    fill (255 - i, i, 0);
    ellipse (positionX [i], positionY [i], i / 2, i / 2);
  }
}

