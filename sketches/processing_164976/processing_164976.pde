
/*@pjs preload="shape04.png, shape02.png, shape03.png";*/

PImage img1, img2, img3, img4;

size(400, 400);
background(0);
img1 = loadImage("shape04.png");
img2 = loadImage("shape02.png");
img3 = loadImage("shape03.png");

tint(255);
image(img1, 0, 0);

//kokokarasyasen

stroke(49, 95, 255, 50);
strokeWeight(50);
line(0, 0, 400, 400);

stroke(49, 95, 255, 50);
strokeWeight(50);
line(400, 0, 0, 400);


stroke(49, 95, 255, 50);
strokeWeight(50);
line(115, 0, 515, 400);

stroke(49, 95, 255, 50);
strokeWeight(50);
line(233, 0, 633, 400);

stroke(49, 95, 255, 50);
strokeWeight(50);
line(-120, 0, 280, 400);

stroke(49, 95, 255, 50);
strokeWeight(50);
line(-240, 0, 160, 400);


stroke(49, 95, 255, 50);
strokeWeight(50);
line(515, 0, 115, 400);

stroke(49, 95, 255, 50);
strokeWeight(50);
line(633, 0, 233, 400);

stroke(49, 95, 255, 50);
strokeWeight(50);
line(280, 0, -120, 400);

stroke(49, 95, 255, 50);
strokeWeight(50);
line(160, 0, -240, 400);



//kokokarawaku

stroke(255);
strokeWeight(42);
line(0, 0, 0, 400);

stroke(255);
strokeWeight(42);
line(0, 0, 400, 0);

stroke(255);
strokeWeight(42);
line(400, 0, 400, 400);

stroke(255);
strokeWeight(42);
line(0, 400, 400, 400);

//kokomedesotowaku

tint(160, 175, 255, 127);
image(img2, 200, 270);

tint(3, 42, 255, 127);
image(img3, 250, 200);


