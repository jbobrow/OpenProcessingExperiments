
PImage Gimage;
float buttonX = 200;
float buttonY = 400;
float buttonWidth = 200;
float buttonHeight = 100;

color inactiveColor = color(0, 0, 0);
color  hoverColor = color (255, 0, 0);
color  clickColor = color(191, 65, 65);
boolean isMouseOverButton = false;

void setup()
{
 Gimage = loadImage("g.jpg");

  size(Gimage.width, Gimage.height);

  image(Gimage, 0, 0);
 
  size(800, 600);
  background(255);
}

// happens every frame

void draw()
{
  background(255);

  isMouseOverButton = isMouseOverRect(buttonX, buttonY, buttonWidth, buttonHeight);

  if (isMouseOverButton && mousePressed ==true)
  {
    fill(hoverColor);
 
 
  } else // mouse outisde of button
  {
    fill(inactiveColor);
  }


  rect(buttonX, buttonY, buttonWidth, buttonHeight);
}
boolean isMouseOverRect (float x, float y, float w, float h)
{
  if (mouseX > x && mouseX < x + w  && mouseY > y && mouseY < y+h)
  {
    return true;
  }
  return false;
}
//get's called when user click's mouse

void mousePressed()
{
  if (isMouseOverButton == true)
    println("we've clicked the button");
}



