
/* @pjs preload="tree1.jpg, food1.jpg ; font = "Frijole-Regular.ttf" ; */
PImage tree1 ;
PImage food1 ;
PFont Frijole ;
tree1 = loadImage ("tree1.jpg") ;
food1 = loadImage ("food1.jpg") ;
Frijole = createFont("Frijole-Regular.ttf", 220) ;



size(640, 480) ;

background(255, 0 , 0) ; 
image(tree1, 0, 0, width , height ) ; 
image(food1, 400, 350, 70, 70 ) ;

noStroke() ;
fill(#00FF4E) ;


textFont( Frijole, 25 ) ; 
text ( "Pototoes, in stores now " , 10 ,450, 0) ; 
text ( "get them while supplies last! " , 10 ,470, 0) ; 




