
/* Drawing of a figure and clouds, with sky and grass
Jairo Garcia
1/29/2014*/

size(600,400);
background(255);

/*Sky*/
noStroke();
fill(60,200,250);
rect(0,0,600,150);

/*sun*/

fill(230,250,5);
ellipse(600,0,200,200);

/*clouds*/

fill(255);
ellipseMode(CENTER);
ellipse(110,75,200,100);
ellipseMode(CENTER);
ellipse(450,75,200,100);
ellipseMode(CENTER);
ellipse(500,100,150,60);
ellipseMode(CENTER);
ellipse(130,35,100,75);

/*grass*/

fill(14,157,58);
rect(0,275,600,125);

/*fence*/
stroke(0,0,0);
fill(232,190,37);
rect(0,175,20,100);
fill(232,190,37);
rect(20,175,20,100);
fill(232,190,37);
rect(40,175,20,100);
fill(232,190,37);
rect(60,175,20,100);
fill(232,190,37);
rect(80,175,20,100);
fill(232,190,37);
rect(100,175,20,100);
fill(232,190,37);
rect(120,175,20,100);
fill(232,190,37);
rect(140,175,20,100);
fill(232,190,37);
rect(160,175,20,100);
fill(232,190,37);
rect(180,175,20,100);
fill(232,190,37);
rect(200,175,20,100);
fill(232,190,37);
rect(220,175,20,100);
fill(232,190,37);
rect(240,175,20,100);
fill(232,190,37);
rect(260,175,20,100);
fill(232,190,37);
rect(280,175,20,100);
fill(232,190,37);
rect(300,175,20,100);
fill(232,190,37);
rect(320,175,20,100);
fill(232,190,37);
rect(340,175,20,100);
fill(232,190,37);
rect(360,175,20,100);
fill(232,190,37);
rect(380,175,20,100);
fill(232,190,37);
rect(400,175,20,100);
fill(232,190,37);
rect(420,175,20,100);
fill(232,190,37);
rect(440,175,20,100);
fill(232,190,37);
rect(460,175,20,100);
fill(232,190,37);
rect(480,175,20,100);
fill(232,190,37);
rect(500,175,20,100);
fill(232,190,37);
rect(520,175,20,100);
fill(232,190,37);
rect(540,175,20,100);
fill(232,190,37);
rect(560,175,20,100);
fill(232,190,37);
rect(580,175,20,100);
fill(232,190,37);
rect(600,175,20,100);



/* House*/
stroke(0,0,0);
fill(245,222,185);
rectMode(CENTER);
rect(300,200,300,200);
fill(131,87,16);
triangle(150,100,450,100,300,0);
fill(175,244,255);
ellipseMode(CENTER);
ellipse(300,60,70,70);
stroke(0,0,0);
line(265,60,335,60);
line(300,25,300,95);

/*door*/
fill(160,162,133);
rectMode(CENTER);
rect(300,250,76,100);
fill(0,0,0);
ellipseMode(CENTER);
ellipse(330,250,15,15);


/*Face*/

fill(0,0,0);
ellipseMode(CENTER); //shadow
ellipse(150,335,200,100);

noStroke();
fill(28,7,147); //ears
ellipse(75,125,100,100);
ellipse(225,125,100,100);


ellipseMode(CENTER); //body
noStroke();
fill(28,7,147);
ellipse(150,250,200,200);
line(50,250,250,250);

/*These are theh eyes*/

fill(255);
ellipseMode(CENTER);
ellipse(100,225,75,75);

fill(0,0,0);
ellipseMode(CENTER);
ellipse(100,225,40,40);

fill(255);
ellipseMode(CENTER);
ellipse(200,225,75,75);

fill(0,0,0);
ellipseMode(CENTER);
ellipse(200,225,40,40);

fill(255);
ellipseMode(CENTER);
ellipse(215,215,15,15);

fill(255);
ellipseMode(CENTER);
ellipse(115,215,15,15);



/* this is the mouth*/
stroke(0,0,0);
fill(0,0,0);
ellipseMode(CENTER);
ellipse(150,325,30,40);

fill(214,24,24);
ellipseMode(CENTER);
ellipse(150,335,25,20);


