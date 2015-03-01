
/* @pjs preload="Stuart_Range.jpg" ; font = "Lobster.ttf" */

//load here
PImage mountain ;
PFont lobster ;
mountain = loadImage("Stuart_Range.jpg") ;
lobster = createFont("Lobster.ttf", 200) ;

size(640, 480) ;
image(mountain, 0, 0, width, height) ;
fill(255, 60) ;
textFont(lobster, 20) ;
text("Don't go up 17 flights of stairs", 220, 260) ;
text("Trust me", 550, 20) ;


