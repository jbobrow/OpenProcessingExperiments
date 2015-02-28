
void setup()
{
  size(400, 600);
  background(0, 0, 0);
  smooth();
  noStroke();

}

void draw()
{ 
  
}

void keyPressed()
{
   if (key == '1')
  {
    fill(255);
    ellipse(mouseX, mouseY, 140, 140);
  }
  if (key == '2')
  {
    fill(255);
    ellipse(mouseX, mouseY, 100, 100);
  }
  if(key == '3')
  {
    fill(255);
    ellipse(mouseX, mouseY, 70, 70);
  }
  if(key == 'e')
  {
    fill(0);
    ellipse(mouseX, mouseY, 10, 10);
  }
  if(key == 's')
  {
    fill(255);
    ellipse(mouseX,mouseY,3,3);
  }
  if(key == 'n')
  {
    fill(255,51,0);
    triangle(mouseX-5,mouseY,mouseX+5,mouseY,mouseX,mouseY+15);
  }
  if(key == 'b')
  {
    fill(0);
    ellipse(mouseX,mouseY,10,10);
  }
    
    
}
