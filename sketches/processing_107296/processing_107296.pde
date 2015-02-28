
/* @pjs preload="treb-back.jpg"; */

size(1200,500);

PImage img = loadImage("treb-back.jpg");
image(img,0,0);

line(800,450,825,425); //Left Leg
line(825,425,850,450); //Right Leg
line(825,375,825,425); //Body
line(800,400,850,400); //Arms
ellipseMode(CORNER);
fill(0);
ellipse(800,325,50,50); //Head
fill(255);
ellipse(810,335,10,10);//eyes
ellipse(830,335,10,10);

//House

line(500,300,575,200);
line (575,200,650,300);
fill(255,0,0);
rect(500,300,150,150);

//tree
fill(255,255,0);
rect(200,200,100,250);
fill(0,255,0);
ellipse(150,25,200,200);



