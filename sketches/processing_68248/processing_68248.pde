
//Richard May rwmay@andrew.cmu.edu
//copyright 2012

//Backdrop
background (225,225,225);
size (400,400);
fill (0,0,0);
stroke(196,22,22);
quad (0,0, 250,0,60,400,0, 400);

//noStroke ();
fill (225,225,225);
smooth ();
fill (225,225,225);
ellipse (140,130,160,160);
noStroke();
quad (250,0,400,0,400,400,60,400);
fill (234,178,209);
quad (280,0,400,0,400,400,90,400);
noFill();


//Red Circ
stroke (0,0,0);
strokeWeight (2);
fill(196,22,22);
ellipse (150,130,100,100);

//RStem
fill (225,225,225);
stroke (225,225,225);
strokeWeight (24);
strokeCap(SQUARE);
line (50,20,50,350);
line (80,20,80,350);

//R Leg + W
fill (0,0,0);
strokeWeight (2);
stroke(196,22,22);
triangle (160,210, 200,250,230,380);

//W
noStroke ();
//fill(22,136,196);
fill (178,215,234);
triangle (156,220,220,390,80,390);
triangle (156,220,220,390,80,390);
stroke (196,22,22);
triangle (360,380,390,210,364,250);

stroke (0,0,0);
strokeWeight (2);
line (220,380,320,240);
line (300,240, 370,380);

//M
stroke(178,209,234);
strokeWeight (20);
line (265,-6,320,70);
line (315,60,400,0);
line (400,0,400,400);
noStroke();
fill (234,226,178);
//decoration
triangle (385,40,385,200,240,150);
//pic
//saveFrame ("hw1.jpg");












