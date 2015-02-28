
/* @pjs preload= "photo.PNG"; */

//
size (800,800);
background(255, 255, 255);
PImage img;
img = loadImage("photo.PNG");
image(img, 300, 300);

fill (248, 214, 167) ;
noStroke();
triangle(325, 275, 353, 220, 383, 275 );
fill (255, 246, 206) ;
triangle(430, 275, 458, 220, 486, 275 );
fill (255, 246, 206) ;
triangle(275, 383, 220, 353, 275, 325 );
fill (248, 214, 167) ;
triangle(275, 486, 220, 458, 275, 430 );

ellipse(233, 223, 55, 55);
ellipse(283, 273, 33, 33);
fill (248, 214, 167) ;
ellipse(583, 573, 55, 55);
ellipse(533, 523, 33, 33);

fill (255, 246, 206) ;
ellipse(233, 573, 55, 55);
ellipse(283, 523, 33, 33);

ellipse(583, 223, 55, 55);
ellipse(533, 273, 33, 33);

// Declaring variables

int x;
int y;

x= round( random(530) );
y= round( random(310) );;

rect(x, y, 8, 180);
fill (248, 214, 167) ;
rect(x + 20, y + 20, 8, 150);
fill (255, 246, 206) ;
rect(x + 40, y + 40, 8, 120);
fill (248, 214, 167) ;
rect(x + 60, y + 60, 8, 90);





rect(y, x, 180, 8);
fill (255, 246, 206) ;
rect(y + 20, x + 20, 150, 8);
fill (248, 214, 167) ;
rect(y + 40, x + 40, 120, 8);
fill (255, 246, 206) ;
rect(y + 60, x + 60, 90, 8);





