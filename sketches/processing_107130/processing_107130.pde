
/*@pjs preload="treb-back.jpg";*/

size(1200,500);

PImage img = loadImage("treb-back.jpg");
image(img, 0,0);

//legs
line(800,450,825,425); 
line(850,450,825,425); 

//torso
line(825,425,825,375);

//arms
line(800,400,850,400); 

//head
fill(0,0);
ellipseMode(CORNER); 
ellipse(800,325,50,50);

//house
rect(500,300,150,150);
line(500,300,575,200);
line(575,200,650,300);





