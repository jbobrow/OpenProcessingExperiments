
/**
 *    fjenett 2009-05-07
 *    
 *    system für einen generativen font, 
 *    schrift-skelet von tobias tschense
 */

String input = "hello";
float spacing = 90;


void setup ()
{
    size( 700, 300 );
    colorMode( HSB );
}


void draw ()
{
    background( 255 );

    drawGenerativeText( input, 50, height/2 );
}


void rLine ( float x1, float y1, float x2, float y2 )
{
    stroke( 200, 50 );
    strokeWeight(30);
    line( random(-2,2)+x1, random(-2,2)+y1, random(-2,2)+x2, random(-2,2)+y2 );
    line( random(-2,2)+x1, random(-2,2)+y1, random(-2,2)+x2, random(-2,2)+y2 );
}



