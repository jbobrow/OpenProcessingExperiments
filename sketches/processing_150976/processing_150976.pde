
/**
 * Mouse 2D. 
 * 
 * Moving the mouse changes the position and size of each box. 
 */
 
void setup() 
{
  size(100, 200); 
  noStroke();
  rectMode(CENTER);
}

void draw() 
{   
  background(0); 
  fill(255,100, 100, 100);
  rect(mouseX, height/2, mouseY/2+10, mouseY/2+10);
  fill(100, 155, 100, 50);
  int inverseX = width-mouseX;
  int inverseY = height-mouseY;
  ellipse(inverseX, height/3, (inverseY/2)+10, (inverseY/2)+10);
}



