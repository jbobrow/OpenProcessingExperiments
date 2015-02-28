

// set the canvas size
size( 800, 400 );
background( 255, 0, 0 );

float TestX = 550;


// ellipse arguments: x, y, width, height
noStroke();
fill( 240, 205, 190 );
ellipse( TestX, 200, 200, 200);


// arguments: x1, y1, x2, y2
stroke( 0, 0, 0 );
line( TestX-50, 200-30, TestX-10, 200-30 );
line( TestX+50, 200-30, TestX+10, 200-30 );

// ask processing to draw rects from their center
rectMode( CENTER );

// HAIR
noStroke();
fill( 255, 255, 0 );
rect( TestX, 200-90, 240, 80 );

fill( 255, 255, 0 );
rect( TestX-100, 250, 40, 250 );

fill( 255, 255, 0 );
rect( TestX+300-200, 250, 40, 240 );


// EYES
fill( 255, 255, 255 );
ellipse( TestX-30 , 190, 40, 20 );
ellipse( TestX+30 , 190, 40, 20 );

fill( 0, 0, 255 );
ellipse( TestX-30 , 190, 20, 20 );
ellipse( TestX+30 , 190, 20, 20 );

fill( 80, 20, 20 );
ellipse( TestX, 250, 80, 60 );


