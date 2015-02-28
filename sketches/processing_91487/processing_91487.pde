
//HW 8b: While Loop
//(c) Sunny Li 2013

int y, deltaY, deltaX;
void setup ( )
{
  size( 400, 400 );
  y = 15;
  deltaY = 50;
  deltaX = 25;
}

void draw( )
{
   whileLoop();
   y  = (y + deltaY ) % height;
}

void whileLoop( )
{
   int x =0;
   
   while (x <= width)
  {
    strokeWeight(random(10));
    stroke(random(255), random(255), random(255));
    line( x, y , width, y );
    x = x + deltaX;
  }
}
