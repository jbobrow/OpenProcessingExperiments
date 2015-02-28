
float buttonX = 200;
float buttonY = 400;
float buttonWidth = 200;
float buttonHeight = 100;

color inactiveColor = color(100, 100, 100);
color hoverColor = color(252, 239, 89);
color clickColor = color(255, 0, 0);

boolean isMouseOverButton = false;



void setup()
{
  size(800, 600);
  background(255);
  isMouseOverButton = true; 
   
}

void draw()
{
   background(255);
  isMouseOverButton = mouseOverRect(buttonX, buttonY, buttonWidth, buttonHeight);
  if (isMouseOverButton == true)
  {
    //
  }
  else
  {
    fill(inactiveColor);
  }

 rect(buttonX, buttonY, buttonWidth, buttonHeight);
}

boolean mouseOverRect(float x, float y, float w, float h)
{
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) 
  {
    return true;
  } else {
    return false;
  }
  
 
}

void mousePressed()
{
  if (isMouseOverButton)
  {
    println("yay!");
    fill(hoverColor);  
  }
  
  
}
  







