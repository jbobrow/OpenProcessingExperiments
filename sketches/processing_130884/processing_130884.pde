
// copyright 2014 Jacklynn Pham
// ICE 5 Week 3

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

void moveEllipse()
{
    x +=dx; // x = x + dx
    if ( x > width )
    {
        x = 0;
    }
}

void drawEllipse()
{
  fill(200,0,0);
  ellipse(x,y,wd,ht); 
}

void prepareWindow()
{
  fill (0, 20);
  noStroke();
  rect(0,0, width, height);
}




