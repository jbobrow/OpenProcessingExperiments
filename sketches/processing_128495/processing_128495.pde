
// Copyright Shannon Impellicceiri 2014
// Computer Arts with Processing
// Homework #1
// 1/14/2014

// Background
size(400,400);
background(255);
stroke(200);
strokeWeight(5);
fill(255);
rect(0,0,399,399);
noStroke();

// Letter S
//**************************************
// fill top and bottom arcs
fill(232,176,255);
arc(140,188.2,180,110,.7*PI,2.125*PI);
arc(140,278.2,180,110,-.3*PI,1.25*PI);
// cut out rectangles for horizontal edges
fill(255);
rect(140,193.2,90,30);
rect(50,233.2,70,40);
// add diagonal line
strokeWeight(44);
stroke(232,176,255);
line(100,214.8,180,252.2);
// cut out top and bottom center circles
noStroke();
ellipse(140,188.2,60,30);
ellipse(140,278.2,60,30);

// Letter I
//**************************************
//fill(180,127);
fill(30,235,240,127);
//rect(170,138.2,175,55);
rect(210,138.2,135,55);
quad(170,165.7,170,193.2,210,193.2,210,138.2);
rect(170,273.2,175,55);
rect(235.5,193.1,44,80.2);
ellipse(257.7,85,70,50);

//saveFrame("hw1.jpg");





