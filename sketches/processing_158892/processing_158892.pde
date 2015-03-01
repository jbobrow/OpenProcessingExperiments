
/* @pjs font="PermanentMarker.ttf" ; preload="buttertoast.jpg" ; */
background (#000000) ;
size(600, 480) ;

PImage Butter ;
PFont Marker;

Butter = loadImage("buttertoast.jpg") ;
image(Butter, 0, 100, 600, 480) ;

fill(#FFFFFF) ;
rect(15, 110, 570, 5); 

stroke(255) ;
rect(415, 405, 105, 2); 

fill(#FFFFFF) ;
Marker = createFont("PermanentMarker.ttf", 30) ;
textFont(Marker, 60) ;
text("WORLD of BUTTER!", 15, 100) ;
textFont(Marker, 25) ;
text("Where toast never falls on the buttered side!", 20, 400) ;
text("42 Walabi Way", 200, 425) ;
text("Sydney, Austrailia",180, 450) ;





