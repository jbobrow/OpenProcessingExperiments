
//ROWAN CASSIUS, CP1, B7
float x=0;
float y=0;
int y1=0;
int x1=0;
int lef=0;
int righ=225;
float changX=1.2;
float changY=0.7;
int thedot=225;
void setup()
{
  size (500,500);
  smooth();
  background(0,0,0);
  frameRate(100);
}
void draw()
{
  noStroke();
  fill(lef,lef,lef,60);
  rect(0,0,125,125);
  rect(0,250,125,125);
  rect(250,0,125,125);
  rect(125,125,125,125);
  rect(125,375,125,125);
  rect(375,125,125,125);
  rect(250,250,125,125);
  rect(375,375,125,125);
  fill(righ,righ,righ,60);
  rect(0,125,125,125);
  rect(0,375,125,125);
  rect(125,0,125,125);
  rect(125,250,125,125);
  rect(250,125,125,125);
  rect(250,375,125,125);
  rect(375,0,125,125);
  rect(375,250,125,125);
  fill(thedot);
  ellipse(x,y,15,15);
  x=x+changX;
  y=y+changY;
  if(x>495)
  {
    changX=-changX;
    x1++;
  }
  if(x<5 && x1!=0)
  {
    changX=-changX;
  }
  if(y>495)
  {
    changY=-changY;
    y1++;
  }
  if(y<5 && y1!=0)
  {
    changY=-changY;
  }
  if(x>125 && x<250 && y>375 && y<500||x>0 && x<125 && y>0 && y<125||x>125 && x<250 && y>125 && y<250||x>0 && x<125 && y>250 && y<375||x>125 && x<250 && y>375 && y>500||x>250 && x<375 &&y>0 && y<125||x>250 && x<375 && y>250 && y<375||x>375 && x<500 && y>125 && y<250||x>375 && x<500 && y>375 && y<500)
  {
    thedot=225;
  }
  else
  {
    thedot=0;
  }
}
