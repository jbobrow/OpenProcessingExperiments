
float x;
float y;
float d;

float dirX = 1;
float dirY = 1;

void setup ()
{
  size (600, 200); 
  smooth();


  x = random (width);
  y = random (0, height);

  d = 40;
}

void draw ()
{
  background (#57385c);

// zeichnen

  stroke (#A75265);
  strokeWeight (2);
  fill (#ffedbc);
  ellipse (x, y, d, d);
  
  // bewegen

  x+= dirX;
  y+= dirY;
  
  // randüberprüfung

  if (x > width-d/2)
  {
    x = width-d/2;
    dirX *= -1;

  }

  if (x < d/2)
  {
    x = d/2;
    dirX *= -1;
  }

  if (y > height-d/2)
  {
    y = height-d/2;
    dirY *= -1;
  }

  if (y < d/2)
  {
    y = d/2;
    dirY *= -1;
  }
}

