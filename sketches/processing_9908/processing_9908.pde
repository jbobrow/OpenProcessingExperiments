
// pattern 0003
// fjenett 20100523

float w30, h18, h36;

void setup ()
{
    size( 400, 400 );

    w30 = width / 30.0;
    h18 = height / 18.0;
    h36 = h18 / 2;
}

void draw ()
{
    background( 255 );
    fill( 0 );
    noStroke();
    smooth();

    // top to bottom
    for ( int iy = 0; iy < height-h36; iy += h18 )
    {
        float x1 = 0;
        boolean flip_flop = true;

        // left to right
        for ( int i = 0; i < 60; i++ )
        {
            // generating a value that gets smaller towards the middle ..
            float v = map(i, 0, 60, 0, PI); // map i to 0 - PI, half a circle
            v = sin( v );                   // sinus of 0 - PI will give 0 - 1 - 0
            v = map( v, 0, 1, 1, 0.2 );     // map 0 - 1 to 0.4 - 1.39

            // scale next step using the value above and add to previous position
            float xn = x1 + v * w30;

            // every second ellipse needs to be moved down a row
            float yv = 0;
            if ( flip_flop )
            {
                yv = h36;
            }

            ellipse( x1 + h36, h18/4 + iy + yv, v * h36, h36 );

            flip_flop = !flip_flop;
            x1 = xn;
        }
        
    } // iy-loop

    noLoop();   
}


