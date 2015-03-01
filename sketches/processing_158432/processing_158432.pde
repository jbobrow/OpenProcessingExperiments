
/* @pjs preload="bunny.jpg; font = "Frijole-Regular.ttf" ; */
PImage bunny ;
PFont Frijole ;
bunny = loadImage ("bunny.jpg") ;
Frijole = createFont("Frijole-Regular.ttf", 220) ;


// start the program below

size(640, 480) ;

background(255, 0 , 0) ; // this is to color the background NOT fill

image(bunny, 0, 0, width , height ) ; 

noStroke() ;
fill(#B6E51C) ;
rect(30, 20, 55, 55, 3, 6, 12, 18) ;

textFont( Frijole, 25 ) ; // setting the typeface here <--
text( "OM NOM NOM " , 255 ,255) ; 


