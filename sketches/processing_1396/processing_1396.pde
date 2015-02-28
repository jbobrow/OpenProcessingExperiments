
/**
 * Linear Motion. 
 * 
 * Changing a variable to create a moving line.  
 * When the line moves off the edge of the window, 
 * the variable is set to 0, which places the line
 * back at the bottom of the screen. 
 */
 
float a = 80;

void setup() 
{
  size(640, 200);
  stroke(20);
}

void draw() 
{
  background(255);
  a = a - 30;
  if (a < 30) { 
    a = height; 
  }
  line(20, a, width, a);  
}

