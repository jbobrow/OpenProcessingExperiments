
size(640, 480);
background (192, 195, 178);
smooth();

pushMatrix ();
stroke (0, 0);
fill (182, 186, 171);
rotate (radians (-65));
ellipse (-120, 200, 350, 700);
rotate (radians (160));
ellipse (50, -500, 350, 850);
popMatrix ();

fill (182, 186, 171, 90);

noStroke (); // bottom beige shape
fill (211, 206, 176);
quad (-1, 437, 641, 437, 641, 481, -1, 481);
quad (295, -1, 317, 50, 650, 16, 650, -5);

strokeWeight (20); //brown line
stroke (129, 131, 117, 200);
line (0, 141, 636, 22);
line (0, 277, 634, 110);
line (30, 488, 640, 245);

strokeWeight (2);
stroke (166, 164, 152);
line (0, 372, 340, 451);
line (0, 190, 206, 257);
line (0, 120, 641, 281);
line (180, 218, 301, 254);
line (338, 291, 641, 361);
line (100, 34, 641, 190); // boxed line
line (445, 0, 637, 30);
line (564, 20, 554, 162);
line (448, 1, 431, 130);
line (363, -1, 355, 105);
line (280, -1, 280, 85);
line (216, 7, 213, 65);
line (133, -1, 132, 43);

noStroke (); // blue shape
fill (14, 80, 130); 
quad( 239, 126, 537, 137, 172, 231, -10, 235);
quad (-2, 162, 641, 179, 641, 197, -3, 197);

stroke (175, 45, 50); //red line
strokeWeight (4);
noFill();
arc (370, 80, 500, 270, PI/2, (PI/2)+PI);

strokeWeight (22); // red blob
line (181, 118, 261, 116);
line (589, 6, 640, 0);

strokeWeight (4); // orange line
stroke (210, 104, 54);
line (521, -1, 641, 36);

fill (0); // black shapes
noStroke ();
quad (10, -5, 24, 0, 20, 22, 10, 18);
quad (69, 10, 90, 18, 78, 46, 72, 45);
quad (136, 30, 167, 41, 157, 71, 142, 67);
quad (224, 56, 263, 66, 256, 107, 229, 98);
quad (331, 83, 384, 96, 366, 144, 341, 135);
quad (465, 113, 525, 126, 506, 183, 471, 174);

fill (247, 180, 50); // yellow shapes
noStroke ();
quad (34, 0, 53, 5, 46, 29, 36, 27);
quad (102, 19, 123, 28, 118, 59, 105, 55);
quad (181, 46, 209, 54, 202, 88, 185, 85);
quad (272, 70, 318, 78, 304, 122, 279, 114);
quad (393, 98, 454, 112, 433, 163, 397, 152);
quad (538, 127, 621, 144, 591, 207, 550, 196);

strokeWeight (3); // black line
stroke (0);
noFill ();
line (0, 394, 237, 437);
line (237, 437, 584, 339);
line (300, 300, 641, 430);

beginShape ();
vertex (578, 22);
vertex (344,44);
vertex (380, 57);
vertex (641, 40);
endShape ();

arc (385, 160, 530, 170, radians(140), radians(260));
arc (290, 161, 530, 170, radians(140), radians(280));
line (180, 214, 640, 341);
line (84, 214, 640, 390);
line (337, 76, 499, 75);

noFill (); // black outline box top left
quad (-3, 15, 291, 27, 291, 37, -2, 41);

fill (94, 142, 128); // Weird green shape
noStroke ();
beginShape ();
vertex (470, 233);
bezierVertex (522, 250, 632, 255, 660, 227);
bezierVertex (670, 280, 522, 280, 470, 233);
endShape ();

beginShape ();
vertex (470, 233);
bezierVertex (538, 250, 470, 250, 595, 260);
bezierVertex (520, 310, 480, 300, 470, 233);
endShape ();










