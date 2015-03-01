
/* @pjs preload="desert.jpg,skull.png,skull.png,explode.jpeg"; */

size(600,275);
 
PImage img = loadImage("desert.jpg");
PImage img2 = loadImage("skull.png");
PImage img3 = loadImage("explode.jpeg");
img.blend(img2, 0,0, 2145, 2000, -25,0,275,275,BLEND);
img.blend(img2, 0,0, 2145, 2000, 175,0,275,275,MULTIPLY);
img.blend(img2, 0,0, 2145, 2000, 355,0,275,275,DODGE);
img.blend(img2, 0,0, 2145, 2000, 550,0,275,275,DIFFERENCE);
img.blend(img2, 0,0, 2145, 2000, 745,0,275,275,HARD_LIGHT);
img.blend(img2, 0,0, 2145, 2000, 925,0,275,275,SOFT_LIGHT);
img.blend(img2, 0,0, 2145, 2000, -25,300,275,275,SUBTRACT);
img.blend(img2, 0,0, 2145, 2000, 175,300,275,275,LIGHTEST);
img.blend(img2, 0,0, 2145, 2000, 355,300,275,275,DARKEST);
img.blend(img2, 0,0, 2145, 2000, 550,300,275,275,SCREEN);
img.blend(img2, 0,0, 2145, 2000, 745,300,275,275,EXCLUSION);
img.blend(img2, 0,0, 2145, 2000, 925,300,275,275,OVERLAY);
image(img, 0,0,600,275);


