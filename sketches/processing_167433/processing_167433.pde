
float r=random(0,255), g=random(0,255), b=random(0,255);
int x, y;
void
setup()
{
  size(600,400);
  background(0);
}

void
draw()
{
  frameRate(6);
  fill(r,g,b);
  r=random(255,100);
  g=random(0,255);
  b=random(10,200);
  rect(x,y,width/8,width/8);
  x=x+width/8;
  y=y;
    if(x>=width){
      y=y+width/8;
      x=0;
    }
    else if(y>=height){
      background(0);
      x=0;
      y=0;
    }
}
