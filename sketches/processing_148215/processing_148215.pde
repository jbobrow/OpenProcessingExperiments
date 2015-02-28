
void setup ()
{
  size (600, 200);
  smooth();
  background (#57385c);
  
  frameRate (10);
}

void draw ()
{

  float x = random (width);
  float y = random (height);
  float steps = random (4, 12);
  
  stroke (#57385c);
  strokeWeight (1);
  fill (#ffedbc);
  
  float d = random (10, 100); // zählvariable
  
  while (d > 1)
  {
    ellipse (x, y, d, d);
    
    /**
     * änderung der zählvariable
     * die zählvariable d wird kontinuierlich kleiner
     */
    d = d - steps; 
  }
}

void mousePressed ()
{
  background (#57385c);
}

