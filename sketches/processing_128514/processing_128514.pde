
// Homework1, Hyun Doug Kim 
// hyundouk 
// copyright Hyun Doug Kim 2014

size(400, 400);
background(124, 40, 142);

//H
fill(255, 230, 85);
noStroke();
rect(40, 55, 40, 255);
rect(40, 145, 90, 40);
rect(90, 55, 40, 255);

//D behind 
fill(255, 230, 85);
rect(140, 55, 80, 255);
ellipse(222, 182.5, 60, 255);

//D front 
fill(124, 40, 142);
ellipse(187, 184, 50, 178);
fill(255, 230, 85);
rect(140, 95, 40, 178 );

//k
fill(255, 230, 85);
rect(260, 55, 40, 255);
quad(315, 55, 360, 55, 330, 162, 295, 155);
quad(290, 150, 330, 160, 360, 310, 325, 310);

//saveFrame("hw1.jpg");




