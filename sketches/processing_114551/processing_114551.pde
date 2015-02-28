
/*@pjs preload="shizuku.png";*/

size(400,400);


stroke(0);
strokeWeight(3);
line(0,15,400,15);

stroke(0);
strokeWeight(1);
line(0,25,400,25);


stroke(0);
noFill();
ellipse(50, 50, 50, 50);

stroke(0);
noFill();
ellipse(75, 50, 50, 50);

stroke(0);
noFill();
ellipse(100, 50, 50, 50);


stroke(0);
noFill();
ellipse(300, 350, 50, 50);

stroke(0);
noFill();
ellipse(325, 350, 50, 50);

stroke(0);
noFill();
ellipse(350, 350, 50, 50);



stroke(0);
strokeWeight(1);
line(0,375,400,375);

stroke(0);
strokeWeight(5);
line(0,385,400,385);



stroke(0);
strokeWeight(1);
line(65,150,65,290);

stroke(0);
strokeWeight(1);
line(165,50,165,145);

stroke(0);
strokeWeight(1);
line(245,180,245,265);

stroke(0);
strokeWeight(1);
line(315,75,315,100);



fill(20,120,200);
ellipse(65,325,20,10);

fill(20,120,200);
ellipse(165,175,20,10);

fill(20,120,200);
ellipse(245,305,20,10);

fill(20,120,200);
ellipse(315,125,20,10);



PImage img;

img = loadImage("shizuku.png");

image(img,150,150,30,30);

image(img,50,300,30,30);

image(img,230,280,30,30);

image(img,300,100,30,30);



