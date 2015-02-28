
/*Logo Design for Interactivity I class*/
//set image size
size(250,250);
//black background
background(0);
//draw white rectangle
noStroke();
fill(255);
rectMode(CORNERS);
rect(75,0,175,250);
//draw purple triangle and quadrilateral
fill(23,1,91);
smooth();
triangle(91,44,159,44,125,102);
quad(125,44,91,153,125,212,159,153);
//draw tiny white circle
fill(255);
ellipseMode(CENTER);
ellipse(137,158,10,10);


//save("logo.png");
