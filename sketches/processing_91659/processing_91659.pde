
int[]posY={20,height/2,60,100,120};
int x=20,speed=2;
void setup()
{
  size(200,200);
background(0);

}




void draw()
{
  background(0);
  if(mouseX>20&&mouseX;<180&&mouseY;<180)
  {
    for(int i=0; i<posY.length;i++)
    rect(x,posY[i],10,10);
  }
  if(x<20 || x>180)
  {
    speed=speed*-1;
  }
  x=x+speed;

}
