
//ICE_5
//copyright Joanne Lo jylo 2014
float x, y, dx, wd, ht; 
color bgColor, ellipseColor;

void setup( ) 
{
size( 400, 400 ); 
background( 0 ); x = 0;
y = height/2;
wd = 39; 
ht = 29; 
dx = 1;
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
  fill (bgColor);
  rect(0,0,width,height);
}

void drawEllipse()
{
  fill(ellipseColor);
  ellipse(x,y,wd,ht);
}

void moveEllipse()
{
  x=x+dx;
  if(x>width)
  {
  dx=-dx;
  }
  else if (x<0)
  {
    dx=-dx;
}
}



