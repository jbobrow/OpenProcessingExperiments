
void setup ()
{
  size (600, 200);
  smooth();
  noLoop();
}
 
void draw ()
{
  background (#57385c);

  
  stroke (#A75265);
  strokeWeight (2);
  fill (#ffedbc);
  
  int i = 0; // zählvariable
  int iMax = 300; // anzahl der Schleifendurchläufen
  
  while (i < iMax )
  {
    float x = random (width);
    float y = random (height);
    
    ellipse (x, y, 20, 20);
    
    i= i+1;
  }
  
}

void mousePressed ()
{
  redraw();
}
 

