
/* @pjs preload="emptybook.jpeg" ; font = "IndieFlower.ttf, IndieFlower.ttf"; */



PImage book ;
PFont indie ;
book = loadImage("emptybook.jpeg") ; // load image from google 
indie = createFont("IndieFlower.ttf", 220) ; 



// start my program here

size(640, 480) ;

image(book, 0, 0, width, height) ; // draw image

fill(125, 0, 0) ;
textFont(indie, 50) ; // setting the type
text("What Is", 100, 150) ; 
text("Music?", 375, 250) ;

noStroke() ;
fill(50, 55, 100) ;
ellipse(450, 185, 50, 50) ;

noStroke() ;
fill(50, 55, 100) ;
ellipse(565, 155, 20, 20) ;


noStroke() ;
fill(75, 75, 80, 80) ;
quad(140, 145, 100, 70, 80, 65, 60, 80) ;



