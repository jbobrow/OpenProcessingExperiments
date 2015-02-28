
PFont f;

void setup ()
{
  size (800, 600);
  background (75);
  f = createFont ("Verdana Bold", 16, true);
  
}

void draw ()
{

  if (mousePressed)
  {
    fill (0, 0, random (128, 255));
    
  }
  else
  {
    fill (random (128, 255), 0, 0);
    
  }
  
  stroke (255, 200, 128);
  strokeWeight (3);
  ellipse (mouseX, mouseY, random (50, 100), random (50, 100));
  
  textFont (f, 32);
  fill (100);
  textAlign (RIGHT);
  text ("Kenny Rose Design", 790, 590);
  
  textFont (f, 16);
  fill (100);
  textAlign (LEFT);
  text ("Created using Processing and Processing.js", 20, 20);
  text ("based on code by Casey Reas and Ben Fry", 20, 40);
  
  
  
}


