
//week ONE (01) process work
size (250, 250);
background (200);
smooth();

//STROKES
stroke (240);
fill (255, 50);
rect (30, 30, 190, 190);
rect (40, 40, 170, 170);
rect (50, 50, 150, 150);
rect (60, 60, 130, 130);
rect (70, 70, 110, 110);

noStroke ();
//CIRCLES
fill (0, 30);
ellipse (50, 50, 100, 100);
ellipse (200, 200, 100, 100);

fill (0, 40);
ellipse (60, 60, 90, 90);
ellipse (190, 190, 90, 90);

fill (0, 50);
ellipse (70, 70, 80, 80);
ellipse (180, 180, 80, 80);

fill (0, 60);
ellipse (80, 80, 70, 70);
ellipse (170, 170, 70, 70);

fill (0, 70);
ellipse (90, 90, 60, 60);
ellipse (160, 160, 60, 60);

fill (0, 80);
ellipse (100, 100, 50, 50);
ellipse (150, 150, 50, 50);

fill (0, 90);
ellipse (110, 110, 40, 40);
ellipse (140, 140, 40, 40);

fill (0, 100);
ellipse (120, 120, 30, 30);
ellipse (130, 130, 30, 30);

//LINES CONNECT CIRCLES CENTER PT
fill (#FF0033, 30);
quad (125, 10, 200, 200, 125, 240, 50, 50);
quad (125, 10, 190, 190, 125, 240, 60, 60);
quad (125, 10, 180, 180, 125, 240, 70, 70);
quad (125, 10, 170, 170, 125, 240, 80, 80);
quad (125, 10, 160, 160, 125, 240, 90, 90);
quad (125, 10, 150, 150, 125, 240, 100, 100);
quad (125, 10, 140, 140, 125, 240, 110, 110);


