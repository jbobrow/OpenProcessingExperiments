
void setup ()
{
    size( 800, 800 );
    background( 0 );
    loadPixels();
    int n = 0;
    for ( int y = 0; y < height; y++ )
    for ( int x = 0; x < width; x++ )
    {
        if ( x == 0 || y == 0 )
            n = 0;
        else
            n = pixels[( y - 1 ) * width + x - 1] + pixels[( y - 1 ) * width + x];
        pixels[y * width + x] = n;
    }
    updatePixels();
}

void draw ()
{
    
}
