
/* @pjs font="Onyx.ttf", "HARRYP__.TTF"; preload="musicNotes.jpg"; */

PImage band;
PFont textreg;
PFont textbold;
band = loadImage("musicNotes.jpg");
textreg = createFont("Onyx",220);
textbold = createFont("HARRYP__.TTF",220);

size(850,950);
background(114,43,137);

image(band,450,260,400,500);



fill(255);
textFont(textreg,40);  //setting the type
textAlign(CENTER);
text("Please: No wand waving or incantations during the performance.",width/2,850);


fill(255,225,127);
textAlign(CENTER);
textFont(textbold,72);  //setting the type
text("In Concert",width/2,100);
textFont(textbold,96);  //setting the type
// text("The Flying Midgets",width/2,200);
text("THE FLYING MIDGETS",width/2,200);

fill(44,146,227);
ellipse(20,490,870,380);
fill(255);
textFont(textreg,48);
textAlign(LEFT);
text("Date: February 30 1/2 \nTime: 8  1/4 pm \nVenue: Pavilion 9  3/4 \nLocation: 33  1/3 N. South Ave.",32,390);



