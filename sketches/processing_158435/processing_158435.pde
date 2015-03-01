
/* @pjs preload="chicago.jpg"; font = "Audiowide-Regular.ttf"; */

PImage chicago;
PFont audiowide;
chicago = loadImage("chicago.jpg");
audiowide = createFont("Audiowide-Regular.ttf", 100);
textFont(audiowide, 25);

size(660, 440);

image(chicago, 0, 0);

fill(255, 255, 255);
text("Welcome to the city of Chicago", 120, 70);


