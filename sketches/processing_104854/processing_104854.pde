
size (400, 400);
background (200);
noStroke ();

int xpos;
int ypos;
int wpos;
int hpos;

xpos = width/4;
ypos = height/5;
wpos = width/10;
hpos = height/20;

fill (hpos, hpos/2, hpos*6);
ellipse (xpos/2, ypos/2, wpos/2, hpos/2);
ellipse (xpos*2/3, ypos*2/3, wpos*2/3, hpos*2/3);
ellipse (xpos, ypos, wpos, hpos);
ellipse (xpos*3/2, ypos*3/2, wpos*3/2, hpos*3/2);
ellipse (xpos*2, ypos*2, wpos*5/2, hpos*5/2);
ellipse (xpos*3, ypos*3, wpos*4, hpos*4);
ellipse (xpos*4, ypos*4, wpos*5, hpos*5);

fill (hpos*3, 0, wpos*4, wpos*4);
rect (xpos/2, ypos*4, wpos/2, hpos/2);
rect (xpos*2/3, ypos*7/2, wpos*2/3, hpos*2/3);
rect (xpos, ypos*8/3, wpos, hpos);
rect (xpos*3/2, ypos*13/7, wpos*7/4, hpos*7/4);
rect (xpos*2, ypos, wpos*3, hpos*3);
rect (xpos*34/10, ypos/80, wpos*5, hpos*5);

fill (xpos, 0, xpos/2, wpos*3);
arc (xpos*2, ypos*35/8, wpos*2, hpos*2, 0, HALF_PI);
arc (xpos*3/2, ypos*9/2, wpos*4, hpos*4, TWO_PI-HALF_PI, TWO_PI);
arc (xpos*7/4, ypos*7/2, wpos*6, hpos*5, HALF_PI, PI);
arc (xpos, ypos*57/16, wpos*8, hpos*6, PI, TWO_PI-PI/2);



