
/* @pjs preload="treb-back.jpg"; */

size(1200,500);

PImage img = loadImage("treb-back.jpg");
image(img,0,0);

line(800,450,825,425); // legs
line(850,450,825,425); 

//torse
line(825,425,825,375);

//arms
line(800,400,850,400);

//head
fill(255,255,255);
ellipseMode(CORNER);
ellipse(800,325,50,50);

//house
fill(80,50,6);
rect(500,300,150,165);
line(500,300,575,200);
line(575,200,650,300);

//house
fill(222,138,11);
rect(300,300,200,165);
line(300,200,575,200);
line(305,300,650,300);
line(300,200,300,400);





