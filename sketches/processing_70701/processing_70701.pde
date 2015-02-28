
//Michael H. Block 7 CP1
//Functions and Animation 

int diameter=250;
int y=250;
int ychange=1;
int change=1;
int x=250;
int xchange=1;
int z=200;
int zchange=1;

void setup()

{
  size(500,500);
  background(0);
  frameRate(200);
  smooth();
}


void draw()
{ 
  
  ellipse(255,255,255,255);
  stroke(255,0,0);
  fill(255,0,0);
  ellipse(diameter,y,30,30);
  stroke(0,0,255);
  fill(0,255,0);
  ellipse(255,260,50,70);
  stroke(255,255,255);
  fill(0,255,0);
  ellipse(210,210,50,50);
  ellipse(300,210,50,50);
  stroke(0,255,0);
  fill(255,255,255);
  ellipse(250,x,10,10);
   x=x+xchange;
  if (x>500)
  {
    xchange=-1;
  }
 if (x<250)
  {
   xchange=1;
  } 
  
  diameter= diameter+change;
  y= y+ychange;
  if (diameter>350)  
  {
    change=-1;
  }
  if (diameter<180)
  {
    change=1;
  }    
  if (y>300)
  {
    ychange=-1;
  }
  if (y<50)
  {
   ychange=1;
  }
}
