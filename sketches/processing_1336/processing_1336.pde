

size( 400, 400 );

background( 255 );

float s4 = width/4.0;

for ( float i = 0; i < height; i = i + s4 )
{
    rect( 0, i, s4, s4 );
}

for ( float i = 0; i < height; i = i + (s4/2) )
{
    rect( s4, i, s4, s4/2 );
}

for ( float i = 0; i < height; i = i + (s4/4) )
{
    rect( s4*2, i, s4, s4/4 );
}

for ( float i = 0; i < height; i = i + (s4/8) )
{
    rect( s4*3, i, s4, s4/8 );
}

