
size (1100, 1100);
smooth();
background (0);

//flower base
ellipseMode (CENTER);
ellipse (550, 700, 300, 300);
fill (175);
ellipse (550, 800, 100, 100);
fill (0);
ellipse (550, 800, 50, 50);


stroke (255);
line (550, 850, 550, 1000);
fill (255);
triangle (500, 1000, 550, 1000, 500, 950);
fill (255);
triangle (600, 1000, 600, 950, 550, 1000);

//base triangles
stroke (0);
fill (175);
triangle (400, 700, 500, 700, 450, 600);
fill (0);
triangle (500, 700, 600, 700, 550, 550);
fill (175);
triangle (600, 700, 700, 700, 650, 600);

//exterior petals

stroke (0);
//left
fill (100);
triangle (100, 600, 200, 500, 400, 700);
fill (175);
triangle (200, 350, 400, 700, 150, 450);
//right
fill (100);
triangle (700, 700, 1000, 600, 900, 500);
fill (175);
triangle (700, 700, 950, 450, 900, 350);

//centre diamond
fill (255);
quad (550, 200, 600, 250, 550, 550, 500, 250);

//quad petals
//left
fill (240);
quad (250, 450, 300, 350, 450, 600, 400, 700);
//right
fill (240);
quad (800, 350, 850, 450, 700, 700, 650, 600);

//inner triangles
fill (100);
triangle (500, 700, 550, 550, 300, 350);
triangle (600, 700, 550, 550, 800, 350);
fill(0);
triangle (550, 550, 500, 250, 400, 430);
triangle (550, 550, 600, 250, 700, 430);

//top triangles
fill (175);
triangle (400, 430, 400, 300, 500, 250);
triangle (600, 250, 700, 300, 700, 430);
fill (240);
triangle (500, 250, 400, 300, 400, 200);
triangle (600, 250, 700, 200, 700, 300);

//floating seeds

ellipse (100, 400, 50, 50);
ellipse (1000, 400, 50, 50);
ellipse (350, 150, 50, 50);
ellipse (750, 150, 50, 50);

fill (175);
ellipse (200, 250, 100, 100);
fill (0);
ellipse (200, 250, 50, 50);

fill (175);
ellipse (550, 100, 100, 100);
fill (0);
ellipse (550, 100, 50, 50);
fill (240);
ellipse (550, 100, 25, 25);

fill (175);
ellipse (900, 250, 100, 100);
fill(0);
ellipse (900, 250, 50, 50);



