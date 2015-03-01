
/* @pjs preload="milk.jpg" ; font = "Lobster.zip" ; */

PImage milk ;
PFont lobster ;
milk = loadImage("milk.jpg") ; // load image
lobster =  createFont("Lobster.zip", 220) ;

// start my program here

size(640, 480) ;

image(milk, 0, 0, width, height) ; // draw image


textFont(lobster, 108) ; //setting the type
text("milklious", 108, 108) ; 

noStroke() ; 
fill(50, 200, 5) ; 
ellipse(200, 150, 80, 80) ;

noStroke() ;
fill(102) ; 
rect(200, 298, 63, 150) ;

// I found my image from google search milk 




