
//Katherine Y. Lee
//Copyright 2012

size( 400, 400 ) ;

smooth();

PImage b;
b = loadImage("fur.jpg");
background(b);

noStroke();
//north rectangle
fill(0);
rect(0, 0, 400, 120);

//south rectangle
rect(0, 260, 400, 140);

//west rectangle
rect(0, 0, 110, 400);

//east rectangle
rect(300, 0, 130, 400);

//center triangle
triangle(130, 190, 205, 120, 205, 260);

//rectangle next to the ct
rect(205, 120, 10, 140);

//rectangle for the "L"
rect(270, 120, 50, 110);

//white eye for "K"
fill(250);
ellipse(140, 147, 20, 20);

//pupil for "K"
fill(0);
ellipse(143, 147, 15, 15);

//white eye for "L"
noStroke();
fill(250);
ellipse(240, 210, 20, 20);

//pupil for "L"
fill(0);
ellipse(238, 208.5, 15, 15);

//upper teeth for K
fill(240);
triangle(194, 130, 194, 140, 190, 135);
triangle(184, 139, 184, 149, 180, 144);

//bottom teeth for K
triangle(190, 236, 190, 246, 186, 241);

