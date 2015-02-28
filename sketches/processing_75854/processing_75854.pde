
size (500, 500);
background (155,251,152);

stroke(0,0,0);

//Cap exterior blau
fill (28,134,238);
ellipse (250,300,480,480);

//Cap interior blanc
fill (255,255,255);
ellipse (250,400,380,480);

//Ull Dret
fill (255,255,255);
ellipse (300,150,100,125);

//Ull esquerra
fill (255,255,255);
ellipse (200,150,100,125);

//Interior ull dret
fill (0,0,0);
ellipse (300,150,20,20);

//Interior ull esquerra
fill (0,0,0);
ellipse (200,150,20,20);

//Ralla nas-boca
line (250, 200, 250, 412);

//Nas
fill (238,0,0);
ellipse (250,200,50,50);

//Boca
noFill ();
arc (250,375,200,75,0,3.6);

//Bigotis esquerra
line (80, 220, 200, 250);
line (70, 280, 190, 280);
line (80, 340, 200, 310);

//Bigotis dreta
line (300, 250, 420, 220);
line (310, 280, 430, 280);
line (300, 310, 420, 340);

//Collar
fill (205,0,0);
rect (40, 445, 420, 55, 12, 12, 12, 12);

//Picarol exterior
fill (255,215,0);
ellipse (250,475,70,70);

//Rodona picarol
fill (0,0,0);
ellipse (250,485,13,13);

//Ralla picarol
line (250, 485, 250, 500);



