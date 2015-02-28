

void setup () {
size( 600, 120 );
}

void draw () {
background( 255 );

strokeWeight( 1 );

float s5 = width/5.0;

rect( 0, 0, s5, height );
rect( s5, 0, s5, height );
rect( 2*s5, 0, s5, height );
rect( 3*s5, 0, s5, height );
rect( 4*s5, 0, s5, height );

strokeWeight( 8 );
strokeCap( SQUARE );


line( 0, s5/2, width, s5/2 );

line( s5/2, 0, s5/2, height );

line( s5+s5/2, 0, s5+s5/2, height );
line( s5+s5/2-s5/4, 0, s5+s5/2-s5/4, height );

line( 2*s5, s5/2-s5/4, width, s5/2-s5/4 );
line( 2*s5+s5/2, 0, 2*s5+s5/2, height );
line( 2*s5+s5/2-s5/4, 0, 2*s5+s5/2-s5/4, height );

line( 3*s5+s5/2, 0, 3*s5+s5/2, height );
line( 3*s5+s5/2-s5/4, 0, 3*s5+s5/2-s5/4, height );
line( 3*s5+s5/2+s5/4, 0, 3*s5+s5/2+s5/4, height );

line( 4*s5+s5/2, 0, 4*s5+s5/2, height );
line( 4*s5+s5/2-s5/4, 0, 4*s5+s5/2-s5/4, height );
line( 4*s5+s5/2+s5/4, 0, 4*s5+s5/2+s5/4, height );
line( 4*s5, s5/2+s5/4, width, s5/2+s5/4 );
}


