
int x=0;
int y=0;
int a=#D823CD;
int b=#F5DE0C;
int c=#1BE31D;
void setup()
{
  size(400,400);
  background(255);
}
void draw()
{
fill(a);
    a=a+b;
    stroke(c);
    frameRate(100);
    rect(x,y,20,20);
    x=x+10;
  if(x>width){
    x=-10;
     x=x+10;
     y=y+20;
  }
}
  
