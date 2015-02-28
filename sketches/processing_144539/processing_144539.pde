
//ICE #19 for April 15, 2013

// jpg practice
// Swapping colors

PImage pic;



void setup( )
{
  size( 640, 480 );
  pic = loadImage( "Flower1.jpg" );

}

void draw( )
{
   image( pic, 0, 0 );
} 

void keyPressed( )
{
   pic = loadImage( "Flower1.jpg" );
   pic.loadPixels( );
   float r, g, b;
   for ( int i = 0; i < pic.pixels.length; i++)
   {
      color c = pic.pixels[i];
      if ( key == '1' )
      {
        r = red (c); 
        g = green(c);
        b = blue (c);
        pic.pixels[i] = color (g,b,r);
 
      }
      else if ( key == '2' )
      {
        r = red (c); 
        g = green( c );
        b = blue (c); 
        pic.pixels [i] = color (b,r,g);
        
      }
      else if ( key == '3' )
      {
        r = red (c); 
        g = green (c);
        b = blue( c ); 
        pic.pixels [i] = color (b, g, r);
           
      }
    
      else
      {
        r = red( c ); 
        g = green( c );
        b = blue( c ); 
        pic.pixels[i] = color( r, g, b );      
      }
      
    
   }
   
   pic.updatePixels( );
}






