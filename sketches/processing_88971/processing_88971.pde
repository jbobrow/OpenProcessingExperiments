
void setup()
{
size (300,300);
rectMode(CENTER); //Made it centre to make it easier to move shapes with the mouse
rect(150,150,10,10); //To show where the mouse can't be
}
void draw()
{
  if (mouseX<140||mouseX>160||mouseY<140||mouseY>160) //So it will only work if the mouse is at least 10 away from the centre
  {
    
  background(255);
  rect(150,150,10,10);
  fill(255,0,0);
  ellipse(mouseX,mouseY,100,100);
  fill(0);
  rect(mouseX,mouseY,100,10);
  fill(255);
  ellipse(mouseX,mouseY,20,20); //Just a simple shape from ellipses and a rectangle
  
  }
  else
  
background (0); //Just to show it won't work properly if the mouse is in the centre
  
  
}
