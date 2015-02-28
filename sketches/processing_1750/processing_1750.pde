
/**
*    fjenett 20090418
*/

PImage scape;

void setup ()
{
    scape = loadImage( "scape.png" );
    
    size( scape.width*21, scape.height*21 );
    
    smooth();
}

void draw ()
{
    background( 255 );
    
    for ( int i = 0; i < scape.pixels.length; i++ )
    {
        int ix = (i % scape.width)*21;
        int iy = (i / scape.width)*21;
        
        float w = map( red( scape.pixels[i] ), 0, 255, 21, 0 );
        
        for ( int ii = 0; ii < w; ii++ )
        {
            float ww = map( ii, 0, w, 0, 21 );
            line( ix+ww, iy, ix+ww, iy+21 );
        }
    }
}


