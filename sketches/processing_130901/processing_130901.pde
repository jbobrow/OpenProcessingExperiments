
//ICE5
//©Scott Alberstein 2014

float x, y, dx, wd, ht; 
color bgColor, ellipseColor; 
 
void setup( ) 
{ 
 size( 400, 400 ); 
 background( 0 ); 
 x = 20; 
 y = height/2; 
 wd = 40; 
 ht = 40; 
 dx = 3; 
 
 bgColor = color( 0, 10 ); 
 ellipseColor = color(255, 0, 0 ); 
 noStroke ( ); 
} 
 
void draw( ) 
{ 
 prepareWindow( ); 
 moveEllipse( ); 
 drawEllipse( ); 
} 

void prepareWindow()
{
  fill(0, 0, 0, 30);
  rect(0, 0, width, height);
}

void drawEllipse()
{
  fill(250);
  ellipse(x, y, wd, ht);
}

void moveEllipse()
{
  x = x+dx;
  if (x > width - wd/2)
  {
    dx = -dx;
  }
  else if (x < wd/2)
  {
    dx = -dx;
  }
}


