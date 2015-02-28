
/**
 * Mouse 2D. 
 * 
 * Moving the mouse changes the position and size of each box. 
 */
 
void setup() 
{
  size(640, 360); 
  noStroke();
  rectMode(CENTER);
}

void draw() 
{   
  background(51); 
  fill(#F7C148);
  ellipse(mouseX, height/2, mouseY/2+10, mouseY/2+10);
  fill(#FFD535);
  ellipse(mouseX-80, height/2, mouseY/4, mouseY/4);
  fill(#3A8C7E);
  ellipse(mouseX+150, height/2, mouseY/4, mouseY/4);
  fill(#D6D6D6);
  ellipse(mouseX+200, height/2, mouseY/6, mouseY/6);
  int inverseX = width-mouseX;
  int inverseY = height-mouseY;
  fill(#F7C148);
  ellipse(inverseX, height/2, (inverseY/2)+10, (inverseY/2)+10);
  fill(#FFD535);
   ellipse(inverseX-80, height/2, (inverseY/4)+10, (inverseY/4)+10);
   fill(#3A8C7E);
   ellipse(inverseX+150, height/2, (inverseY/4)+10, (inverseY/4)+10);
   fill(#D6D6D6);
   ellipse(inverseX-150, height/2, (inverseY/6)+10, (inverseY/6)+10);
}



