
//Homework 1 - Initials
//copyright 2012 Alex Fischer ajfische

size(400, 400);
smooth();
background(46,84,116);

//construction lines
strokeWeight(0);
stroke(255);
line(150,35, 150,220);
line(100,50, 100,150);
line(150,100, 50,100);
line(200,150,200,350);
line(160.25,285, 166,285);
line(163.25,282, 163.25,288);
line(163.25,285, 158,310);
line(185,165, 215,165);
noFill();
triangle(156,318, 155,310, 161,311);
line(285,90, 285,280);
line(370,175, 270,175);
line(320,135, 326,135);
line(323,132, 323,138);
line(323,134, 340,116);
triangle(338,114, 342,118, 344,112);

//a
noFill();
strokeWeight(8);
stroke(255);
ellipse(100,100, 100,100);
line(150,65, 150,150);
fill(255);
triangle(150,165, 140,150, 160,150);

//j
noFill();
strokeWeight(15);
point(200,165);
strokeWeight(8);
stroke(229,86,86);
point(200,165);
stroke(255);
point(200,200);
point(200,220);
point(200,235);
point(200,245);
point(200,250);
point(200,253);
point(200,255);
point(200,257);
point(200,259);
point(200,261);
line(200,262,200,285);
arc(163.25,285,75,75,0,PI);
fill(255);
triangle(125,267, 135,285, 115,285);
noFill();

//f
line(285,130, 285,250);
arc(323,135, 75,75, PI, 2*PI);
line(340,175, 300,175);
fill(255);
triangle(340,175, 325,185, 325,165);

saveFrame("hw1.jpg");               
