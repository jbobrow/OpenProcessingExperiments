


int i;


void setup ()
{
    size( 400, 400 );
    
    background( 100 );
    noStroke();
}


void draw ()
{
    i += random( 6 );
    
    if ( i > 1600 )
    {
        i = 0;
    }
    
    rect( i%40 * 10, i/40 * 10, 10, 10 );
}

