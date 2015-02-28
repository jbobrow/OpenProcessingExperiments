
//Eugene Liang, Ticklish Penguin, CP1, Mods 16-17


void setup()
{
  size(700,700);
  background(0);
}

int x = 350;
int y = 350;
int r = 255;
int b = 255;
int g = 255;
void draw()
{
  if (mousePressed == true)
  {
  noStroke();
  fill(random(r),random(b),random(g));
  if (keyPressed == true && key == 'r')
  {
    r = 0;
  }
  if (keyPressed == true && key == 'b')
  {
    b = 0;
  }
  if (keyPressed == true && key == 'g')
  {
    g = 0;
  }
  if (keyPressed == true && key == '1')
  {
    r = 255;
    g = 255;
    b = 255;
  }
  if (keyPressed == true && key == '2')
  {
    x = 350;
    y = 350;
  }
  if (keyPressed == true && key == '3')
  {
    background(0);
    x = 350;
    y = 350;
    r = 255;
    g = 255;
    b = 255;
  }
  ellipse(x,y,random(25,100),random(25,100));
  x = x + int(random(-35,35));
  y = y + int(random(-35,35));
  }
}
