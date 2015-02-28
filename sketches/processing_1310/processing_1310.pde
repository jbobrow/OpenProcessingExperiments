

size( 450, 450 );

background( 255 );
noFill();

translate( width/2, height/2 );

for ( int i = 0; i < 5; i++ )
{
   rotate( TWO_PI/5 );
   ellipse( 52, 30, 130, 270 );
}

