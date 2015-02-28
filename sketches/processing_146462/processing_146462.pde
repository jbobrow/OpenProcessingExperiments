

float [ ] x ={ 30,  100,  70,  200,  230,  320,  340, };
float [ ] y = { 30, 60, 200, 300, 280, 40, 360 };
color [ ] col = {
                color( 255, 0, 0 ),
                color( 0, 255, 0 ),
                color( 0, 0, 200 ),
                color( 200, 200, 0 ),
                color( 200, 0, 200 ),
                color( 0, 200, 200 ),
                color( 100 )
                };
float size = 10;

void setup( )
{
   size( 400, 400 );  
   rectMode( CENTER );
   noStroke( );
}

void draw( )
{
    drawFigures( );
    size = size + 1;
}

void drawFigures( )
{
  for ( int i=0; i< x.length; i++ )
  {
    fill( col[i] );
    rect ( x[i], y[i], size, size );
  }
}  

void mousePressed()
{
  if(mouseButton == LEFT);
  {
    background (200);
    size = 10;
  }   
}




