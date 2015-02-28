
size (300,300);
smooth();

//Birthday: June 22 1990
float bry=22;

//Red Circle
fill (255, 0, 0);
ellipse(width/2,height/2,bry*3, bry*3);

//Yellow Circle
fill (#FFEA00);
ellipse (width/2+100, height/2, 60, 60);

//Green Square
fill (#0DFC1A);
rectMode (CENTER);
rect (width/bry, height/2, 80, 80);

//Orange Line
strokeWeight (2);
stroke (#F2841D);
line (200, 150-bry, 200, 150+bry);

//Blue Triangle
fill (#1318F0);
strokeWeight (1);
stroke (0);
triangle (width/3, height/2-2*bry, width/3+2*bry, height/2+2*bry, width/3-2*bry, height/2+2*bry);



