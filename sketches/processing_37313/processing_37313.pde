
//Creative Creation 
//Use mouse to move and click to change color of the shape, and press "a" to change background and clear ellipses press "s" to change to black background.
boolean aPressed, sPressed;

void setup ()
{
  aPressed = sPressed = false; 
  size (500,500);
  background (0);
  smooth ();
  noStroke ();
}

void keyPressed()
{
  if (key == 'a') aPressed = true;
  if (key == 's') sPressed = true;
}


void keyReleased() 
{
 if (key == 'a') 
  {
    aPressed = false;
  }
 if (key == 's')   
  {
    sPressed = false;
  }  
}  
void draw ()
{
  ellipse (mouseX, mouseY, random (250), random (250));
  if (mousePressed == true)
  {
    fill(random(255), random(255), random(255), random(255)); 
  }
  if (aPressed)
  {
  background(random(255), random(255), random(255), random(255));
  }
   if (sPressed)
  {
  background(0);
  }
}

