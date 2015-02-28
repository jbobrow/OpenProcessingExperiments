
/* @pjs preload= "DanbalaAyida.gif"; */
//Diego Rodriguez, CC Spring 14, Rory S. 



size(800,800);
smooth();
background(255);
stroke(200);

//Global Variables

int square1 = round( random(10,100) );
int square2 = round( random(50,150) );
PImage yoruba;
int xPosition = round( random(200,500) );

yoruba = loadImage("DanbalaAyida.gif");

fill(235, 174, 139);
rect(xPosition,32,65,square1+120,90,90,0,0);


fill(240, 142, 85);
rect(xPosition,square1+153,65,square2-50);



fill(250, 92, 0);
rect(xPosition,square1+square2+103,65,square1+83,0, 0, 12, 12);

image(yoruba, xPosition-153, 0);

fill(0);
ellipse (xPosition+300, square1+50,100,100);
ellipse (xPosition+220, square1+40,10,10);
ellipse (xPosition+380, square1+30,10,10);


