
//background
size(400,400);
fill(255,99,71);
rect(0,0,400,400);
fill(136,206,235,215);

//blue circle
noStroke();
ellipse(250,250,100,100);
fill(136,206,235,100);
ellipse(270,270,100,100);

//yellow line
strokeWeight(2);
stroke(255,165,0);
line(20,20,350,350);

//black line intersecting circle
stroke(0,0,0);
strokeWeight(3);
line(215,215,285,285);

//black lines perpendicular to yellow line
stroke(0);
strokeWeight(1);
line(295,285,275,300);
line(306,281,268,310);
//line(335,300,260,330);

//black triangle
noStroke();
fill(0,0,0);
//rotate(PI/51);
triangle(275,275,80,300,115,380);

//green rectangle
fill(34,139,34,100);
rect(0,275,400,20);

fill(255,236,139);
//ellipse(50,163,75,75);
ellipse(50,236,75,75);

//orange line cutting triangle
stroke(255,99,71);
strokeWeight(4);
//line(375,375,81,300);

fill(255,250,205,200);
rectMode(CORNERS);
rotate(PI/9.5); //i like pi/3, 11, 
rect(500,50,50,100);

