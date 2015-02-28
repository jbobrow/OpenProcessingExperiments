
/* @pjs preload= "wall.jpg"; */

size (500, 500);

PImage img;
//img = loadImage ("wall.jpg");
//image (img, 0, 0);

int randomW = round( random(100, 400));
int randomH = round( random(50, 400));

int whiteRectWidth = round( random(10, 400) );
int whiteRectHeight = round( random(10, 400) );

//white1
fill (#FFFFFF);
strokeWeight(10);
stroke (0, 0, 0);
rect (100, 50, whiteRectWidth, whiteRectHeight);

//white2
fill (#FFFFFF);
strokeWeight(10);
stroke (0, 0, 0);
rect (100, whiteRectHeight-50, whiteRectWidth, whiteRectHeight);

//red
fill (#FF0000);
strokeWeight(10);
stroke (0, 0, 0);
rect (100+whiteRectWidth, 50, 400-100-whiteRectWidth, whiteRectHeight);

//blue
fill (#0017FF);
strokeWeight(10);
stroke (0, 0, 0);
rect (10+whiteRectWidth, 50, 400-100-50-whiteRectWidth, 130+whiteRectHeight);

//Sorry. Even though I did manage to make the shapes behave randomly, I couldn't figure out how to make all the squares fit within a specific retangular frame while doing so.
