
size (550, 550);
smooth ();
background (0);
strokeWeight (5);

//me//
//lines//
stroke (255);
noFill();
//head//
ellipseMode (CENTER);
ellipse (200, 100, 150, 150);
//hair//
bezier (225, 50, 250, 100, 300, 125, 260, 165);
bezier (230, 25, 225, 100, 50, 100, 110, 165);
//body//
rectMode (CENTER);
rect (200, 250, 150, 150);
rectMode (CORNER);
rect (150, 325, 50, 175);
rect (200, 325, 50, 175);
//arms//
line (125, 225, 50, 300);
line (275, 225, 350, 300);

//fills//
noStroke();
fill(255);
//eyes and nose//
ellipse (175, 100, 10, 10);
ellipse (225, 100, 10, 10);
ellipse (200, 125, 20, 15);
//hands//
ellipse (50, 300, 20, 20);
ellipse (350, 300, 20, 20);


//dog//

//lines//
stroke (255);
noFill();
ellipseMode (CENTER);

//head then body//
ellipse (375, 365, 75, 75);
ellipse (375, 450, 75, 100);
//right ear//
line (400, 330, 415, 320);
line (415, 320, 425, 345);
//left ear//
line (350, 330, 335, 320);
line (335, 320, 325, 345);
//legs//
line (375, 450, 375, 500);
line (360, 450, 370, 500);
line (390, 450, 380, 500);
ellipse (350, 495, 30, 10);
ellipse (400, 495, 30, 10);
//tail//
arc (405, 450, 75, 75, 0, radians (90));

//fills//
noStroke();
fill(255);

//eyes and nose//
ellipse (365, 360, 7, 7);
ellipse (385, 360, 7, 7);
ellipse (375, 370, 15, 10);

save ("selfportrait.jpg");


