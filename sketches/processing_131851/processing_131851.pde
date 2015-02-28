
/* @pjs preload= "photo.PNG"; */

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

fill (248, 214, 167) ;
triangle(575, 383, 520, 353, 575, 325 );
fill (255, 246, 206) ;
triangle(575, 486, 520, 458, 575, 430 );
fill (248, 214, 167) ;
triangle(325, 575, 353, 520, 383, 575 );
fill (255, 246, 206) ;
triangle(430, 575, 458, 520, 486, 575 );







