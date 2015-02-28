
int speed=1;
int x=0;
int y=0;
void setup()
{
  size(200,200);
}
void draw()
{
  //frameRate(10);
  shape(mouseX,mouseY);
}
void shape(float a,float b)
{
  background(255,255,255);
  if(((a-width/2>10||a-width/2<-10))&&((b-height/2>10)||(b-height/2<-10)))
  {
    if(x+20<=width&&y+20<=height&&x>=0&&y>=0)
    {
      speed=speed*1;
    }
    else
    speed*=-1;
    x+=speed;
    y+=speed;
    fill(255,0,0);
    rect(x,y,20,20);
    fill(255,255,0);
    rect(x+5,y,10,20);
    fill(0,0,255);
    ellipse(x/8,y/8,2,2);
    ellipse(x/4,y/4,4,4);
    ellipse(x/2,y/2,6,6);
    line(0,0,x,y);
    int m=width-x-20;
    int n=height-y-20;
    line(x+20,y+20,width,height);
    ellipse((x+40)+m*0.625,(y+40)+n*0.625,4,4);
    ellipse((x+40)+m*0.75,(y+40)+m*0.75,2,2);
    ellipse((x+20)+m/2,(y+20)+m/2,6,6);
  }
}
    

