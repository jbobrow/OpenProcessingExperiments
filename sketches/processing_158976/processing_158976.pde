
/* @pjs preload="sugar.jpg", "burgerz.jpg" ; font = "Lobster.ttf" */
 
//load here
PImage burger;
PImage sug ;
PFont lobster ;
size(640, 480) ;
burger= loadImage("burgerz.jpg"); 
sug = loadImage("sugar.jpg") ;
lobster = createFont("Lobster.ttf", 200) ;
 
image(sug, 0, 0, width, height) ;
image(burger,200,130, 220,180) ;


fill(255,255);
textFont(lobster, 100) ;
text("Oh, so sweet", 70, 430) ;
fill(255, 200) ;
textFont(lobster, 35);
text("Introducing the all new", 30, 60) ;
fill(#FFF700);
textFont(lobster,37);
text("SUGAR BURGER", 360, 63);


