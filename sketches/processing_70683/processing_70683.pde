
int y1=600;
int y2=0;
int change=1;
int change2=-1;
int change3=1;
int diameter=0;
int change4=255;
int change5=-1;
int change6=255;
int a=0;
int b=0;
int c=0;
int d=0;
int a1=-1;
int b1=1;
int c1=1;
int d1=1;
int scott=0;
int scott2=255;
int bang=-1;
int blink=0;
void setup()
{
  size(600, 600);
  background(0, 0, 0);
}
void draw()
{
  whitebeam();
  happy();
  fill(0, 0, 0, 20);
  stroke(0, 0, 0);
  rect(0, 0, 600, 600);
}
void whitebeam()
{
  smooth();
  strokeWeight(5);
  stroke(change4, 0, change6);
  fill(change4, 0, change6);
  ellipse(y1, y2, 0+diameter, 0+diameter);
  y1=y1+change2;
  y2=y2+change;
  diameter=diameter+change3;
  change4=change4+change5;
  change6=change6-change5;
  if (y2>300)
  {
    change5=1;
  }
  if (y2<300)
  {
    change5=-1;
  }
  if (y2>600)
  {
    change=-1;
  } 
  if (y1>300)
  {
    change3=-1;
  }
  if (y1<300)
  {
    change3=1;
  }
  if (y1<0)
  {
    change2=1;
  }
  if (y2<0)
  {
    change=1;
  }
  if (y1>600)
  {
    change2=-1;
  }
  fill(0, 0, 0);
  stroke(0, 0, 0);
  ellipse(-30+y1, -30+y2, 30, 45);
  ellipse(30+y1, -30+y2, 30, 45);
  bezier(-80+y1, 70+y2, -50+y1, 30+y2, 50+y1, 30+y2, 80+y1, 70+y2);
}
void happy()
{
  stroke(scott, 0, scott2);
  fill(scott, 0, scott2);
  ellipse(a, b, c, d);
  scott=scott-bang;
  scott2=scott2+bang;
  a=a-a1;
  b=b+b1;
  c=c+c1;
  d=d+d1;
  if (b>600)
  {
    a1=-1;
  }
  if (a>300)
  {
    c1=-1;
    d1=-1;
    bang=1;
  }

  if (a<300)
  {
    c1=1;
    d1=1;
    bang=-1;
  }
  if (a>600)
  {
    a1=1;  
    b1=-1;
  }
  if (a<0)
  {
    a1=-1;
    b1=1;
  }
  fill(0, 0, 0);
  stroke(0, 0, 0);
  ellipse(-30+a, -30+b, 30, 45-blink);
  ellipse(30+a, -30+b, 30, 45);
  bezier(-90+a, 50+b, -50+a, 100+b, 50+a, 100+b, 90+a, 50+b);
  if (a<=200)
  {
    blink=0;
  }
  if (a==300)
  {
    blink=45;
  }
  if (a>=400)
  {
    blink=0;
  }
  frameRate(200);
}



