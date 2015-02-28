
float [ ] x ={ 50, 100, 150, 200, 250, 300, 350  };
float [ ] y = { -22, -22, -22, -22, -22, -22, -22};
float [ ] deltay= { 4, 5, 6, 6, 7, 7, 8 };
float diam = 40;
color [ ] col = {
                color( 255, 0, 0 ),
                color( 0, 255, 0 ),
                color( 0, 0, 200 ),
                color( 200, 200, 0 ),
                color( 200, 0, 200 ),
                color( 0, 200, 200 ),
                color( 100 )
                };
void setup()
{
     size( 400, 400 );  
   smooth( );
   rectMode( CENTER );
   noStroke( );
}

void draw()
{
    drawBackground( ); 
    drawLines( );
    drawFigures( );
    moveFigures( );    
    drawBars( );   
}

void drawBackground( )
{
    background( 0, 200, 0 );
    fill( 200, 0, 0 );
    rect( width/2, height*.165, width, height*.33 );
    rect( width/2, height*.835, width, height*.33 );
}

void drawBars( )
{
   fill( 0 );
   rect( width/2, height*.33, width, diam );
   rect( width/2, height*.67, width, diam );
}

void drawFigures( )
{ 
  for (int i=0; i<x.length; i++)
{
  fill (col[i]);
  if            (y[i]>height*.33 && y[i]<height*.67)
                rect(x[i],y[i],diam, diam);
  else 
                ellipse(x[i],y[i],diam, diam);
}
}

void moveFigures( ) 
{
  for (int i=0; i<x.length; i++)
  {
    y[i]=y[i]+deltay[i];
    if (y[i]>height || y[i]<0-20 )
    deltay[i]=-deltay[i];
  }
}

void drawLines()
{
  stroke (0,255);
  for (int i=1; i<x.length; i++)
  {
    int z=i-1;
    line (x[i], y[i], x[z],y[z]);
  }
}


