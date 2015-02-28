
size (300, 300);
smooth ();

float PJB = 27;

fill (255, 0, 0);
ellipse (width/2, height/2, PJB*3, PJB*3);

fill (255, 255, 0);
ellipse (width/2+100, height/2, 60, 60);

fill (0, 255, 0);
rectMode (CENTER);
rect (width/PJB, height/2, 80, 80);

float  T = 4 * PJB;

fill (0, 0, 255);

triangle (width/3, T, width/3-T/2, height-T, width/3+T/2, height-T);


strokeWeight (2);
stroke (230, 100, 80);
line (2*width/3, 6*PJB/2, 2*width/3, height-6*PJB/2);






