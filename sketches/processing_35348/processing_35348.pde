
//Cristina Mele
// cmele@andrew.cmu.edu
// Copyright © Cristina Mele
// August 2011 
// Pittsburgh Pa, 15221 
// All Rights Reserved 


size(400,400);
background (255,255,255);
smooth();

//C
fill(255,0,0);
noStroke();
ellipse(70, 200, 125, 125);

fill(255,255,255);
rect(100, 135, 50, 130);
ellipse(90, 200, 50, 50);


//L
fill(255,0,0);
rect(125, 140, 50, 120);
rect(125, 210, 100, 50);


//M
triangle(240, 260, 275, 135, 320, 260);
triangle(290, 260, 335, 135, 370, 260);

saveFrame();

