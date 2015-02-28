
float x = 0;

void setup()
{
  size(500, 500); 
}

void draw()
{
  if (keyPressed == true)
  {
    if (key == 'a')
    {
      println("a pressed");
    }
    if (keyCode == RIGHT)
    {
      x += 10;
    }
    if (keyCode == LEFT)
    {
      x -= 10;
    }
  }
  
  ellipse(x, mouseY, 100, 100);
}

void keyReleased()
{
  if (key == 'a')
  {
    println("a released");
  }
  if (key == ' ')
  {
    println("SPACE BAR");
  }
  if (key == CODED)
  {
    if (keyCode == UP)
    {
      fill(random(255), random(255), random(255));
    }
  }
}

void keyPressed()
{
  println("key pressed 2");
}

void mousePressed()
{
  if (mouseButton == LEFT)
  {
    println("mouse pressed");
  }
}

void mouseReleased()
{
  if (mouseButton == CENTER)
  {
    println("mouse center released");
  }
}


