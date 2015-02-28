
size(500,500);
background(93,28,66);

int x = 0;
int y = 0;
int wid = 500;
int hght = 500;
float haloCenterX = wid*.5;
float haloCenterY = hght*.385;



smooth();
noStroke();
fill(178,150,97);
ellipse(haloCenterX - 0, haloCenterY + 20, 270,350);
fill(178,150,97);
ellipse(haloCenterX - 90, haloCenterY - 20, 150,150);
ellipse(haloCenterX + 90, haloCenterY - 20, 150,150);

//ears
ellipse(haloCenterX - 130, haloCenterY - 130, 150,150);
ellipse(haloCenterX + 130, haloCenterY - 130, 150,150);
fill(222,197,152);
ellipse(haloCenterX - 130, haloCenterY - 130, 75,75);
ellipse(haloCenterX + 130, haloCenterY - 130, 75,75);

//Facebase
fill(178,150,97);
noStroke();
smooth();
ellipse(250,200,275,275);
ellipse(250,500,400,350);
stroke(103,85,51);
noStroke();
rect(150,250,200,450);
rectMode(CENTER);
fill(0);
rect(250,250,5,200);

//
noStroke();
fill(170,141,88);
rect(250,200,50,200);
ellipseMode(CENTER);
fill(170,141,88);
noStroke();
triangle(320,375, 180,375, 250,100);


//eyeshade
noStroke();
smooth();
fill(170,141,88);
ellipse(haloCenterX - 80, haloCenterY - 20, 100,70);
ellipse(haloCenterX + 80, haloCenterY - 20, 100,70);
ellipse(haloCenterX - 60, haloCenterY + 20, 60,70);
ellipse(haloCenterX + 60, haloCenterY + 20, 60,70);
ellipse(haloCenterX + 0, haloCenterY - 70, 130,130);

fill (157,127,71);
ellipse(haloCenterX - 60, haloCenterY - 20, 40,70);
ellipse(haloCenterX + 60, haloCenterY - 20, 40,70);
ellipse(haloCenterX - 30, haloCenterY + 20, 40,70);
ellipse(haloCenterX + 30, haloCenterY + 20, 40,70);
ellipse(haloCenterX - 15, haloCenterY + 50, 40,70);
ellipse(haloCenterX + 15, haloCenterY + 50, 40,70);
ellipse(haloCenterX + 0,  haloCenterY + 100, 80,90);
ellipse(haloCenterX + 0, haloCenterY - 60, 40,70);
fill (144,115,61);
ellipse(haloCenterX - 40, haloCenterY - 20, 20,50);
ellipse(haloCenterX + 40, haloCenterY - 20, 20,50);

fill(255,255,255);
ellipse(haloCenterX - 100, haloCenterY - 17, 50,45);
ellipse(haloCenterX + 100, haloCenterY - 17, 50,45);

fill (144,115,61);
ellipse(haloCenterX - 65, haloCenterY - 5, 20,15);
ellipse(haloCenterX + 65, haloCenterY - 5, 20,15);

//eyes
stroke(222, 195, 145);
fill(255,223,162);
strokeWeight(3);
arc(haloCenterX - 100, haloCenterY - 25, 45, 75, PI, 2*PI);
arc(haloCenterX + 100, haloCenterY - 25, 45, 75, PI, 2*PI);


//black
noStroke();
fill(0);
ellipse(haloCenterX - 100, haloCenterY - 20, 50,45);
ellipse(haloCenterX + 100, haloCenterY - 20, 50,45);
ellipse(haloCenterX - 75, haloCenterY - 10, 20,20);
ellipse(haloCenterX + 75, haloCenterY - 10, 20,20);

//yellow
fill(234,179,76);
ellipse(haloCenterX - 100, haloCenterY - 20, 30,30);
ellipse(haloCenterX + 100, haloCenterY - 20, 30,30);

//pupil
fill(0);
ellipse(haloCenterX - 100, haloCenterY - 20, 10,10);
ellipse(haloCenterX + 100, haloCenterY - 20, 10,10);

//brows
fill(255,255,255);
noStroke();
ellipse(haloCenterX - 80, haloCenterY - 55, 20,30);
ellipse(haloCenterX + 80, haloCenterY - 55, 20,30);

//mouth
fill(222,197,152);
ellipse(haloCenterX + 0, haloCenterY + 205, 160,100);
fill(0);
ellipse(haloCenterX + 0, haloCenterY + 190, 100,75);
fill(170,141,88);
noStroke();
ellipse(haloCenterX - 40, haloCenterY + 175, 100,100);
ellipse(haloCenterX + 40, haloCenterY + 175, 100,100);

//nose
fill(252,207,228);
rectMode(CENTER);
rect(250,325,75,15);
rect(250,350,15,40);
ellipse(haloCenterX + 0, haloCenterY + 140, 75,20);
fill(0);
rect(250,385,3,35);
