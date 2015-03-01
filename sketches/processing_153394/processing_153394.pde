
size( 400, 400 );
smooth( );

// variables
float x = width*.65;
float y = height*.75;
float wd = width*.2;
float ht = height*.2;
rectMode( CENTER );

fill( 255, 255, 0 );
rect( x, y, wd, ht );
fill( 0 );
ellipse( x, y, wd*.75, ht*.65);
fill( 255 );
ellipse( x-wd*.1, y, wd*.1, ht*.1 );
//line( 200, 200, 200, 150 );
//line( 200, 200, 150, 200 );
//fill( 255, 0, 0 );
//triangle( 200, 200, 250, 250, 250, 150 );


