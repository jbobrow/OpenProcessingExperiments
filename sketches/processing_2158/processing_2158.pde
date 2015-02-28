
/*
*    geomerative beispiele
*    http://www.ricardmarxer.com/geomerative/
*
*    fjenett 20090521
*/

import geomerative.*;    // import geomerative library


RShape schrft;
String input = "MANKERL";

void setup ()
{
    size( 600, 300 );
 
    RG.init( this );    // before using geomerative initialize it ..
    
    RFont fnt = RG.loadFont("mankerl.ttf");  // file name
    RG.textFont( fnt, 150 );   // RFont object, size
    schrft = RG.getText( input );  // String to RShape
    
    smooth(); // turn on anti-aliasing
}


void draw ()
{
    background( 120 );    // clear the background with medium grey
    
    //RG.setPolygonizer(RG.ADAPTATIVE);
    //RG.setPolygonizerAngle( map(mouseX, 0, width, 0, HALF_PI) );   // angle between 0.0 - HALF_PI
    
    RG.setPolygonizer(RG.UNIFORMLENGTH);
    RG.setPolygonizerLength( map(mouseX, 0, width, 0, 100.0) );    // length of segment
    
    //RG.setPolygonizer(RG.UNIFORMSTEP);
    //RG.setPolygonizerStep( map(mouseX, 0, width, 0, 10.0) );     // 0.0 - 1.0 = step length
                                                                   // >1.0 = number of steps
    
    translate( mouseX, mouseY );  // translate to mouse
    
    RPoint[][] paths = schrft.getPointsInPaths();
    
    if ( paths != null )
    {
        for ( int ii = 0; ii < paths.length; ii++ )
        {
            RPoint[] points = paths[ii];
            for ( int i = 1; i < points.length; i++ )
            {
                malWasDahin ( points[0].x, points[0].y, points[i].x, points[i].y );
            }
        }
    }
}


void malWasDahin ( float x1, float y1, float x2, float y2 )
{
   float r = random(1,30);
    line( x1, y1, x2, y2 );
    stroke(255);
    strokeWeight (0.5);
    //x1 += random( 5 );
    //line( x1, y1, x2, y2 );
}


void keyPressed ()
{
    if ( input != null && input.length() > 0 && (key == BACKSPACE || key == DELETE) )
    {
        input = input.substring( 0, input.length()-1 );
        schrft = RG.getText( input ); // everytime we remove or add a char we update the shape
    }
    else if ( key != CODED && ( key != BACKSPACE && key != ESC && key != DELETE ) )
    {
        input += key;
        schrft = RG.getText( input ); // everytime we remove or add a char we update the shape
    }
}

