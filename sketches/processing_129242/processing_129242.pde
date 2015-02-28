
// Nema Rao 
// pmrao
// copyright Nema Rao 2013
// HW2

// apologies in advance - curves and curveVertex REALLY confuse me 
// i spent a LOT of time trying to understand them
// finally i just went back to the 2d primitives :(
// but i think i understood the idea of using variables and not magic numbers!

size (400, 400);
background (200, 150, 50);

float x = 200;
float y = 200;
float wd = 400;
float ht = 400;

//temporary bounding circle
fill (#F7EBCD);
ellipse(x, y, wd/2, ht/2);

noFill();
stroke(255, 178, 187);
strokeWeight(3);

//nose
noStroke ();
fill (255, 178, 187);
ellipse (x, y+25, x/10, y/10);
fill (0);
ellipse (x-45, y-10, wd/35, ht/35);
ellipse (x+45, y-10, wd/35, ht/35);

noFill();
stroke(0);
strokeWeight (2);
rect (x+25, y-22, wd/10, ht/15);
rect (x-65, y-22, wd/10, ht/15);
strokeWeight (5);
line (x+25, y-30, x+65, y-30);
strokeWeight (2);
line (x-25, y-15, x+24, y-15);

//hair
noStroke();
fill (255);
ellipse (x, y-100, wd/3, ht/10);
noStroke();
fill (125);
rect (x-30, y+55, wd/6, ht/35);












