
/* @pjs globalKeyEvents= "true"; */

int x=250;
int y=250;
PImage b;
PImage k;
PImage r;

void setup()
{
  size(500, 500);
  noStroke();
  frameRate(8);
  b= loadImage("http://www.priscillaaaaa.webs.com/icecream2.png");
  k= loadImage("http://www.priscillaaaaa.webs.com/Caillou.png");
}

void draw()
{
  background(149,224,250);
  fill(9,147,40);
  ellipse(250,475,650,200);
  image(k,150,175,1921/10,2613/10);
  image(b,500-x,500-y, 318/6.5, 593/6.5);
  if (mousePressed==true)
  {
    int direction= int(random(-3,3));
    if(direction==-2)
    {
      x=x+7;
    }
    else if (direction==-1)
    {
      x=x-7;
    }
    else if (direction==0)
    {
      y=y-7;
    }
    else
    {
      y=y+7;
    }
  }
  keyPressed();
}

void keyPressed()
{
  if (key== 'r')
  {
    x=250;
    y=250;
    image(b,500-x,500-y,318/6.5,593/6.5);
  }
}
