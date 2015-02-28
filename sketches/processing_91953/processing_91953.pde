
// Set 10
// drawing  2 while loop

int y, deltaY, deltaX, dia;
void setup ( )
{
  size( 400, 400 );
  dia = 15;
  y = 15;
  deltaY = 90;
  deltaX = 10;
}

void draw( )
{
  if (keyPressed == true)
    {drawOne( );} 
   else
   {drawTwo();}
}

void drawOne( )
{
   y  = (y + deltaY ) % height;
   
   int x =10;
  
   while (x < width )
  {
    rect( x, y , dia, dia );
    x = x + deltaX;
  }
}

void drawTwo()
{
   ellipse(mouseX,mouseY, mouseX, mouseY);
    
  
}

void keyPressed( )
{
   fill( random( 255), random( 255 ), random( 255 ) );
}


