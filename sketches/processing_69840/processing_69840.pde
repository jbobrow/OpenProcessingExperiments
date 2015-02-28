
/*******
Assignment 1
Meron Kasahun
mkasahun@brynmawr.edu
CS110-001
September 08, 2012
********/

//setup sketch
size (500,500);
background (100,50,255);
smooth ();

//moon
noStroke();
fill (230);
ellipse (450,40,120,120);

//cloud clusters
fill (250,180);
noStroke();
ellipse (65,130,100,20);
ellipse (100,115,100,20);
ellipse (50,100,100,30);

ellipse (200,130,100,20);
ellipse (240,115,100,20);
ellipse (230,100,100,30);

ellipse (350,130,100,20);
ellipse (390,115,100,20);
ellipse (380,100,100,30);

//rain
smooth ();
fill (130);
stroke (255);
line (100,240,105,250);
line (50,220,55,230);
line (330,200,335,210);
line (210,280,215,290);
line (400,170,405,180);
line (420,180,425,190);
line (100,170,105,180);
line (10,230,15,240);
line (365,170,370,180);
line (380,190,385,200);
line (460,180,465,190);
line (480,230,485,240);
line (200,170,205,180);
line (250,230,255,240);
line (270,180,275,190);
line (280,230,285,240);
line (180,160,185,170);
line (150,230,155,240);
line (130,180,135,190);
line (115,230,120,240);
line (140,170,145,180);
line (50,190,55,200);

//Space Needle
fill (230);
noStroke ();
rect (300,200,20,250);
ellipse (310,210,90,15);
ellipse (310,200,60,20);
ellipse (310,210,60,25);
triangle (308,190,312,190,310,160);


//setup buildings
fill (0);
noStroke ();
rect (0,340,50,185);
rect (50,290,60,210);
rect (110,300,40,200);
rect (150,335,40,165);
rect (190,270,55,320);
rect (245,280,45,220);
rect (290,310,55,190);
rect (345,300,55,200);
rect (390,280,55,320);
rect (445,350,55,175);
