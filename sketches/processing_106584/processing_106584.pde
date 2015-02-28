
int x=30;
int y=30;
int dx=0;
int dy=0;
 
void setup()
{
 size(300,400);
}
 
void draw()
{
  ellipse(x,y,20,20);
  fill(255,255,0);
  rect(100,100,20,200);
  if(key=='d')
  {
   x=x+1;
  }
  if(key=='s')
  {
   y=y+1;
  }
 
  if(key=='w')
  {
  y=y-1
  }
  if(key=='a')
  {
   x=x-1
  }
  x=x+dx;
  y=y+dy; 
}
