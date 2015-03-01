
//Task 2A Extra
// Jim Roberts
// Copyright July 2014 Pittsburgh, PA 15221

// Easing

float x, x1, y, wd, ht, xDif, yDif, easingCoefficient;

void setup( )
{
   size( 400, 400 );
   rectMode( CENTER );
   wd = 140;
   ht = 100;
   easingCoefficient = .05;
}

void draw( )
{
   //background( 255, 255, 0  );
   fill( 255, 255, 0, 10 );
   rect( width*.5, height*.5, width, height );
   xDif = mouseX - x;
   yDif = mouseY - y;
   
   x = x + (easingCoefficient * xDif );
   y = y + (easingCoefficient * yDif );
   stroke( 0 );
   strokeWeight( 3 );
   fill( 255 );
   ellipse( x, y, wd, ht ); 
   fill( 0 );
   ellipse( x, y, wd, ht-ht*.6 );
   noStroke( );
   
   if ( frameCount % 240  < 200 )
   {
      fill( 255 );
      ellipse( x, y, wd*.35, ht*.35 );
   }
   
   x1 = x + wd + 20;
   stroke( 0 );
   strokeWeight( 3 );
   fill( 255 );
   ellipse( x1, y, wd, ht ); 
   fill( 0 );
   ellipse( x1, y, wd, ht-ht*.6 );
   noStroke( );
   
   if ( frameCount % 240  < 200 )
   {
      fill( 255 );
      ellipse( x1, y, wd*.35, ht*.35 );
   }
}


