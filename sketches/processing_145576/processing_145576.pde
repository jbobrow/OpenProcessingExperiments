
float x;
float y;
float d;
int dWachstum = 1;
int xDir = 1;
int yDir = 0;

void setup ()
{
  size (600, 200); 
  smooth();
  background (#57385c);
  
  x = 0;
  y = random (0, height);
  d = random (20, 40);
}

void draw ()
{
// zeichnen

  stroke (#A75265);
  strokeWeight (1);
  fill (#ffedbc);
  ellipse (x, y, d, d);
  
  // bewegen
  
  x+= xDir*random (1, 3);
  y+= yDir*random (1, 3);
  d += dWachstum * random (1, 6);
  
  // randüberprüfung
  
  if (d > 50)
  {
    d = 50;
    dWachstum *= -1;
  }
  
  if (d < 5)
  {
    d = 5;
    dWachstum *= -1;
  }
  
  boolean hatRandErreicht = false;
  
  if (x > width+d/2)
  {
    hatRandErreicht = true;
  }
  
  if (x < -d/2)
  {
    hatRandErreicht = true;
  }
  
  if (y > height+d/2)
  {
    hatRandErreicht = true;
  }
  
  if (y < -d/2)
  {
    hatRandErreicht = true;
  }
  
  if (hatRandErreicht == true)
  {
    int wuerfel = int (random (4));
    
    if (wuerfel == 0)
    {
      x = -d/2;
      xDir = 1;
      yDir = 0;
      y = random (height);
    }
    
    if (wuerfel == 1)
    {
      x = width+d/2;
      xDir = -1;
      yDir = 0;
      y = random (height);
    }
    
    if (wuerfel == 2)
    {
      y = -d/2;
      xDir = 0;
      yDir = 1;
      x = random (width);
    }
    
    if (wuerfel == 3)
    {
      y = height+d/2;
      xDir = 0;
      yDir = -1;
      x = random (width);
    }
  }
  
}


void mousePressed ()
{
  background (#57385c);
}



