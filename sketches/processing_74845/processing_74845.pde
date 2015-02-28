
boolean  back=false;
boolean start=true;
int textX=150;
int sizeX=50;
int sizeY=50;
int x=0;
int y=0;
int num=1;
void setup ()
{
  size(350, 370);
  frameRate(7);
}
void draw ()
{
  if (back==false)
  {
    background(0);
  }
  if (key=='s')
  { 
    back=true;
    start=false;
    int s=0;
    if (num<100)
    {
      num=num+1;
      x=int(random(0, 301));
      y=int(random(0, 300));
      sizeX=int(random(20, 150));
      sizeY=int(random(20, 150));
      s=int(random(1, 3));

      if (s==1)
      {
        fill(y, x, 0, 150);
        rect(x, y, sizeX, sizeY);
        println(num);
      }
      else if (s==2)
      {
        fill(0, y, x, 150);
        ellipse(x, y, sizeX, sizeY);
        println(num);
      }
    }
  }
  else if (start==true)
  {
    
    textAlign(CENTER);
    
    fill(textX, 255, 0);
    textSize(45);
    text("press s to start", textX, 150);
    if (textX<350)
    {
      textX=textX+25;
    }
    else
    {
      textX=0;
    }
  }
}
