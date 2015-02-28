
println("Hello World!");

size( 800, 400 );

float headX = 400;

//argument: (x, y, width, height)
ellipse( headX, headX, 500, 300);
rectMode( CENTER );
rect( headX, headX - 60, 60, 40 );
ellipse( headX - 100, headX - 200, 60, 80 );
ellipse( headX + 100, headX - 200, 60, 80 );
ellipse( headX - 100, headX - 200, 20, 36 );
ellipse( headX + 100, headX - 200, 20, 36 );
ellipse( headX, headX - 200, 200, 300 );



//argument: (x1, y1, x2, y2)
line( headX - 80, headX - 220, 380, 160 );
line( headX + 20, headX - 240, 480, 180 );
line( headX, headX - 180, 400, 280 );
ellipse( headX - 40, headX - 190, 50, 30 );
ellipse( headX + 40, headX - 190, 50, 30 );
fill (0,0,0);
ellipse( headX - 40, 216, 26, 20 );
ellipse( headX + 40, 216, 26, 20 );

//hat: (x1, y1, x2, y2)
rectMode( CENTER );
rect( headX, headX - 330, 170, 100 );
rect( headX, headX - 280, 300, 10 );

fill (0,0,0);
ellipse( headX, headX - 90, 8, 18 );





