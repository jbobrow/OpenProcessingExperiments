
//Delwin Lei
//Right and left click on mouse for different color. Find the rest
//out by yourself noob!



int x, y;
boolean b,c;

void setup()
{
  size (600, 800);
  noStroke();
}

void draw()
{
  fill(0, 5);
  rect(-10, -10, 900, 900);
  println(frameRate);
  for (int a=0; a<mouseY; a++) {
    fill(255);
    if (b)
    {
      fill(#8FBBF0);
    }
    if (c)
    {
      fill(#FF587F);
    }
    ellipse(x+random(width), y+random(height), 20, 20);
  }
}


void mousePressed()
{
  if (mouseButton == LEFT)
  {
    b = true;
  }
  if(mouseButton == RIGHT)
  {
    c = true;
  }
}

void mouseReleased()
{
  b = false;
  c = false;
}



