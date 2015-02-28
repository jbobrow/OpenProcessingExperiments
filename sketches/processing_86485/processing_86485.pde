
//Written by Keith Joseph 
//kejoseph@andrew.cmu.edu
//51-257 Computing for the Arts with Processing
//copyright Keith Joseph January 2013 Pittsburgh, Pa 15213 All rights reserved

size (400, 400);

background (227, 92, 55);

//horizontal lines
noStroke ();
fill (210);
rect (64, 150, 272, 1);
rect (56, 160, 288, 1);
rect (48,170, 304, 1);
rect (40, 180, 320, 1);
rect (32, 190, 336, 1);
rect (40, 200, 320, 1);
rect (48, 210, 304, 1);
rect (56, 220, 288, 1);
rect (64, 230, 272, 1);

//circle
stroke (255);
smooth ();
strokeWeight (5);
fill (227, 92, 55);
ellipse (195, 190, 130, 130);

//KJ
smooth ();
strokeWeight (1.5);
noFill ();
stroke (255);
arc (201, 200, 60, 60, 0, PI/2);

smooth ();
stroke (255);
line (231, 150, 231, 199);
line (230, 150, 215, 150);
line (200, 230, 160, 190);
line (160, 190, 200, 150);
line (159, 150, 159, 230);

//border
strokeWeight (15);
stroke (255);
noFill ();
rect (0, 0, 400, 400);

//saveFrame("hw1.jpg");




