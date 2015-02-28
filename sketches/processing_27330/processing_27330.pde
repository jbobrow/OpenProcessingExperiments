
int startX=20;
int stopX=160;
int startY=30;
int stopY=80;
float x=startX;
float y=startY;
float step=0.005;
float pct=0.0;
float  xs=stopX;
float  ys=stopY;
void setup()
{
  size(240,120);
  smooth();
}
void draw()
{
  background(0);
  if(pct<1.0) // if there are no 200 steps then do this
  {         
    x=startX+((stopX-startX)*pct);  // x = 20+((160-20)*0.005) x=20+0.7
    y=startY+((stopY-startY)*pct);  // x = 30+((80-30)*0.005)  y=30+0.25
  }
  else // if there are 200 steps then do this   
  {
    x=stopX-((stopX-startX)*pct); // x=160-((160-20)*0.005)  x=160-0.7
    y=stopY-((stopY-startY)*pct); // x=80-((80-30)*0.005)    y=80-0.25
  }
  pct=pct+step;
  ellipse(x,y,20,20);
}

//BUG....               
