
/* @pjs preload= "blackbowtie.jpg"; */
size(500, 500);
smooth();
background(250);

PImage img;
img = loadImage ("blackbowtie.jpg");
image(img, 40, 300);

fill(150);
triangle(280, 150, 130, 40, 186, 175);
triangle(220, 150, 370, 40, 314, 175);
fill(200);
ellipse(250, 250, 275, 275);
fill(250);
ellipse(190, 190, 80, 90);
ellipse(310, 190, 80, 90);
fill(0, 85, 200);
ellipse(205, 205, 50, 60);
ellipse(295, 205, 50, 60);
stroke(0);
line(250, 250, 300, 330);
line(250, 250, 330, 300);
line(250, 250, 200, 330);
line(250, 250, 170, 300);
stroke(130);
line(250, 250, 250, 360);
fill(300, 0, 50);
stroke(0);
ellipse(250, 250, 50, 30);


