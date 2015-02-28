
size(500,500);
smooth();
background(255);
ellipseMode(RADIUS);

stroke(70);
strokeWeight(4);
strokeJoin(ROUND);
strokeCap(ROUND);

//Neck
fill(224,205,27);
rect(200,200,50,20);
fill(211,99,34);
rect(210,220,10,30);
fill(255);
rect(220,220,10,30);
fill(211,99,34);
rect(230,220,10,30);

//Antennae
line(200,50,225,100);
line(250,50,225,100);
fill(211,99,34);
rect(190,40,10,10);
rect(250,40,10,10);

//Head
fill(220);
triangle(225,100,180,200,270,200);
fill(255);
ellipse(225,175,15,15);
fill(0);
ellipse(225,180,2.5,2.5);
fill(255);

//Torso
fill(12,61,201);
triangle(200,250,250,250,225,300);
fill(255);
ellipse(225,315,15,15);
fill(87,240,111);
rectMode(CENTER);
rect(225,315,10,10);
fill(12,61,201);
triangle(225,330,200,380,250,380);

//Arms
noFill();
line(200,250,150,300);
line(250,250,300,300);

//Base
stroke(0);
fill(0);
arc(190,430,10,10,radians(0),radians(180));
arc(260,430,10,10,radians(0),radians(180));
fill(211,99,34);
rectMode(CORNER);
rect(170,380,110,50);
fill(255);
rect(180,390,10,30);
rect(260,390,10,30);
line(200,400,250,400);
line(200,410,250,410);










