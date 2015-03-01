
/**
 * Mouse 2D. 
 * 
 * Moving the mouse changes the position and size of each box. 
 */
 
void setup() //executed upon start up
{ //Beginning
  size(300, 400); //Size of the pixels
  noStroke(); //Do not draw lines or rectangle borders
  rectMode(CENTER);
} //End of setup

void draw() //Constant executions to refresh the window
{   
  background(51); //A gray background
  fill(255, 204, 100, 100); //This is the transparent, "fill" color of the shapes
  rect(mouseX, height/2, mouseY/2+10, mouseY/2+10); //make rectangle
  fill(255, 204, 155, 50);
  int inverseX = width-mouseX;
  int inverseY = height-mouseY;
  rect(inverseX, height/3, (inverseY/2)+10, (inverseY/2)+10);
}



