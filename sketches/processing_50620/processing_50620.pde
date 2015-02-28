
// Homework #4 48-257
// Humaira Tasnim htasnim Copyright 2012
 
float x, y, dia;
 
void setup()
{
  size (400, 400);
  smooth ();
  noStroke ();
  background (0);
}
 
void draw()
{
  // Mouse input:
  // Circle is drawn where the mouse is pressed
  if (mousePressed)
  {
    x = mouseX;
    y = mouseY;
    dia = random (10,50);
    fill (random(255), random(255), random(255), 35);
    ellipse (x, y, dia, dia);
  }
}
 
void keyPressed()
{
  // Keyboard input:
  // Trail of the Circle goes in the up direction
  if (keyCode == UP)
  {
    y = y - dia;
    ellipse (x, y, dia, dia);
  }
  
  // Keyboard input:
  // Trail of the Circle goes in the down direction  
  if (keyCode == DOWN)
  {
    y = y + dia;
    ellipse (x, y, dia, dia);
  }
   
  // Keyboard input:
  // Trail of the Circle goes in the left direction  
  if (keyCode == LEFT)
  {
    x = x - dia;
    ellipse (x, y, dia, dia);
  }
  
  // Keyboard input:
  // Trail of the Circle goes in the right direction  
  if (keyCode == RIGHT)
  {
    x = x + dia;
    ellipse (x, y, dia, dia);
  }
  
  // Keyboard input:
  // Clears the screen  
  if (key == ' ')
  {
    background (0);
  }
     
  // Keyboard input:
  // Increases the diameter of the Trail of the Circle
  if (key == '+')
  {
    dia = dia + 1;
    ellipse (x, y, dia, dia);
  }
   
  // Keyboard input:
  // Decreases the diameter of the Trail of the Circle 
  if (key == '-')
  {
    dia = dia - 1;
    ellipse (x, y, dia, dia);
  }
}

