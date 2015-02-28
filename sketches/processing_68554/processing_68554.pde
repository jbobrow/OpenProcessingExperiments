
// Homework #2 
// Copyright 2012Leyli Guliyeva

//style
size (400, 400);
background ( 232, 68, 82);
smooth ();

//variables
float x, y, diam;
x = 200;
y = 200;
diam = 300;

//outer circle
fill (255, 255, 255, 33);
strokeWeight (0);
stroke (255, 90, 104);
ellipse (x, y, diam+30, diam+30);

//center circle
fill (255, 90, 104);
strokeWeight(6);
stroke (232, 68, 82);
ellipse (x, y, diam-27, diam-27);

// vertical L stroke
//stroke (252, 247, 194);
stroke ( 255, 238, 187);
strokeWeight (11);
noFill ();
beginShape();
  vertex (x - .30*diam, y - .20*diam);
  vertex (x - .30*diam, y + .25*diam);
endShape ();

// Curve of L
beginShape();
  curveVertex(x - .5*diam, y + .5*diam);
  curveVertex(x - .30*diam, y + .25*diam);
  curveVertex(x - .04*diam, y + .25*diam);
  curveVertex(x + .5*diam, y + .5*diam);
endShape();

// Curve of G
strokeWeight (11);
stroke (255, 238, 187);
beginShape();
curveVertex ( x + .34*diam, y + .07*diam);
curveVertex ( x + .32*diam, y - .1*diam);
curveVertex ( x + .17*diam, y - .2*diam);
curveVertex ( x + .03*diam, y - .1*diam);
curveVertex ( x + .03*diam, y + .15*diam);
curveVertex ( x + .2*diam, y + .25*diam);
curveVertex ( x + .32*diam, y + .15*diam);
curveVertex ( x + .32*diam, y +.03*diam);
curveVertex ( x + .17*diam, y +.03*diam);
curveVertex ( x, y +.03*diam );
endShape ();

//saveFrame ("hw2.jpg");




  

