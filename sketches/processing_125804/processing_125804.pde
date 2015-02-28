
int x;
int y;
int count;

// z erases linesxzxzxc
// x creates randomly colored lines
// c adds a blue light at corners
// v erases with a semi-transparent circle
// r makes a white ripple

void setup()
{
  x=200;
  background(0);
  size(500,500);  
}

void draw()
{
  if (keyPressed)
  {
    if (key == 'c')
    {
      fill(0,0,280,2);
      stroke(0,0,200,2);
      ellipse(0,0,random(width),random(width));
      ellipse(500,500,random(width),random(width));
    }
  }
  if (keyPressed)
  {
    if (key == 'x')
    {
      stroke(random(255),random(255),random(255),100);
      line(500,500,mouseX,mouseY);
      line(0,0,mouseX,mouseY);
    }
    erase();
    eraseCircle();
    transCircle();
  }
}

void mouseClicked()
{
   if (mouseButton == LEFT)
   {
     background(0);
   }
}

void erase()
{
  if (keyPressed)
  {
    if (key == 'z')
    {
      stroke(0,0,0,100);
      fill(0,0,0,100);
      line(500,500,mouseX,mouseY);
      line(0,0,mouseX,mouseY);
    }
  }
}

void eraseCircle()
{
  if (keyPressed)
  {
    if (key == 'v')
    {
      stroke(0,0,0,20);
      fill(0,0,0,20);
      ellipse(mouseX,mouseY,100,100);
    }
  }
}

void transCircle()
{
  if (keyPressed)
  {
    if (key == 'r')
    {
      for (count = 0; count < 500; count += 50)
      {
        stroke(250,250,250,250 - count);
        fill(250,250,250,5);
        ellipse(mouseX,mouseY,100 + count,100 + count);
      }
    }
  }
}

