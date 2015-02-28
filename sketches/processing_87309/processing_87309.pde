
//Hyun Woo Jo
//Copyrighted Hyun Woo Jo, Jan 2013

PImage sbg,bg;
float x, y, oldx, oldy, wd, ht, c;
void setup()
{
  
  size(450, 370);
  sbg = loadImage ("sbg.jpg");
  bg = loadImage ("bg.jpg");
  background(0);
  fill(255);
  textMode(CENTER);
  textSize(50);
  text("Click to Start", 80,200);

  wd = 2;
  ht = 2;
  noStroke();
  smooth();
  x=289;
  y=222;
}

void draw()
{

  fill(100);
  ellipse(oldx, oldy, wd, ht);
  fill(0);
  ellipse(x, y, wd, ht);
  oldx = x;
  oldy = y;

}

void mouseClicked()
{
  if (c==0)
  {
  image (sbg, 0, 0, 450, 370);
  c=c+1;
  } 
}

void keyPressed()
{
  if (key == 'd')
  {
    if (x<385)
    {
      x++;
    }
  }
  if (key == 'a')
  {
    if (x>65)
    {
      x--;
    }
  }
  if (key == 's')
  {
    if (y<295)
    {
      y++;
    }
  }
  if (key == 'w')
  {
    if (y>67)
    {
      y--;
    }
  }
  if (key == 'c')
  {
    image (bg, 0, 0, 450, 370);
  }
}



