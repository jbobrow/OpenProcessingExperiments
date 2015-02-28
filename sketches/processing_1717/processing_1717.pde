

// http://en.wikipedia.org/wiki/Bridget_Riley

size( 300, 300 );

smooth();
noStroke();

boolean flipflop = false;
int step = 15;

for ( int r = width; r >= 0; r-=step )
{
    // flip fill color
    if ( flipflop )
        fill ( 0 );
    else
        fill( 255 );
    
    flipflop = !flipflop;
    
    // dislocate the circle in x direction
    float r_radians = map( r, width,0, TWO_PI*2,0 );
    float x = sin( r_radians ) * step;
    ellipse( x + width/2,height/2, r,r );
}

