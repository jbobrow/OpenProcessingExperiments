
size (400, 400);

//face
stroke (131, 147, 202) ;
fill (125, 167, 217) ;
ellipse (200, 200, 100, 200 );
noFill ();
noStroke ();

//lefteye
fill (255, 255, 255);
ellipse (180, 180, 20, 20 );
fill (0, 0, 0) ;
ellipse (180, 180, 10, 10 );
noFill ();

//righteye
fill (255, 255, 255);
ellipse (220, 180, 30, 30 );
fill (0, 0, 0) ;
ellipse (220, 180, 20, 20 );
noFill ();

//nose
stroke (0, 74, 128) ;
line (195, 190, 195, 210 );
line (205, 190, 205, 210 ); 
ellipse (200, 220, 20, 20 );

//mund
bezier (180, 220, 180, 250, 220, 250, 220, 220);

//hat
line (160, 108, 240, 108);
fill (0, 74, 128);
rect (180, 50, 40, 58);
noFill ();

//hair
line (180, 108, 150, 120);
line (180, 108, 120, 150);
line (220, 108, 280, 150);
line (220, 108, 250, 120);

//body
fill (0, 74, 128);
ellipse (200, 400, 300, 200);
noFill ();
