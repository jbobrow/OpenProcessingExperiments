



size(1200, 600);

/*@pjs preload="1.jpg";*/

PImage img;
/*@pjs preload="2.jpg";*/

PImage img1;
/*  @pjs preload="3.jpg";*/

PImage img2;
img = loadImage("1.jpg");
img1 = loadImage("2.jpg");
img2 = loadImage("3.jpg");
background(255);
tint(225, 254, 41); 
image(img, 0, 0);
image(img, 400, 600);
tint(152, 2, 204); 
image(img1, 400, 0);
image(img1, 800, 600);
noTint();
image(img2, 800, 0);
image(img2, 1200, 600);



