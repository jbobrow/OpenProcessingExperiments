
float x;
float y;

void setup ()
{
  size (600, 200); 
  smooth();
  background (#57385c);
  
  x = 0;
  y = random (0, height);
  
}

void draw ()
{
    // zeichnen
  stroke (#A75265);
  strokeWeight (1);
  fill (#ffedbc);
  ellipse (x, y, 30, 30);
  
  // bewegen
  
  x+= 4;
  
  // kantenüberprüfung
  
  if (x > width+15)
  {
    x = 0;
    y = random (0, height);
  }
  
}


void mousePressed ()
{
  background (#57385c);
}



