
/**
 * Mouse 2D. 
 * 
 * Moving the mouse changes the position and size of each box. 
 */
 
void setup() 
{
  size(640, 360); 
  //noStroke();
  colorMode(RGB, 255, 255, 255, 400);
  rectMode(CENTER);
}

void draw() 
{   
  background(40); 
  fill(255, 100,100, 400);
  rect(mouseX, height/2, mouseY/2+10, mouseY/2+10);
  fill(100, 155,35, 50);
  int inverseX = width-mouseX;
  int inverseY = height-mouseY;
  rect(inverseX, height/2, (inverseY/2)+10, (inverseY/2)+10);
}

  
