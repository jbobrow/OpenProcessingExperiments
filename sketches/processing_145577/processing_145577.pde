
float x;
float y;
float d;
int dWachstum = 1;
int xDir = 1;
int yDir = 1;

void setup ()
{
  size (600, 200); 
  smooth();
  background (#57385c);

  x = random (width);
  y = random (0, height);
  d = random (20, 40);
}

void draw ()
{
// zeichnen

  stroke (#A75265);
  strokeWeight (2);
  fill (#ffedbc);
  ellipse (x, y, d, d);
  
  // bewegen

  x+= random (-5, 5);
  y+= random (-5, 5);
  
    // wachsen 

  d += dWachstum * random (1, 6);

// kantenüberprüfung

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


  if (x > width+d/2)
  {
    x = -d/2+1;
  }

  if (x < -d/2)
  {
    x = width+d/2-1;
  }

  if (y > height+d/2)
  {
    y = -d/2+1;
  }

  if (y < -d/2)
  {
y = height+d/2-1;
  }
}


void mousePressed ()
{
  background (#57385c);
}

