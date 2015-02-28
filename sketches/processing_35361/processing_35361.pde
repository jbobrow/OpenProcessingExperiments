
//homework 1
//copyright Maitri Shah August 2011 Pittsburgh PA

size(400,400);
background(252,255,124);

//Letter M(Solid)
noStroke();
fill(142,77,255);
rect(15,50,35,325);
rect(150,50,35,325);
triangle(50,50,125,125,50,125);
triangle(150,50,150,125,75,125);

//Letter M(Subtract)
fill(252,255,124);
triangle(50,75,100,125,50,125);
triangle(150,75,150,125,100,125);

//Letter M(Windows)
fill(191,191,191);
rect(20,55,10,25);
rect(35,85,10,25);
rect(20,115,10,25);
rect(35,145,10,25);
rect(20,175,10,25);
rect(35,205,10,25);
rect(20,235,10,25);
rect(35,275,10,25);
rect(20,305,10,25);
rect(35,335,10,25);

noFill();
stroke(57,57,57);
strokeWeight(3);
rect(172,55,10,315);
strokeWeight(2);
rect(160,55,6,315);
strokeWeight(1);
rect(153,55,2,315);


//Letter D
fill(49,139,30);
noStroke();
rect(225,25,25,150);

stroke(49,139,30);
strokeWeight(3);

noFill();
arc(250,100,148.5,148.5,TWO_PI-PI/2,TWO_PI+PI/2);


//Letter S
stroke(255,0,0);
strokeCap(SQUARE);
strokeWeight(15);
arc(300,222.5,75,75,PI/2,TWO_PI);
arc(300,310,100,100,TWO_PI-PI/2,3*PI);




