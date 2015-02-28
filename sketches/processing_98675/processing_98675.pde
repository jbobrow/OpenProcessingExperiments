
void setup()
{
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(60);
}


void draw()
{
}


void mouseDragged()
{
  ellipse(mouseX, mouseY, 20, 20); 
}


void keyPressed()
{
  if (key == 'r')
  {  
    fill(255, 0, 0);
  }
  
  if (key == 'g')
  {  
    fill(0, 255, 0);
  }

  if (key == 'b')
  {  
    fill(0, 0, 255);
  }
  
  if (key == ' ')
  {  
    background(255, 255, 255);
    fill(255, 255, 255);
  }
  
}
