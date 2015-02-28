
// write to the console
println("Hallo!");

// set the canvas size
size( 800, 400 );

// ellipse arguments: x, y, width, height
noStroke();
fill( 0, 0, 255 );
ellipse( 400, 200, 200, 200 );

// line arguments: x1, y1, x2, y2
stroke( 255, 255, 255 );
line( 400-50, 200-20, 400-10, 200-20 );
line( 400+50, 200-20, 400+10, 200-20 );

// ask processing to draw rects from theit center
rectMode( CENTER );

// arguments: x, y, width, height
noStroke();
fill( 255, 0, 0 );
rect( 400, 200-100, 240, 60 );




