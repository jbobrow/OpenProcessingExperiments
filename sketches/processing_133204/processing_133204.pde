
/* @pjs preload= "sea.jpg"; */

size(700, 700);
noStroke();

PImage img;
img = loadImage("sea.jpg");
image(img, 0, 0);

int x = int (random(50, 300));
int y = int (random(30, 100));
int xp = int (random(0, 700));

//bubbles

fill(#FFFFFF, 100);
ellipse( xp, xp, x, x);

fill(#FFFFFF, 100);
ellipse( xp+x, xp+x, y, y);

fill(#FFFFFF, 80);
ellipse( xp-x, xp-x, x, x);

//wave

noFill();
strokeWeight(9);
stroke(255, 255, 255, 90);
bezier(0, 102, 0, 102, 56, 56, 213, 55);
bezier(213, 55, 369, 54, 416, 123, 512, 120);
bezier(512, 120, 634, 117, 700, 54, 700, 54);

noStroke();

// seaweed

int triang1b = int(xp) - 84;
int triang1c = int(xp) + 18;

fill(37, 101, 47, 200);
triangle(xp, 700, triang1b, 621, triang1c, 585);

float triang2a = (triang1b + triang1c)/2 ;
float triang2b = triang2a - 29;
float triang2c = triang2a + 49;

fill(37, 101, 47, 150);
triangle(triang2a, 606, triang2b, 527, triang2c, 537);

float triang3a = (triang2b + triang2c) / 2 ;
float triang3b = triang3a - 35;
float triang3c = triang3a + 22;

fill(37, 101, 47, 100);
triangle(triang3a, 523, triang3b, 481, triang3c, 474);

float triang4a = (triang3b + triang3c) / 2 ;
float triang4b = triang4a - 14;
float triang4c = triang4a + 27;

fill(37, 101, 47, 50);
triangle(triang4a, 478, triang4b, 436, triang4c, 443);


// flash of light

float light1 = random(-158, 800);
float light2 = random(90, 640);

fill(255, 255, 255, 50);
quad(369, -114, light1, 700, light2, 840, 417, -114);


