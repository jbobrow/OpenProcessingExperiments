
/* @pjs preload="spacebg.jpg"; */
size(924,650);

PImage img = loadImage("spacebg.jpg");
image(img,0,0);
noStroke();

//UFO
ellipseMode(CORNER);
fill(#b9b9b9);
ellipse(100,325,150,50);
fill(255);
arc(135,300,80,80,radians(-180),radians(0));

//Space Ship
rect(600,400,200,50);
arc(550,400,100,100,radians(-180),radians(-90));
fill(#505050);
triangle(750,400,800,350,800,400);
arc(800,400,50,50,radians(-270),radians(-90));
fill(#ff5c23);
triangle(825,425,875,400,875,450);
fill(#ff9a23);
triangle(825,425,850,410,850,440);

//Lasers
stroke(#60fb23);
line(200,375,450,400);


