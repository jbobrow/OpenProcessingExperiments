
/*@pjs preload="po.png";*/

PImage img;

img = loadImage("po.png");

size(400, 400);
background(153,255,255);

stroke(255,255,204);
strokeWeight(10);

line(200, 40, 0, 60);
line(200, 50, 0, 120);
line(180, 70, 0, 200);
line(180, 70, 0, 290);
line(150, 150, 5, 400);
line(200, 100, 110, 400);
line(225, 100, 200, 400);
line(250, 100, 285, 400);
line(280, 100, 370, 400);
line(310, 100, 400, 300);
line(350, 100, 400, 160);

stroke(200,120);
strokeWeight(1);
fill(255,200);
ellipse(25, 220, 20, 20);
ellipse(50, 300, 50, 50);
ellipse(150, 240, 70, 70);
ellipse(170, 350, 60, 60);
ellipse(250, 280, 30, 30);
ellipse(350, 220, 40, 40);
ellipse(330, 330, 45, 45);








tint(255);
image(img, 0, 0);




