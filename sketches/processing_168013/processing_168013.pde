
int x=0;
int y=0;
int a=#109BC4;
int b=#C4104F;
void setup() 
{
  size(400,400);
   background(0);
}
void draw()
{
  frameRate(10);
   fill(a+b);
   a=a+b;
  rect(x,y,width/20,width/20);
  x=x+20;
  y=y;
  if(x>=width) {
    x=0;
    y=y+width/20;
}
else if(y>=height) {
  background(0);
  x=0;
  y=0;
}
}
