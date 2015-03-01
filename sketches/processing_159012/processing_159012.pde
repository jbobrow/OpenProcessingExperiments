
/* @pjs preload="blonde.jpg; font = "nerd.ttf" ; */
PImage blonde ;
PFont Nerd ;
blonde = loadImage ("blonde.jpg") ;
Nerd = createFont("nerd.ttf", 220) ;
 

 
size(640, 480) ;
 
background(255, 0 , 0) ;
image(blonde, 0, 0, width , height ) ;
 
fill(#FFFFFF) ;

textFont( Nerd, 25 ) ;
text ( "Want to be cool?" , 10 ,50, 170) ;

rect(50, 50, 50, 50, 50);
fill( 255, 50, 80);


textFont ( Nerd, 25) ; 
text ( "Just dye your hair BLONDE like Adam." , 180, 450, 150);






