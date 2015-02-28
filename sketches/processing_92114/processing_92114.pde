
void setup()
{
    size( 800, 800 );
    smooth();
    rectMode( CENTER );
    frameRate( 1 );
}

void draw()
{
    background( 255 );
    
    fill( #AF0808, 200 );
    noStroke();
    
    for ( int i = 0; i < 7; i++ ) {
        for ( int j = 0; j < 30; j++ ) {
            int a = floor( random( -3, 4 ) ) * 5 ;
            pushMatrix();
            translate( i * 100 + 100, j * 20 + 100 );
            rotate( radians( a ) );
            rect( 0, 0, 60, 20 );
            popMatrix();
        }
    }
}
