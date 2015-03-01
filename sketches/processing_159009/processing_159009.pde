
/* @pjs font="summertime.ttf"; preload="sunburn.jpg; */

PImage sunscreen;
PFont summer;
sunscreen = loadImage("sunburn.jpg");
summer = createFont("summertime.ttf", 220);

size(490, 650);
background (#ffffff);

image(sunscreen, 80, 50, width, height);
fill(0, 0, 0);

triangle(260, 120, 200, 320, 280, 120);

textFont (summer, 50);
textAlign(CENTER, BOTTOM);
text("Don't forget your", 250, 100);

fill (255, 60, 30, 80);
textFont (summer, 50);
text("SUNSCREEN", 150, 550);











