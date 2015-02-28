
int fx;
int fy;
int y;
int x;

void setup()

{
  size (600, 400);
}

void draw ()
{


  background (100);

  x=x+0;
  fill (10, 50, 250);
  rect (0, 0, 600, 200);





  if (x==0 || x==600)
  {
  x=x*-1;
  }


  if (key=='w')
  {
  y=y-4;
  fill (0,255,255);
  rect (0, 0, 600, 200);

}
  if (key=='s')
  {
  y=y+4;
  fill (255,255,0);
  rect (0, 0, 600, 200);

  }
  if (key=='a')
  {
  x=x-4;
  fill (100,255,0);
  rect (0, 0, 600, 200);

  }
  if (key=='d')
  {
  x=x+4;
  fill(255,0,255);
rect(0,0,600,200);
}

 
 
 
if (key==' ')
{
  x=0;
  y=0;
}
if (key=='r')

{ y=y-100
;}

if (key=='f')
{
  fill (255,0,0);
  rect(fx,fy,7,7);
  fx=fx+x+10;
  fy=y+330;
}
if (key=='f')
{
  fill (255,0,0);
  rect(fx,fy,7,7);
  fx=fx+x+x;
  fy=y+330;
}
ellipse (x,y+300,200,50);
  //deck
  fill (0, 0, 255);
  ellipse (x, y+308, 192, 42);
  //deck
  fill (255, 255, 255);


  ellipse  (x+60, y+330, 30, 30);
  //wheel
  fill(0, 0, 0);
  ellipse (x+60, y+332, 7, 7);
  fill(255, 255, 255);
  ellipse (x-50, y+330, 30, 30);
  //wheel
  fill(0, 0, 0);
  ellipse (x-50, y+332, 7, 7);
  fill (50, 50, 50);
  ellipse (x, y+300, 200, 50);
  //deck
fill (255,0,0);
  rect(fx,fy,7,7);

}

void mousePressed()

{
  y=y-50;
}
void mouseReleased()

{
 
  y=y+50;}
