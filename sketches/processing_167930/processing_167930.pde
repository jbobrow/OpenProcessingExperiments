
int x = 0;
int y= 0;
void setup()
{
  size(400,400);
  background(0);
}

void draw()
{
  fill(random(0, 255), random(0, 255), random(0, 255));
  rect(x,y,width/40,height/40);
  x=x+width/40;
  y=y;
 
if(x==height){
   y=y+height/40;
   x=-width/40;
  }
}
