
// pattern 0001
// fjenett 20100523

float w8, h8;  // width, height div 8

void setup ()
{
    size( 600, 600 );
    
    smooth();
    
    w8 = width / 8.0;
    h8 = height / 8.0;
}

void draw ()
{
    background( 255 );
    strokeWeight( 2 );
    
    for ( int ix = 0; ix < 8; ix++ )
    {
        for ( int iy = 0; iy < 8; iy++ )
        {
            
            int choice = int( random( 3 ) );
            
            switch ( choice )
            {
                case 0:
                    rect( ix*w8, iy*h8, w8, h8 );
                    break;
                case 1:
                    line( ix*w8, iy*h8+h8, ix*w8+w8, iy*h8 );
                    break;
                case 2:
                    for ( int i = 0; i < 9; i++ )
                    {
                        line( ix*w8, iy*h8+i*w8/8, ix*w8+w8, iy*h8+i*w8/8 );
                    }
            }
        }
    }
    
    noLoop(); // stop looping draw()
}

void mousePressed ()
{
    redraw(); // start looping draw()   
}

