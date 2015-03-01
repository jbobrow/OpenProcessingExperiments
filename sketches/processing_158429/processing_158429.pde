
/* @pjs font="Lobster.ttf"; preload="DonDuck.jpg"; */

PImage Duck;
PFont Lobster;
Duck = loadImage("DonDuck.jpg");
Lobster = createFont("Lobster.ttf",220);

size(1000,450);
background(157,44,206);

image(Duck,300,225);
rect(25,154,100,100);

textFont(Lobster,120);  //setting the type
text("Yo! Donald, duck.",100,100);


