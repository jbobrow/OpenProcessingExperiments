
/**
*    geomerative examples
*    http://www.ricardmarxer.com/geomerative/
*
*    fjenett 20090514
*/

import geomerative.*;    // import library

RShape form;

void setup ()
{
    size(500, 500);
    background (0);
    
    RG.init( this );     // initialize library
    
    form = RG.loadShape("xyz.svg");  // load SVG
 
    
    smooth();
}

void draw ()
{
    translate( mouseX, mouseY );    // place at mouse-pointer
       if ( mousePressed )   // wahr wenn die mouse in diesem moment gedrückt ist
        {
         
            stroke( random( 200 ), random( 200 ), random( 200 ) );      // eine zufällige farbe
        
       
        }
     RShape shp = new RShape(form);
      RPoint[] points = shp.getHandles(); 
    
    for ( int i = 0; i < points.length; i++ )
    {
        float r = 5 ;//random(1,10);
        strokeWeight(1);
        fill (0);
        rect( points[i].x,points[i].y, r,r );
    }
    RG.ignoreStyles( );  // if mousePressed ignore styles

        
    form.draw(); }   // draw shape


