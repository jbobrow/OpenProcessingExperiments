
// set size of canvas (width, height)
size( 800, 500 );
background( #94FCFA );

float headX = 500;
float headY = 200;

// back to hair
fill( #AF7C1C );
noStroke();
rectMode( CENTER );
rect( headX, headY+40, 200, 200 );

// neck
fill( 255, 255, 255 );
rectMode( CENTER );
rect( headX, headY+100, 80, 80 );

// ellipse arguments: x, y, width, height
// fill arguments: red, green, blue
// face
fill( 255, 255, 255 );
ellipse( headX, headY, 200, 240 );

//eyes
stroke( 0, 0, 0);
ellipse( headX-35, headY-20, 40, 20);
ellipse( headX+35, headY-20, 40, 20);

//pupils
fill( 0, 0, 0 );
ellipse( headX-35, headY-20, 15, 15 );
ellipse( headX+35, headY-20, 15, 15 );

//nose
line( headX, headY-10, headX-10, headY+30 );
line (headX-10, headY+30, headX, headY+30 );

// mouth
fill ( #FCC7CD );
ellipse( headX, headY+60, 70, 10);

// rectangle arguments: x, y, width, height 
// top hair
fill( #AF7C1C );
noStroke();
rectMode( CENTER );
rect( headX, headY-115, 85, 10 );
rect( headX, headY-105, 110, 10 );

// right hair
rect( headX+50, headY-95, 30, 10 );
rect( headX+60, headY-85, 30, 10 );
rect( headX+70, headY-75, 30, 10 );
rect( headX+80, headY-65, 30, 10 );
rect( headX+90, headY-55, 20, 10 );
rect( headX+95, headY-45, 15, 10 );
rect( headX+95, headY-35, 15, 10 );
rect( headX+95, headY-25, 15, 10 );
rect( headX+95, headY-15, 15, 10 );
rect( headX+95, headY-5, 15, 10 );
rect( headX+95, headY+5, 15, 10 );
rect( headX+95, headY+15, 15, 10 );
rect( headX+95, headY+25, 15, 10 );
rect( headX+95, headY+35, 15, 10 );
rect( headX+95, headY+45, 15, 10 );
rect( headX+95, headY+55, 15, 10 );
rect( headX+95, headY+65, 15, 10 );
rect( headX+95, headY+75, 15, 10 );
rect( headX+95, headY+85, 15, 10 );
rect( headX+95, headY+95, 15, 10 );
rect( headX+95, headY+105, 15, 10 );
rect( headX+95, headY+115, 15, 10 );
rect( headX+95, headY+125, 15, 10 );
rect( headX+95, headY+135, 15, 10 );

// left hair
rect( headX-20, headY-95, 90, 10 );
rect( headX-30, headY-85, 100, 10 );
rect( headX-45, headY-75, 100, 10 );
rect( headX-60, headY-65, 80, 10 );
rect( headX-75, headY-55, 60, 10 );
rect( headX-90, headY-45, 30, 10 );
rect( headX-95, headY-35, 25, 10 );
rect( headX-95, headY-25, 25, 10 );
rect( headX-95, headY-15, 25, 10 );
rect( headX-95, headY-5, 25, 10 );
rect( headX-95, headY+5, 25, 10 );
rect( headX-95, headY+15, 25, 10 );
rect( headX-95, headY+25, 25, 10 );
rect( headX-95, headY+35, 25, 10 );
rect( headX-95, headY+45, 25, 10 );
rect( headX-95, headY+55, 25, 10 );
rect( headX-95, headY+65, 25, 10 );
rect( headX-95, headY+75, 25, 10 );
rect( headX-95, headY+85, 25, 10 );
rect( headX-95, headY+95, 25, 10 );
rect( headX-95, headY+105, 25, 10 );
rect( headX-95, headY+115, 25, 10 );
rect( headX-95, headY+125, 25, 10 );
rect( headX-95, headY+135, 25, 10 );





