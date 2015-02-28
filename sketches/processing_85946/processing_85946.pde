
//homework1, Suzanne Choi
//suzanne1@andrew.cmu.edu
//copyright c. 2013 Suzanne Choi. All rights reserved.

size(400,400);
background(36,34,34);
smooth ();

//letter c (the moon)
noStroke();
ellipse(260, 100, 100, 100);
fill(36,34,34);
ellipse(250, 100, 90, 95);
fill(255,255,255);

//person on the moon
ellipse(255,120,10,10);
triangle(255, 120,260, 148, 250, 148);
stroke(255);
line(250, 147, 240, 147);
line(240, 147, 235, 160);
line(248, 147, 238, 147);
line(238, 147, 233, 160);
line(255, 130, 240, 125);

//the letter S
stroke(250);
noFill();
arc(240,160, 70, 70, PI, TWO_PI-PI/2);
arc(240, 240, 80, 80, TWO_PI-PI/2, TWO_PI);
arc(240, 160, 70, 80, PI/2, PI);
arc(240, 240, 80, 80,0, PI/2);
arc(240, 255, 50, 50, PI/2, PI);
fill(250);
noStroke();
triangle(217, 250,212, 260, 222, 260);

//stars
fill(255,255,255);
ellipse(180, 140,2,2);
ellipse(200, 260,2,2);
ellipse(60, 40,2,2);
ellipse(80, 30,2,2);
ellipse(50, 250,2,2);
ellipse(30, 60,2,2);
ellipse(250, 40,2,2);
ellipse(300, 30,2,2);
ellipse(350, 250,2,2);
ellipse(160, 60,2,2);
ellipse(150, 300,2,2);
ellipse(50, 250,2,2);
ellipse(50, 100,2,2);
ellipse(130, 70,2,2);
ellipse(150, 250,2,2);
ellipse(80, 260,2,2);
ellipse(40, 150,2,2);
ellipse(50, 100,2,2);
ellipse(70, 140,2,2);
ellipse(40, 300,2,2);
ellipse(100, 150,2,2);
ellipse(90, 240,2,2);
ellipse(60, 260,2,2);
ellipse(300, 250,2,2);
ellipse(400, 300,2,2);
ellipse(430, 150,2,2);
ellipse(10, 170,2,2);
ellipse(450, 140,2,2);
ellipse(300, 300,2,2);
ellipse(340, 150,2,2);
ellipse(320, 240,2,2);
ellipse(150, 260,2,2);
ellipse(40, 200,2,2);
ellipse(10, 300,2,2);
ellipse(350, 140,2,2);
ellipse(340, 300,2,2);
ellipse(320, 150,2,2);
ellipse(310, 240,2,2);
ellipse(230, 260,2,2);
ellipse(150, 200,2,2);
ellipse(150, 300,2,2);
ellipse(130, 15,2,2);
ellipse(10, 40,2,2);
ellipse(400, 70,2,2);
ellipse(150, 300,2,2);
ellipse(320, 80,2,2);
ellipse(200, 240,2,2);
ellipse(230, 160,2,2);
ellipse(190, 200,2,2);
ellipse(60, 350,2,2);
ellipse(380, 15,2,2);
ellipse(270, 40,2,2);
ellipse(310, 70,2,2);
ellipse(380, 300,2,2);
ellipse(390, 80,2,2);
ellipse(390, 240,2,2);
ellipse(380, 160,2,2);
ellipse(370, 200,2,2);
ellipse(360, 350,2,2);

//glow on the stars
fill(255,255,255,20);
ellipse(390, 240,30,30);
ellipse(390, 240,10,10);
ellipse(380, 160,20,20);
ellipse(370, 200,25,25);
ellipse(370, 200,10,10);
ellipse(360, 350,30,30);
ellipse(150, 300,10,10);
ellipse(130, 15,20,20);
ellipse(130, 15,10,10);
ellipse(10, 40,25,25);
ellipse(400, 70,20,20);
ellipse(150, 300,30,30);
ellipse(150, 300,10,10);
ellipse(150, 250,10,10);
ellipse(80, 260,20,20);
ellipse(40, 150,30,30);
ellipse(40, 150,10,10);
ellipse(40, 150,10,10);
ellipse(50, 100,10,10);
ellipse(70, 140,10,10);

//clouds
fill(100);
ellipse(140,100,20,20);
ellipse(130,90,20,20);
ellipse(150,100,20,20);
ellipse(120,100,20,20);
ellipse(110,105,20,20);
ellipse(150,105,20,20);
ellipse(160,105,20,20);
ellipse(130,105,20,20);
ellipse(140,106,20,20);
ellipse(150,97,20,20);
ellipse(125,105,20,20);
ellipse(90,170,20,20);
ellipse(80,165,20,20);
ellipse(70,170,20,20);
ellipse(60,170,20,20);
ellipse(90,163,20,20);
ellipse(100,170,20,20);
ellipse(110,170,20,20);
ellipse(90,175,20,20);
ellipse(80,175,20,20);

//buildings
fill(70);
rect(40,350,20,60);
rect(20,320,15,90);
rect(70,330,15,80);
rect(100,320,40,90);
rect(160,340,35,70);
rect(180,320,20,80);
rect(210,350,15,60);
rect(240,320,20,90);
rect(270,350,20,60);
rect(300,320,20,90);
rect(320,340,15,70);
rect(330,340,15,60);
rect(350,350,25,60);
rect(380,320,20,90);

//saveFrame("hw1.jpg");







