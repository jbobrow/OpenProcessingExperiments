
/* @pjs preload="shark.jpg, pudding.png"; font = "HennyPenny-Regular.ttf"; */

PImage shark;
PImage pudding;
shark = loadImage("shark.jpg");
pudding = loadImage("pudding.png");
hennypenny = createFont("HennyPenny-Regular.ttf", 100);
textFont(hennypenny, 25);

size(400, 400);

image(pudding, 50, 50);
image(shark, 140, 190, 100, 120);

fill(0, 0, 0);
text("Shark Pudding!", 110, 40);

fill(255, 0, 0);
text("Only $1", 140, 380);

fill(128, 128, 128);
triangle(328, 18, 391, 360, 328, 360); 

fill(128, 128, 128);
triangle(71, 18, 71, 360, 8, 360); 


