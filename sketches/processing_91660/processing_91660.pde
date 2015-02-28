
int posX[]={40,70,100,130,160};
int i=0;
void setup()
{
  background(255);
  size(200,200);
  fill(0);
  rect(0,0,20,height);
  rect(width-20,0,20,height);
  rect(0,height-20,width,20);
}
void colour()
{
  if(mouseX<20&&mouseX;>0&&mouseY;<height-20&&mouseY;>0)
  {
   fill(255,0,0,(i+1)*1);
  }
  if(mouseX>width-20&mouseX;<width&&mouseY;<height-20&&mouseY;>0)
  {
   fill(0,255,0,(i+1)*2);
  }
  else if(mouseX>0&&mouseX;<width&&mouseY;>height-20&&mouseY;<height)
  {
  fill(0,0,255,(i+1)*3);
  }
}
void draw()
{
  fill(255);
  smooth();
  for(i=0;i<5;i++)
  {
    colour();
    ellipse(posX[i],height/2-20,20,20);
  }
}
