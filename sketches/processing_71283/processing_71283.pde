
//Derek Chan, User Input, CP1 Mods 14-15
//http://derek-lhs.webs.com/ColorfulShapes.html
void setup()
{
  size(400, 400);
  strokeWeight(5);
  background(0);
  stroke(255, 0, 0);
}
void draw()
{
  strokeChange();
  clickForShapes();
  fillChange();
  backgroundChange();
}
void strokeChange()
{
  if (keyCode == UP)
  {
    stroke(255, 0, 0);
  }
  if (keyCode == DOWN)
  {
    stroke(0, 255, 0);
  }
  if (keyCode == LEFT)
  {
    stroke(255, 255, 0);
  }
  if (keyCode == RIGHT)
  {
    stroke(0, 0, 255);
  }
}
void clickForShapes()
{
  if (mousePressed)
  {
    if (mouseButton==LEFT)
    {
      if (mouseX<101)
      {
        ellipse(mouseX, mouseY, 50, 50);
      }
      else if (mouseX<201)
      {
        rect(mouseX, mouseY, 50, 50);
      }
      else if (mouseX<301)
      {
        triangle(mouseX, mouseY, mouseX+50, mouseY+50, mouseX-50, mouseY+50);
      }
      else if (mouseX<401)
      {
        beginShape();
        vertex(mouseX, mouseY);
        vertex(mouseX+13, mouseY);
        vertex(mouseX+25, mouseY-17);
        vertex(mouseX+37, mouseY);
        vertex(mouseX+50, mouseY);
        vertex(mouseX+37, mouseY+13);
        vertex(mouseX+37, mouseY+37);
        vertex(mouseX+25, mouseY+25);
        vertex(mouseX+13, mouseY+37);
        vertex(mouseX+13, mouseY+13);
        vertex(mouseX, mouseY);
        endShape();
      }
    } 
    else if (mouseButton==RIGHT)
    {
      fill(255);
      noStroke();
      rect(mouseX, mouseY, 50, 50);
    }
  }
}  
void fillChange()
{
  if (mouseY<101)
  {
    fill(157, 19, 157);
  }
  else if (mouseY<201)
  {
    fill(255, 155, 0);
  }
  else if (mouseY<301)
  {
    fill(0, 255, 231);
  }
  else if (mouseY<401)
  {
    fill(255);
  }
}
void backgroundChange()
{
  if (keyPressed)
  {
    if (key=='1')
    {
      background(255, 0, 0);
    }
    if (key=='2')
    {
      background(255, 155, 0);
    }
    if (key=='3')
    {
      background(255, 255, 0);
    }
    if (key=='4')
    {
      background(0, 255, 0);
    }
    if (key=='5')
    {
      background(0, 255, 255);
    }
    if (key=='6')
    {
      background(0, 0, 255);
    }
    if (key=='7')
    {
      background(143, 45, 224);
    }
    if (key=='8')
    {
      background(202, 11, 224);
    }
    if (key=='9')
    {
      background(255);
    }
    if (key=='0')
    {
      background(0);
    }
  }
}
