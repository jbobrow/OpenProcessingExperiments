
//Stephanie Wong mods:14-15 fun and animations
//STPrograms.webs.com
int c=1;
int cc=7;
void setup()
{
  size(300,300);
  noFill();
  background(0);
  frameRate(200);
}
void draw()
{
  stroke(180,1+cc,1+c);
  strokeWeight(1);
  c=c+1;
  cc=cc+2;
  int x=20;
while(x<300)
{
  int y=20;
  while(y < 300)
  {
    line(x,y,150,150);
    y=y+6;
  }
  x=x+6;
}
  fill(252,245,5);
  ellipse(155,150,70,70);
}
