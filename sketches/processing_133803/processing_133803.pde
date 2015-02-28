
/* @pjs preload= "Deb_Volume_02.png", "Deb_Volume_01.png", "Deb_Glitched_03.png", "Deb_Glitched_01.png", "Edge2.jpg"; */

size(670, 873);

// variables

PImage img;
//Volume_02
int xPosition1 = round( random(0, 500) );
int yPosition1 = round( random(10, 700) );
int ellipseRadius1 = round( random(10, 500) );
//Volume_01
int xPosition2 = round( random(10, 300) );
int yPosition2 = round( random(5, 900) );
int ellipseRadius2 = round( random(30, 900) );
//Glitched_03
int xPosition3 = round( random(10, 300) );
int yPosition3 = round( random(5, 900) );
int ellipseRadius3 = round( random(30, 900) );
//Glitched_01
int xPosition4 = round( random(10, 300) );
int yPosition4 = round( random(5, 900) );
int ellipseRadius4 = round( random(30, 900) );

// draw
// background image
img = loadImage("Edge2.jpg");
image(img, 0, 0);

// ellipses
noStroke ();
fill (255, 210, 173, 90);
ellipse(xPosition1, yPosition1, ellipseRadius1, ellipseRadius1) ;
ellipse(xPosition2, yPosition2, ellipseRadius2, ellipseRadius2) ;
ellipse(xPosition3, yPosition3, ellipseRadius3, ellipseRadius3) ;
ellipse(xPosition4, yPosition4, ellipseRadius4, ellipseRadius4) ;

//ellipse(140, 400, 200, 200) ;
//ellipse(400, 500, 500, 500) ;
//ellipse(470, 730, 230, 230) ;

//Volume shapes
img = loadImage("Deb_Volume_02.png");
image(img, xPosition1, yPosition1);
img = loadImage("Deb_Volume_01.png");
image(img, xPosition2, yPosition2);
img = loadImage("Deb_Glitched_03.png");
image(img, xPosition3, yPosition3);
img = loadImage("Deb_Glitched_01.png");
image(img, xPosition4, yPosition4);

//img = loadImage("Deb_Volume_02.png");
//image(img, xPosition, yPosition);
//img = loadImage("Deb_Volume_01.png");
//image(img, 50, 160);
//img = loadImage("Deb_Glitched_03.png");
//image(img, 300, 340);
//img = loadImage("Deb_Glitched_01.png");
//image(img, 400, 460, 120, 250);



