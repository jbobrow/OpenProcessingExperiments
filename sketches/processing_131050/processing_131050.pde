
PImage colors;
PImage skelly;
color Brush;
float triScale = 1;
float triTurn = 0;

void setup()
{
  size(750, 600);
  colors = requestImage("Gradient.jpg");
  skelly = requestImage("Skeletor.jpg");
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
      if (key == '1')
      {
        pushMatrix();
        fill(Brush);
        translate(mouseX, mouseY);
        rotate(triTurn);
        scale(triScale);
        triangle(-10, -10, 10, -10, 0, 10);
        popMatrix();
      }
      if (key == '2')
      {
        pushMatrix();
        fill(Brush);
        translate(mouseX, mouseY);
        rotate(triTurn);
        scale(triScale);
        ellipse(0, 0, 20, 20);
        ellipse(15, -10, 5, 5);
        ellipse(-15, -10, 5, 5);
        ellipse(5, -15, 5, 5);
        ellipse(-5, -15, 5, 5);
        popMatrix();
      }
      if (key == '3')
      {
        background(random(255), random(255), random(255), random(255));
      }
      if (key == '4')
      {
        pushMatrix();
        color(random(255), random(255), random(255));
        translate(mouseX, mouseY);
        rotate(triTurn);
        scale(triScale);
        image(skelly, -50, -50, 100, 100);
        popMatrix();
      }
    }
    if (mouseButton == RIGHT)
    {
      Brush = get(mouseX, mouseY);
    }
  }
}


