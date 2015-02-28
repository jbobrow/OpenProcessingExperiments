
/*@pjs preload="waku2.png,momizi1.png,momizi2.png,momizi3.png,momizi5.png,hotaru.png";*/

PImage img;

size(400,400);
background(136,195,69);
img = loadImage("waku2.png");


tint(166,81,35);
image(img,0,0);

img = loadImage("momizi1.png");

tint(158,30,48);
image(img,200,200);

img = loadImage("hotaru.png");

tint(253,216,112,40);
image(img,0,0);

img = loadImage("momizi2.png");

tint(158,30,51);
image(img,-200,-200);

img = loadImage("momizi3.png");

tint(113,21,37);
image(img,200,-200);

img = loadImage("momizi3.png");

tint(199,19,56);
image(img,-200,200);

stroke(166,81,35);
strokeWeight(6);
line(200, 23, 200, 384);

strokeWeight(6);
line(32,200, 376, 200);

img = loadImage("momizi5.png");

tint(89,10,14,150);
image(img,0,0);

img = loadImage("momizi3.png");

tint(113,21,37,40);
image(img,0,0);

img = loadImage("momizi2.png");

tint(158,30,51,20);
image(img,0,0);

img = loadImage("momizi1.png");

tint(158,30,48,10);
image(img,0,0);











