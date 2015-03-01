
/* @pjs preload="music1.jpg; font = "Frijole-Regular.ttf" ; */
PImage music1 ;
PFont Frijole ;
music1 = loadImage ("music1.jpg") ;
Frijole = createFont("Frijole-Regular.ttf", 220) ;



size(640, 480) ;

background(255, 0 , 0) ; 
image(music1, 0, 0, width , height ) ; 

noStroke() ;
fill(#FF0000) ;


textFont( Frijole, 25 ) ; 
text ( "Shadow beats...Free with the sun " , 50 ,450, 0) ; 



