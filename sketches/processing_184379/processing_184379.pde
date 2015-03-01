
int value1, value2, value3; 

void setup()
{
  size(700, 500);
}

void draw() 
{
  background(100); 
  rectMode(CENTER); 
  fill(value1, value2, value3); 
  rect(width/2, height/2, width/2, height/2);
} 

void mouseMoved()
{
  if (mouseX<width/2) {
    value1 = 255; 
    value2 = 255;
    value3 = 0;
  }
  if (mouseX>width/2)
  {
    value1 = 255;
    value2 = 0; 
    value3 = 255;
  }
  
  //lower right
  if (mouseX>= width/2 && mouseX <= ((width/2)/2+350) && mouseY >= height/2 && mouseY <= (height/2 +120))
  {
    value1 = 0; 
    value2 = 255; 
    value3 = 255;
  }
  
  //upper left
  if (mouseX>= (width/2-180) && mouseX <= width/2 && mouseY >= (height/2-120) && mouseY <= height/2)
  {
    value1 = 0; 
    value2 = 255; 
    value3 = 255;
  }
  
  //upper right
  if (mouseX>= (width/2) && mouseX <= (width/2+180) && mouseY >= (height/2-120) && mouseY <= (height/2))
  {
    value1 = 0; 
    value2 = 255; 
    value3 = 255;
  }
  //lower left
  if (mouseX>= (width/2-180) && mouseX <= width/2 && mouseY >= height/2 && mouseY <= (height/2 +120))
  {
    value1 = 0; 
    value2 = 255; 
    value3 = 255;
  }
}

