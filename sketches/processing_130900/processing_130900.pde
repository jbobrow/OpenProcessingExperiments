
//ICE5
//copyright 2014 Hyun Doug Kim

float x, y, dx, wd, ht; 
color bgColor, ellipseColor; 
 
void setup( ) 
{ 
 size( 400, 400 ); 
 background( 0 ); 
 x = 0; 
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
  fill(bgColor); //needs background color declare before //careful of capital letters!!
  rect(0, 0, width, height); //setting up window
}

void moveEllipse()
{
  x+= dx; //needs to float dx //x= x+dx
  if (x>width)
  {
    dx=-dx;
  }
  else if (x<0)
  {
  dx= -dx;
  }
}

void drawEllipse()
{
  fill(ellipseColor); //need to have ellipsecolor assigned
  ellipse(x, y, wd, ht); //regular wd and ht drawing not preparing
}




