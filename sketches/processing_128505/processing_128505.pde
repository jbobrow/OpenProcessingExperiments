
//copyright Laura Contero 2014
//Homework Assignment 1
size( 400, 400);
background( 239, 175, 247);

stroke( 160, 160, 160);
line( 200, -5, 400, 400);
line( 200, -5, 400, 300);
line( 200, -5, 400, 200);
line( 200, -5, 400, 100);
line( 200, -5, -5, 400);
line( 200, -5, -5, 300);
line( 200, -5, -5, 200);
line( 200, -5, -5, 100);
line( 200, -5, 100, 400);
line( 200, -5, 300, 400);

stroke( 255, 255, 255);
line( 400, 0, 200, 405);
line( 400, 100, 200, 405);
line( 400, 200, 200, 405);
line( 400, 300, 200, 405);
line( 0, 0, 200, 405);
line( 0, 300, 200, 405);
line( 0, 200, 200, 405);
line( 0, 100, 200, 405);
line( 100, 0, 200, 405);
line( 300, 0, 200, 405);

noStroke();
quad( 80, 5, 100, 30, 100, 300, 105, 380);

fill( 255, 255, 255);
noStroke();
arc( 250, 300, 100, 100, 0, PI+HALF_PI+QUARTER_PI);

fill( 62, 9, 70);
arc( 250, 300, 100, 100, 0, PI);

noStroke();
fill( 62, 9, 70);
quad( 0, 300, 0, 300, 150, 295, 350, 300);

noStroke();
fill( 62, 9, 70);
quad( 250, 300, 250, 310, 100, 350, 100, 350);


