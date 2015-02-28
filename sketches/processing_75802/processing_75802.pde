
int sizeX=50;
int sizeY=50;
int x=0;
int y=0;
int f=1;
int lim=1;
void setup ()
{
  size(500, 500);
  frameRate(f);
  background(0);
      
}
void draw ()
{
  background(0);
  int num=0;
  if (key=='s')
  { 
    int s=0;
    f=5;
    while(num<lim)
    { 
      
      x=int(random(0, 350));
      y=int(random(0, 350));
      sizeX=int(random(20, 150));
      sizeY=int(random(20, 150));
      s=int(random(1, 3));
      if (s==1)
      {
        fill(y, x, 0, 150);
        rect(x, y, sizeX, sizeY);
     
      }
        
    else if (s==2)
      {
        fill(0, y, x, 150);
        ellipse(x, y, sizeX, sizeY);
        
      }
      num=num+1;
    }
    if (num>=lim && lim<=4096)
    {
      lim=lim*2;
    }
    else
    {
      lim=1;
    }
    fill(sizeX,sizeY,x);
    text(num,400,450);
  }
    else
  {
    textSize(35);
    textAlign(CENTER);
    fill(95,80,0);
    text("press s to start",200, 150);
  }
}
