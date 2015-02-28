
float xPos = 0;
float yPos = 0;


void setup()
{
  size(1280, 720);
  background(8, 140, 190);
}

void draw()
{
  xPos = mouseX;
  yPos = mouseY;
  
  if(mousePressed)
  
  {
    fill(164, 10, 190);
    ellipse(xPos, yPos, 50, 50);
  }
  else
  {
    fill(255,255,255);
    ellipse(xPos, yPos, 50, 50);
 
  }
  if(keyPressed && key == 'e')
  {
    stroke(8, 140, 190);
    fill(8, 140, 190);
    ellipse(xPos, yPos, 50, 50);
    
  }
  if(!keyPressed && key == 'e')
  {
    stroke(0);
  }
}
