
/**
 *    fjenett 20090418
 */

PImage scape;

void setup ()
{
    scape = loadImage( "scape.png" );

    size( (scape.width-1)*7, (scape.height-1)*7 );

    noStroke();
    smooth();
}

void draw ()
{
    background( 255 );

    float xo = 0;

    for ( int i = 0; i < scape.pixels.length; i++ )
    {
        int ix = i % scape.width;
        int iy = i / scape.width;

        fill( scape.pixels[i] );

        if ( (iy % 2) == 0 )
        {
            xo = 0;
        }
        else
        {
            xo = 3.5;   
        }

        raute( ix*7 + xo, iy*7, 7, 14 );
    }
}


void raute ( float  x, float y, float b, float h )
{
    beginShape();

    vertex( x, y - h/2 );
    vertex( x + b/2, y );
    vertex( x, y + h/2 );
    vertex( x - b/2, y );

    endShape( CLOSE );   
}


