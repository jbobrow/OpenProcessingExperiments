
//Task 2A
// Jim Roberts
// Copyright July 2014 Pittsburgh, PA 15221

// Easing

float x, y, wd, ht, xDif, yDif, easingCoefficient;

void setup( )
{
   size( 400, 400 );
   wd = 50;
   ht = 50;
   easingCoefficient = .1;
   noStroke( );
}

void draw( )
{
   fill( 0, 10  );
   rect(0, 0, width, height );
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   xDif = mouseX - x;
   yDif = mouseY - y;
   
   x = x + (easingCoefficient * xDif );
   y = y + (easingCoefficient * yDif );
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   fill( 255 );
   //ellipse( x, y, x-y, y-x );
   ellipse( x, y, wd, ht );
}


