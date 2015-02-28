

float w9;
float h13;
float w9_6;

color[] cols;
int ccol = 0;

void setup ()
{
    size( 400, 400 );

    cols = new color[] {   
        color( 50,50,150 ),
        color( 20,20,20 ),
        color( 200,50,50 ),
        color( 50,150,70 )
        };
    noStroke();

    w9 = width/9.0;
    w9_6 = w9/6.0;
    h13 = height/13.0;
}

void draw ()
{
    background( 255 );

    for ( int k = 0; k < 13; k++ )
    {
        float s = map( k, 0, 12, 4, 8 );

        for ( int i = 0; i < 9; i++ )
        {
            float wl = floor( max( w9_6, map( i,   0, s, 4*w9_6, w9_6 ) ) );
            float wr = floor( max( w9_6, map( 8-i, 0, s, 4*w9_6, w9_6 ) ) );
            float wm = floor( w9-wl-wr );

            rectMode( CORNER );
            fill( cols[ccol % cols.length] );
            rect( i*w9, k*h13, wl, wl );

            rectMode( CENTER );
            fill( cols[(ccol+1) % cols.length] );
            rect( i*w9+wl+wm/2, k*h13+h13/2, wm, wm );

            rectMode( CORNER );
            fill( cols[(ccol+2) % cols.length] );
            rect( i*w9+wl+wm, (k+1)*h13-wr, wr, wr );
        }

        ccol++;
    }

    noLoop();
}




