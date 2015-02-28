
//homework 1
//copyright Felipe Castelblanco, August 30 2011, Pittsburgh PA

size(600, 450);
background(10,180,180);
noStroke();
fill(140,180,40);//color Ellips #2bkg
ellipseMode(CENTER);
ellipse(300,250,200,200);
fill(100,250,30);//color Ellips #1bkg
ellipseMode(CENTER);
ellipse(300,250,150,150);
fill(180,200,30);//color Ellips #1bkg
ellipseMode(CENTER);
ellipse(300,250,110,110);//Ellipse 1b
fill(240,100,0);//color Ellips #3bkg
ellipseMode(CENTER);
ellipse(300,250,75,75);
fill(240,200,30);//color Ellips #4bkg
ellipseMode(CENTER);
ellipse(300,250,50,50);
fill(200,210,230);//quad
stroke(240,240,10);
quad(48, 41, 96, 30, 79, 73, 40, 86);
quad(68, 61, 116, 50, 99, 93, 50, 106);
quad(98, 91, 146, 80, 129, 123, 80, 136);
quad(128, 121, 176, 110, 159, 153, 110, 166);
quad(158, 151, 206, 140, 189, 183, 140, 196);
quad(168, 161, 216, 150, 229, 213, 150, 206);//end left
stroke(250,30,100);
strokeWeight(5);
triangle(216, 150,150,206, 229,213);
fill(250);//fillcolor figures
noStroke();
//f
rect(100, 100, 120, 25);
rect(100,125,30,300);
rect(130,200,60,25);
fill(210,220,150,200);
//c
rect(245,125,31,275);
arc(275,125,60,51,PI, TWO_PI-PI/2);
arc(335,125,60,51, TWO_PI-PI/2, TWO_PI);
noStroke();
rect(275,100,60,25);
rect(335,125,30,25);
rect(275,395,61,30);
rect(335,370,31,35);
arc(275,400,60,51,PI/2,PI);
arc(335,400,60,51, 0, PI/2);
fill(255);
//o
ellipse(475,260,180,330);
fill(10,200,180);//color o
ellipse(475,275,70,285);//in o

//saveFrame("FCO-program.jpg");






