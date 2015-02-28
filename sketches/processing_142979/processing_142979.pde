
//Image 1 Excercise 3

/* @pjs preload="koegg.png"; */
size(1000, 300);
background(255);
PImage img;
img = loadImage("koegg.png");

color gray = color(200);
//tint(100, 150, 255);
image(img, 0, -250);
tint(gray, 150);
image(img, 150, -250);
tint(gray, 130);
image(img, 300, -250);



