
/*@pjs preload="star2.png";*/
PImage img;
size(400,400);
background(164,227,156);

strokeWeight(3);
stroke(47,197,222);
line(0, 100, 400, 100);

strokeWeight(5);
stroke(47,197,222);
line(0, 200, 400, 200);

strokeWeight(10);
stroke(237,148,180);
line(0, 0, 400, 400);

strokeWeight(7);
stroke(237,148,180);
line(400, 0, 0, 400);

strokeWeight(7);
stroke(199,156,227);
line(200, 0, 200, 400);

strokeWeight(6);
stroke(47,197,222);
line(0, 300, 400, 300);

img = loadImage("star2.png");


image(img, 130, 130, 150, 160);


