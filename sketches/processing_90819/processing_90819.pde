
size( displayWidth,displayHeight );

background( 255 );

stroke( 0 );

strokeWeight( 1 );

noFill( );

rectMode( CENTER );

ellipseMode( CENTER );

//line( 0,0 , width,height );

//quad( 0,1 ,  1,0 , -1,0 , 0,-1 );

int w = width / 2;
int h = height / 2;

int x = w / 2;
int y = h / 2;

int x1 = 0;
int y1 = 1;

int x2 = 1;
int y2 = 0;

int x3 = -1;
int y3 = 0;

int x4 = 0;
int y4 = -1;

point( w,h );

quad( x1,y1 , x2,y2 , x3,y3 , x4,y4 );

println( w );
println( h );
println( x );
println( y );
println( x1 );
println( y1 );
println( x2 );
println( y2 );
println( x3 );
println( y3 );
println( x4 );
println( y4 );
