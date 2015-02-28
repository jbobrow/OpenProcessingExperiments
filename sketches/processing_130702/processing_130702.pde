
PImage colors;
color Brush;
float triScale = 1;
float triTurn = 0;

void setup()
{
  size(500, 500);
  colors = requestImage("rgbwheel.jpg");
  background(255);
}

void draw()
{
  noStroke();
  fill(255, 0, 0);
  if (colors.width > 0)
  {
    image(colors, 0, 0, 150, 150);
  }
  
  if (mousePressed == true)
  {
    
    if (key == 'a')
    {
      triScale = triScale + 1;
    }
    if (key == 's')
    {
      triTurn = triTurn + 1;
    }
    if (key == 'd')
    {
      if (triScale > 1)
      {
        triScale = triScale - 1;
      }
    }
    if (mouseButton == LEFT)
    {
      pushMatrix();
      fill(Brush);
      translate(mouseX, mouseY);
      rotate(triTurn);
      scale(triScale);
      triangle(-10, -10, 10, -10, 0, 10);
      popMatrix(); 
    }
    if (mouseButton == RIGHT)
    {
      Brush = get(mouseX, mouseY);
    }
  }
  
  /*if (keyPressed)
  {
    if (key == '1')
    {
      Brush = tint(255, 0, 0);
    }
    else if (key == '2')
    {
      Brush = tint(0, 255, 0);
    }
    else if (key == '3')
    {
      Brush = tint(0, 0, 255);
    }
  else
  {
    noFill();
  }*/
}


