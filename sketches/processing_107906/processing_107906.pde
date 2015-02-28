
//Ara Lee
//aral
//copyright Ara Lee, August 2013, Pittsburgh, PA

//===================================================

//bg
size(400,400);
background(0,0,0);

fill(100,100,100,100);
noStroke();
quad(0,0,0,400,298,400,98,0);

stroke(150,130);
strokeWeight(10);
line(100,0,300,400);

strokeWeight(.5);
line(84,0,284,400);
line(94,0,294,400);
line(100,0,300,400);
line(107,0,307,400);

strokeWeight(2);
line(123,0,323,400);

strokeWeight(5);
line(130,0,330,400);

//A
noStroke();
fill(255,255,255,150);
triangle(60,130,105,40,150,130);

fill(255,0,0);
triangle(90,130,105,100,120,130);

//R
fill(255,255,255,150);
arc(207,180,55,55,radians(-135),radians(135));

rect(178,155,10,95);
quad(212,207,219,204,235,246,227,249);

fill(255,0,0);
triangle(187,160,208,180,187,201);

//L
fill(255,255,255,150);
rect(270,270,13,85);
rect(270,342,60,13);

fill(255,0,0);
triangle(270,342,283,342,283,355);


