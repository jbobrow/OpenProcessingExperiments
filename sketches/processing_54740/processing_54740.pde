
/**
 * Linear Motion. 
 * 
 * Changing a variable to create a moving line.  
 * When the line moves off the edge of the window, 
 * the variable is set to 0, which places the line
 * back at the bottom of the screen. 
 */
 
float a = 100;

void setup() 
{
  size(640, 200);
  stroke(255);
}

void draw() 
{
  background(255);
  a = a - 0.5;
  if (a < 0) { 
    a = height; 
  }
 fill(255-a);
  textSize(a);
  text("fühlen lesen teilen", 0, a);
  
    fill(255-a);
  textSize(a+10);
  text("universitätstrasse", 100, a+100);
}

