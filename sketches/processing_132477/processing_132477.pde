
//Mady Dean 02/06/14 Creative Computing: Section B//

size(800,800);
background(255);

PImage img;
img = loadImage("galaxy.jpg");
image(img, 0, 0);

PImage img2;
img2 = loadImage ("phonehome.png");
image(img2, 375, 50);

smooth();
noStroke();
fill(124,252,0);
beginShape();

//head
ellipse(300,320,300,280);

//hair
rect(285, 100, 20, 120);
ellipse(295, 100, 80, 65);

//legs
rect(355, 400, 40, 270);
rect(191, 400, 40, 287);
//vertex(240,400);
//vertex(245,700);
//vertex(255,690);
//vertex(300,480);
//vertex(350,630);
//vertex(360,670);
//vertex(370,670);
//vertex(390,420);

//feet
ellipse(225,690,70,30);
ellipse(390,670,70,30);
endShape(CLOSE);

//eye
fill(255);
ellipse(285,310,230,220);
fill(0);
ellipse(265,290,160,150);

//eyebrow
fill(0);
arc(300,190,200,35,0,PI);

save("Dean_Week1");


