
/*@pjs preload="sakana1.png";*/

PImage img1, img2;

size(400, 400);
background(100, 175, 171);
img1 = loadImage("sakana1.png");
//img2 = loadImage("bell.png");

noStroke();
fill(167, 230, 220);
ellipse(100, 100, 120, 120);
ellipse(160, 160, 70, 70);
ellipse(280, 60, 100, 100);

fill(170, 230, 200);
ellipse(170, 290, 4, 4);
ellipse(160, 270, 8, 8);
ellipse(180, 260, 7, 7);

fill(180, 220, 190);
ellipse(50, 400, 200, 200);
ellipse(5, 250, 100, 100);
ellipse(390, 180, 150, 150);

fill(170, 230, 210);
ellipse(150, 240, 13, 13);
ellipse(120, 200, 20, 20);
ellipse(190, 215, 25, 25);

tint(170, 230, 200, 190);
image(img1, 190, 260, 200, 100);



