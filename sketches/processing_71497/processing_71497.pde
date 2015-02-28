
// Lucky Wen, User Input, CP1 mods 16-17

int x=10;
int y=10;
int r= 1;
int t=1;



void setup()
{
  size(700, 700);
  background(197);
  smooth();
}
void draw()
{
  fill(0, 0, 0, 10);
  rect(0, 0, 700, 700);
}
void mouseDragged()
{

  if (mouseButton==LEFT)
  {
    frameRate(45);
    fill(255, 0, 0);
    stroke(0, 0, 0);
    strokeWeight(5);
    ellipse(mouseX, mouseY, 10+x, 10+y);
    ellipse(700-mouseX, mouseY, 10+x, 10+y);
    ellipse(700-mouseX, 700-mouseY, 10+x, 10+y);
    ellipse(mouseX, 700-mouseY, 10+x, 10+y);
    x=x+5;
    y=y+5;
  }
  {
    if (x==100)
    {
      ellipse(mouseX, mouseY, 100-x, 100-y);
      ellipse(700-mouseX, mouseY, 100-x, 100-y);
      x=-x;
      y=-y;
    }
  }
  {
    if (mouseButton== RIGHT)
      stroke(125);
    strokeWeight(2);
    noFill();
    ellipse(mouseX, mouseY, 20+r, 20+t );
    ellipse(700-mouseX, 700-mouseY, 20+r, 20+t );
    r=r+3;
    t=t+3;
    { 
      if (r>100)
      {
        r=1;
        t=1;
      }
    }
  }
}
void keyPressed()
{
  if (key=='c');
  {
    background(197);
  }
}
