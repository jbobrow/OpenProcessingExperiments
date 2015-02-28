
//HW 3 
//Copyright Yoni Afek, September 6th, 2011

color col; 

void setup( )
{ 
   smooth();
   background( 0 );
   size( 500, 500 );
   noStroke(); 
   col = color( random( 256), random( 256), random( 256), 20 );
   noCursor( );
}

// crazy translucent shape generator
void draw()
{
  col = color( random( 256), random( 256), random( 256), 30 );
  fill( col );
  quad(mouseX, mouseY, mouseX*2, mouseY*2,mouseX*4, mouseY/2, mouseX-mouseX*2, mouseY-mouseY*2);
 
}


// highlight/glow of the shape
void mousePressed()
{
  fill(250, 100);
  quad(mouseX, mouseY, mouseX*2, mouseY*2,mouseX*4, mouseY/2, mouseX-mouseX*2, mouseY-mouseY*2);
  
}


