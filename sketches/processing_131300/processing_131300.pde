
//Kristen Chon Copyrights HW #6
float x, y, diam, speed,speedY;
float x2, y2, diam2, speed2, speed2Y;


void setup( ) 
{ 
  size( 400, 400 ); 
  background( 0 ); 
  
  //first figure
  x = 0; 
  y = 0;
  diam = 40;
  speed=10;
  speedY=2;
  
  //second fiure
  x2=0;
  y2=380;
  diam2=20;
  speed2=5;
  speed2Y=2;
  
  x=x+speed;
  
} 

  void draw()
{
  prepWindow();
  moveFigures();
  drawFigures();
}


void prepWindow()
{
  fill(120, 120, 120, 40);
  rectMode(CENTER);
  rect (200, 200, width, height);
}

void figure(float x, float y, float diam, float speed)
{
  noStroke();
  ellipse(x, y, diam, diam);
}

void drawFigures()
{
  noStroke();
  ellipseMode(CENTER);
  fill (22, 239, 245);
  figure(x, y, diam, speed);
  fill(random(20), random(200), random(200));
  figure(x2, y2, diam2, speed2);
  
}

void moveFigures() 
{
  //Figure 1 movement
  x=x+speed;
  y=y+speedY;
  if (x>width-diam/2)
  {
    speed=0;
    speedY = 1;
}
  y=y+speedY;
  x=x+speed;
  if (y> height-diam/2)
  {
    speedY=0;
    speed = -1;
}
  x=x+speed;
  y=y+speedY;
  if (x< 0+diam/2)
  {
    speed=0;
    speedY=-1;
  }
  y=y+speedY;
  x=x+speed;
  if (y < 0 +diam/2)
  {
    speedY=0;
    speed = 1;
  }
  
  //Figure movement 2
  x2=x2+speed2;
  y2=y2+speed2Y;
  if (x2>width-diam2)
  {
    speed2=0;
    speed2Y = 2;
}
  y2=y2+speed2Y;
  x2=x2+speed2;
  if (y2> height-diam2)
  {
    speed2Y=0;
    speed2 = -2;
}
  x2=x2+speed2;
  y2=y2+speed2Y;
  if (x2< 0+diam2)
  {
    speed2=0; 
    speed2Y=-2;
  }
  y2=y2+speed2Y;
  x2=x2+speed2;
  if (y2<0+diam2)
  {
    speed2Y=0;
    speed2 = 2;
  }
  
  
  
  
  
 
}


