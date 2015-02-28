
//Scott Bang, mods 14-15, Animation, CP1

int x=0;
int y=0;
int y2=400;
int y3=10;
int change=1;
int move=1;
int high=10;
int low=0;
int boom=5;
int corn=390;
int pick=0;
int call=5;
void setup()
{
  size(400,400);
  background(0,0,0);
}
void draw()
{
  whitesun();
  coolio();
  repeat();
  othersun();
  fill(0,0,0,15);
  rect(0,0,400,400);
}
  void coolio()
  {
  stroke(255,255,255);
  fill(255,255,255);
  ellipse(x,y,10,10);
  x=x+move;
  y=y+1;
  if(y>400)
  {
    background(0,0,0);
    y=10;
  }
  if(x<200)
  {
    move=move+1;
  }
  if(x>200)
  {
    move=move-1;
  }
}
void whitesun()
{
   ellipse(200,y2,y3,y3);
   y2=y2-change;
   y3=y3+change;
   if(y3>400)
   {
     change=-1;
   }
   if(y3<0)
   {
     change=1;
   }
}
void repeat()
{
  frameRate(30);
  fill(240,245,12);
  ellipse(high,low,20,20);
  high=high+boom;
  low=low+boom;
  if(high>400)
  {
    boom=-5;
  }
  if(low>400)
  {
    boom=-5;
  }
  if(high<0)
  {
    boom=5;
  }
  if(low<0)
  {
    boom=5;
  }
}
void othersun()
{
  ellipse(corn,pick,20,20);
  corn=corn-call;
  pick=pick+call;
  if(corn<0)
  {
    call=-5;
  }
  if(corn>400)
  {
    call=5;
  }
  if(pick<0)
  {
    call=5;
  }
  if(pick>400)
  {
    call=-5;
  }
}
