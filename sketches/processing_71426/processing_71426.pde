
//Winston L, user_input_tank, CP1, Mods 4-5
//http://www.openprocessing.org/sketch/71426

int a=0;
int b=0;
int c=0;
int d=0;
int e=0;

/**
w = move up
a = move left
s = move down
d = move right
spacebar = shoot ball
r= reload
*/

void setup()
{
  size(400, 400);
  fill(255);
  rect(0, 0, 500, 500);
  frameRate(30);
}
void draw()
{
  fill(0);
  rect(0, 0, 500, 500);
  fill(230,220,0);
  ellipse(200+c, 240+d, 20, 20);
  fill(50, 100, 5);
  ellipse(200+a, 270+b, 80, 80);
  fill(70, 130, 5);
  ellipse(200+a, 270+b, 50, 50);
  fill(30, 65, 0);
  quad(190+a, 210+b, 190+a, 270+b, 210+a, 270+b, 210+a, 210+b);
  d=d+e;
  if (240+d>270+b)
  {
    d=b;
  }
  if (240+d<0)
  {
    ellipse(200+c, 240+d, 20, 20);
  }
}
void keyPressed()
{
  if (key=='a')
  {
    a=a-10;
    c=c-10;
  }
  if (key=='s')
  {
    b=b+10;
    d=d+10;
  }
  if (key=='d')
  {
    a=a+10;
    c=c+10;
  }
  if (key=='w')
  {
    b=b-10;
    d=d-10;
  }
  if (key==' ')
  {
    e=-30;
  }
  if (key=='r')
  {
    e=700;
  }
}
