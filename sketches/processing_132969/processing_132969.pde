
// write to the console
println("Hello!");

// set the canvas size
size( 800, 480 );
background( #524C42 );


float headX = 400;
float headY = 200;

noStroke();
fill( 0, 0, 0);
ellipse( headX, headY, 220, 300);

// ask processing to draw rects from the center
rectMode( CENTER );

// arguments: x, y, width, height
noStroke();
fill( 0, 0, 0);
rect( headX, 400-10, 220, 350 );



// ellipse arguments: x, y, width, height
noStroke();
fill( #E5D1B0 );
ellipse( headX, headY, 200, 260 );

// arc(posx, posy, width, height, startangle, endangle)
fill( 255, 255, 255);
stroke( 0, 0, 0);
arc(headX-35, headY-20, 50, 20, 15, 45 );
arc(headX+35, headY-20, 50, 20, 15, 45 );

fill( 0,0,0);
ellipse( headX-32, headY-20, 20, 20);
ellipse( headX+32, headY-20, 20, 20);

// line arguments: xl, yl, x2, y2
stroke( 255, 0, 0);
line( headX-20, headY+50, headX+20, headY+50 );







