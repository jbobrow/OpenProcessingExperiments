
// Keana Moezzi, CP1 modes 4-5, User Input 
// url: http://ilovestarsandsmiles.webs.com/

float r=255;
float g=255;
float b=0;
int x=0;

void setup()
{ 
  size(500, 500);
  background(0);
  fill(224, 102, 255);
  smooth();
}
void draw()
{
  if (mousePressed == true && mouseButton == RIGHT)
  {
    fill (r, g, b);
    ellipse(mouseX, mouseY, 30, 30);
    r=r-1;
    if (r<0)
    {
      r= 255;
    }
    b=b+1;
    if (b>255)
    {
      b=0;
    }
  }
}
void mouseDragged()
{
  if (mouseButton==LEFT)
  {
    rect(mouseX, mouseY, 30, 30);
  }
  if (mouseButton==RIGHT)
  {
    ellipse(mouseX, mouseY, 30, 30);
    ellipse(500-mouseX, mouseY, 30, 30);
  }
}


void keyPressed()
{
  if (key=='r')
  {
    while (x<500)
    {
      stroke(r, g, b);
      ellipse(x, x, 30, 30);
      ellipse(500-x, x, 30, 30);
      x=x+1;
      r=r+ (255-255)/500.0;
      g=g+ (20-255)/500.0;
      b=b+ (147-0)/500.0;
    }

  }
  if (key=='g')
  { 
    fill(0, 255, 0);
  }
  if (key=='b')
  { 
    fill(0, 191, 255);
  }
  if (key=='y')
  {
    fill(255, 255, 0);
  }
  if (key=='p')
  {
    fill(255, 20, 147);
  }
  if (key=='c')
  {
    background(0,0,0);
  }
}
