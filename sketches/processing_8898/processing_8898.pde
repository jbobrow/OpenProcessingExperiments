

float w9;
float h13;
float w9_6;

color[] color_table;
int current_color = 0;

void setup ()
{
    size( 400, 400 );

    color_table = new color[] {   
        color( 50,50,150 ), // blau
        color( 20,20,20 ),  // grau
        color( 200,50,50 ), // rot
        color( 50,150,70 )  // grün
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
            fill( color_table[current_color % color_table.length] );
            rect( i*w9, k*h13, wl, wl );

            rectMode( CENTER );
            fill( color_table[(current_color+1) % color_table.length] );
            rect( i*w9+wl+wm/2, k*h13+h13/2, wm, wm );

            rectMode( CORNER );
            fill( color_table[(current_color+2) % color_table.length] );
            rect( i*w9+wl+wm, (k+1)*h13-wr, wr, wr );
        }

        current_color++;
    }

    noLoop();
}




