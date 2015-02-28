
float x;
float y;
float d;
int dWachstum = 1;

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
  
  x+= random (1, 3);
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
    x = 0;
    y = random (0, height);
  }
  
}


void mousePressed ()
{
  background (#57385c);
}



