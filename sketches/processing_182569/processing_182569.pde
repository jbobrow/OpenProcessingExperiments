
size(600,400);
background(154,201,250);
int a = 50;
int b = 100;

//tuberia
stroke(0);
strokeWeight(2);
fill(2,210,40);
rect(490,260,60,300);
rect(485,250,70,20);

//ombres tuberia
noStroke();
fill(1,133,25);
rect(523,272,20,300);
rect(518,272,2,300);
rect(497,272,4,300);
rect(520,252,20,17);
rect(515,252,2,17);
rect(494,252,4,17);

//núvols
noStroke();
fill(255);
ellipse(120,100,55,65);
ellipse(170,100,85,75);
ellipse(220,100,50,65);
fill(0);
ellipse(160,85,6,15);
ellipse(180,85,6,15);
fill(255);
ellipse(420,80,55,65);
ellipse(470,80,85,75);
ellipse(520,80,50,65);
fill(0);
ellipse(460,65,6,15);
ellipse(480,65,6,15);

//arbustos
fill(1,145,28);
ellipse(100,350,30,40);
ellipse(120,350,30,50);
ellipse(155,350,30,40);
ellipse(175,350,30,50);
ellipse(295,350,30,40);
ellipse(315,350,30,50);
ellipse(350,350,30,40);
ellipse(370,350,30,50);
ellipse(405,350,30,40);
ellipse(425,350,30,50);

//estructura mahons i premis
fill(157,96,43);
rect(200,200,175,40);
fill(255);

//mahons 
stroke(255);
line(200,200,375,200);
stroke(0);
line(200,210,374,210);
line(200,220,374,220);
line(200,230,374,230);
line(200,240,374,240);

line(217,210,217,202);
line(287,210,287,202);
line(356,210,356,202);

line(217,230,217,222);
line(287,230,287,222);
line(356,230,356,222);
line(208,220,208,212);
line(224,220,224,212);

line(208,240,208,232);
line(224,240,224,232);
line(280,240,280,232);
line(296,240,296,232);
line(280,220,280,212);
line(296,220,296,212);

line(350,240,350,232);
line(366,240,366,232);
line(350,220,350,212);
line(366,220,366,212);

stroke(250,184,1);
fill(250,213,1);
rect(235,202,38,38);
rect(305,202,38,38);

//interrogant ombra
noStroke();
fill(0);
ellipse(255,215,19,19);
ellipse(255,233,7,7);
rect(252,220,6,8);
ellipse(325,215,19,19);
ellipse(325,233,7,7);
rect(322,220,6,8);

//interrogants
fill(250,130,1);
ellipse(252,215,19,19);
ellipse(252,233,7,7);
rect(249,220,6,8);
ellipse(322,215,19,19);
ellipse(322,233,7,7);
rect(319,220,6,8);

//punt interrogant 
fill(250,213,1);
ellipse(252,215,9,8);
rect(242,216,7,10);
ellipse(250,217,4,8);
ellipse(322,215,9,8);
rect(312,216,7,10);
ellipse(320,217,4,8);

//enemics
fill(248,193,120);
stroke(194,112,4);
strokeWeight(4);
arc(100, 350, 30, 40, PI, TWO_PI);
arc(100, 330, 40, 50, PI, TWO_PI);
line(80,330,120,330);

noStroke();
fill(0);

ellipse(108,350,10,18);
ellipse(92,350,10,18);

ellipse(106,318,15,15);
ellipse(95,318,15,15);
fill(248,193,120);
ellipse(106,322,15,13);
ellipse(95,322,15,13);

fill(255);
ellipse(106,320,12,10);
ellipse(95,320,12,10);

fill(0);
ellipse(106,320,2,3);
ellipse(95,320,2,3);

//enemic2
fill(248,193,120);
stroke(194,112,4);
strokeWeight(4);
arc(100+a, 350, 30, 40, PI, TWO_PI);
arc(100+a, 330, 40, 50, PI, TWO_PI);
line(80+a,330,120+a,330);

noStroke();
fill(0);

ellipse(108+a,350,10,18);
ellipse(92+a,350,10,18);

ellipse(106+a,318,15,15);
ellipse(95+a,318,15,15);
fill(248,193,120);
ellipse(106+a,322,15,13);
ellipse(95+a,322,15,13);

fill(255);
ellipse(106+a,320,12,10);
ellipse(95+a,320,12,10);

fill(0);
ellipse(106+a,320,2,3);
ellipse(95+a,320,2,3);

//enemic3
fill(248,193,120);
stroke(194,112,4);
strokeWeight(4);
arc(100+b, 350, 30, 40, PI, TWO_PI);
arc(100+b, 330, 40, 50, PI, TWO_PI);
line(80+b,330,120+b,330);

noStroke();
fill(0);

ellipse(108+b,350,10,18);
ellipse(92+b,350,10,18);

ellipse(106+b,318,15,15);
ellipse(95+b,318,15,15);
fill(248,193,120);
ellipse(106+b,322,15,13);
ellipse(95+b,322,15,13);

fill(255);
ellipse(106+b,320,12,10);
ellipse(95+b,320,12,10);

fill(0);
ellipse(106+b,320,2,3);
ellipse(95+b,320,2,3);



//Terra
fill(147,77,2);
rect(0,350,600,50);







