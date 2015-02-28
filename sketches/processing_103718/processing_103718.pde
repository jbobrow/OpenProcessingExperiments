
float buttonX = 200;
float buttonY = 400;
float buttonWidth = 200;
float buttonHeight = 100;

color inactiveColor = color(100, 100, 100);
color hoverColor = color(100, 200, 100);
color clickColor = color(255, 0, 0);

//only happens when play is hit
void setup()
{
  size(800, 600);
  background(255);
  
}

//happens every frame, the onlyone that gets called every frame
void draw()
{
  background(255);
  
  if (isMouseOverRect(buttonX, buttonY, buttonWidth, buttonHeight))
  {
    fill(hoverColor);
  }
  else
  {
    fill(inactiveColor);
  }
  rect(buttonX, buttonY, buttonWidth, buttonHeight);
}

boolean isMouseOverRect(float x, float y, float w, float h)
{
  if (mouseX > x && mouseX < x + w)
  {
    return true;
  }
  
  return false;
}

//gets called when user clicks mouse
void mouseClicked()
{
  
}
