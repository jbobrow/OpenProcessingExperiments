
/*
  
 Program written for CPSC 601-36
 Assignment 1
 Prepared for Ben Stephenson
 Written by Christopher Sparrow
 2011/10/21
  
  
 This is a basic drawing program consisting of a brush (ellipse)
 the radius of the ellipse can grow or shrink, and the colour of the 'paint' can be changed also.
  
 controls:
 LEFT mouseclick = Colour
 RIGHT mouseclick = greyscale (hold down)
  
 r: controls the red value (0 < r < 255)
 g: controls the green value (0 < r < 255)
 b: controls the blue value (0 < r < 255)
  
 p: grows the brush size
 l: shrinks the brush size
  
 */
 
float rad = 50;      // Brush radius
 
float rvalue = 0;   // Brush red colour value
float bvalue = 0;   // Brush blue colour value
float gvalue = 0;   // Brush green colour value
 
int i = 0;
 
void setup()        // Canvas dimensions, framerate, background fill colour, etc
{
  frameRate (90);
  size (500, 500);
  fill (0);
  smooth ();
  noStroke();
}
 
 
void draw ()
{
  fill (255, 255, 255, 2);
  rect (0, 0, 500, 500);
 
  // +1 is added to r,g, or b if they are pressed.
  if (mousePressed == true)
  {
    if (mouseButton == RIGHT)
    {
      for (i = 0; i < 255; i++)
      {
        noStroke ();
        rvalue++;
        gvalue++;
        bvalue++;
        if (rvalue > 255)
        {
          rvalue = 0;
        }
        if (gvalue > 255)
        {
          gvalue = 0;
        }
        if (bvalue > 255)
        {
          bvalue = 0;
        }
      }
    }
  }
  if (mouseButton == LEFT)
  {
    if (keyPressed == true)
    {
      noStroke();
      if (key == 'r')
      {
        rvalue++;
      }
      if (key == 'g')
      {
        gvalue++;
      }
      if (key == 'b')
      {
        bvalue++;
      }
      // if the value of rg or b is greater than 255 the value resets to zero
      if (rvalue >= 255)
      {
        rvalue = 0;
      }
      if (gvalue >= 255)
      {
        gvalue = 0;
      }
      if (bvalue >= 255)
      {
        bvalue = 0;
      }
    }
  }
 
  // if 'P' (pressure) is pressed the brush enlarges
  if ((keyPressed == true) && (key == 'p'))
  {
    rad += 1;
  }
 
  // if 'l' (light) is pressed the brush shrinks
  if ((keyPressed == true) && (key == 'l'))
  {
    rad -= 1;
  }
 
  //brush fill
  fill(rvalue, gvalue, bvalue);
 
  println ("rvalue is " + rvalue + "  " + "gvalue is " + gvalue + "  " + "bvalue is " + bvalue);
  //draw the brush
  ellipse (mouseX, mouseY, rad, rad);
}
