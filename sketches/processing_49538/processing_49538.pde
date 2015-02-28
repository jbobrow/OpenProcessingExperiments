
// Homework #1 48-257 Programming in the Arts with Processing
// Will Crownover wlc@andrew.cmu.edu
// Copyright January 2012

size( 400, 400 );
smooth();
background( 50,50,50 );


// C
noStroke();
fill( 190, 190, 80 );
ellipse( 200, 200, 400, 400 );
fill( 0, 100, 100 );
ellipse( 210, 200, 350, 360 );
fill( 160, 160, 80 );
ellipse( 200, 200, 350, 350 );
fill( 0, 70, 70 );
ellipse( 210, 200, 300, 310 );
fill( 130, 130, 80 );
ellipse( 200, 200, 300, 300 );
fill( 0, 40, 40 );
ellipse( 210, 200, 250, 260 );
fill( 100, 100, 80 );
ellipse( 200, 200, 250, 250 );
  // C Center
fill( 50, 50, 50 );
ellipse( 205, 200, 210, 205 );
fill( 50, 50, 50 );
ellipse( 200, 200, 200, 200 );
  // C Trim
fill( 50, 50, 50 );
quad( 200, 175, 400,50, 400,350, 200,225 );


// W Behind P
  // W Band 4
fill( 75, 75, 75 );
quad( 355, 0, 251, 400, 266, 400, 370, 0 );
quad( 385, 0, 281, 400, 296, 400, 400, 0 );


// P
  // P Veritcal
noStroke();
fill( 80, 100, 80 );
rect( 228, 0, 22, 400 );
fill( 60, 80, 60 );
rect( 200, 0, 23, 400 );
  // P Arc
stroke(80, 160, 80 );
strokeWeight( 15 );
noFill();
arc( 271, 107, 200, 175, TWO_PI-PI/2, TWO_PI+PI/2 );

stroke(80, 130, 80 );
strokeWeight( 15 );
noFill();
arc( 292, 107, 200, 200, TWO_PI-PI/2, TWO_PI+PI/2 );
  // P Connecters
noStroke();
fill( 80, 160, 80 );
rect( 250, 0, 40, 28 );
fill( 80, 130, 80 );
rect( 228, 0, 63, 15 );

fill( 80, 160, 80 );
rect( 250, 187, 40, 28 );
fill( 80, 130, 80 );
rect( 250, 200, 40, 15 );


// L
  // L Vertical
fill( 0, 60, 50 );
rect( 50, 0, 20, 400 );
fill( 0, 80, 50 );
rect( 25, 0, 20, 400 );
fill( 0, 100, 50 );
rect( 0, 0, 20, 400 );


// W Full
  // W Band 2
fill( 100, 100, 100 );
quad( 178, 110, 103, 400, 118, 400, 192, 110 );
quad( 208, 110, 133, 400, 148, 400, 222, 110 );
  // L Horizontal
noStroke();
fill( 0, 120, 50 );
rect( 0, 375, 296, 25 );
fill( 0, 100, 50 );
rect( 20, 350, 276, 20 );
  // W Band 1
fill( 200, 200, 200 );
quad( 0, 0, 103, 400, 118, 400, 15, 0 );
quad( 30, 0, 133, 400, 148, 400, 45, 0 );
  // W Band 3.1
fill( 150, 150, 150 );
quad( 208, 110, 281, 400, 296, 400, 222, 110 );
  // P Vertical Split
fill( 60, 80, 60 );
rect( 200, 0, 23, 350 );
  // W Band 3.2
fill( 150, 150, 150 );
quad( 178, 110, 251, 400, 266, 400, 192, 110 );

//saveFrame( "hw1.jpeg" );

