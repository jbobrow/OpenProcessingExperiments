
size( 800, 400 );
background( #A6C1AE );

float headX = 300;
float headY = 200;

// ellipse arguments: x, y, width, height
noStroke();
fill( #4A1BDB );
ellipse( headX, headY, 200, 200 );

// line arguments: x1, y1, x2, y2
stroke( 255, 255, 255 );
line( headX-50, headY-20, headX-10, headY-20 );
line( headX+50, headY-20, headX+10, headY-20 );

// arguments: x, y, width, height
rectMode( CENTER );
noStroke();
fill( 255, 0, 0 );
rect( headX, headY-100, 240, 60 );





