
float buttonX = 200;
float buttonY = 400;
float buttonWidth = 200;
float buttonHeight = 100;

color inactiveColor = color(100, 100, 100);
color hoverColor = color(100, 200, 100);
color clickColor = color(255, 0, 0);

boolean isMouseOverButton = false;


void setup()
{
  size(800, 600);
  background(255);
  
  textSize(30);
  fill(255, 0, 0);
  text("Press me", 200, 399 ); 
  
  
  
}

void draw()
{
  
  
  isMouseOverButton = isMouseOverRect(buttonX, buttonY, buttonWidth, buttonHeight);
  
  if (isMouseOverButton == true)

  
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


  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h)
  {
    return true;
  }

  return false;
}

void mousePressed()
{
  println("You pressed me!");
}
