
int a[]=new int[5];
int x=1,y=1;
void setup()
{
  size(200,200);
  background(255);
}

void draw()
{
  background(255);
  fill(0);
  rect(0,0,20,height);
  rect(width-20,0,20,height);
  rect(0,height-20,width,20);
  fill(a[2],a[3],a[4]);
  rect(a[0]+30,a[1],20,20);
  rect(a[0]+60,a[1],20,20);
  rect(a[0]+90,a[1],20,20);
  rect(a[0]+120,a[1],20,20);
  rect(a[0]+150,a[1],20,20);
  if((mouseX<20&&mouseX;>0)||(mouseX>width-20&&mouseX;<width)||(mouseY>height-20&&mouseY;<height))
  {
    a[1]=(int)random(0,height-40);
    for(int i=2;i<5;i++)
    {
      a[i]=(int)random(0,256);
    }
  }
}
