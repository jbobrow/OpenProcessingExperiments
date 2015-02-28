
//Jeffrey Chen  Loops Assignment 4-5 Computer Programming 1
//URL: jeffmao.webs.com
size(1000,1000);
smooth();


int x=250;
int u=250;
while (x<1000)
{
  int y=500;
  while(y>0)
  {
    strokeWeight(2);
    ellipse(250,250,y,y);
    fill(500-y,y/3,y-350,750-y);
    y=y-15;
  }
  int c=2;
  int t=255;
  while(c<500)
  {
    ellipse(x,u,c,c-500);
    fill(c-250,20000/c,500-c,t);
    c=c+10;
    t=t-15;
  }
  x=x+250;
  u=u+250;
}
