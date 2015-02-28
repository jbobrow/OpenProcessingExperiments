
//copyright Sophie Vennix
//Homework Assignment1
//1.16.14

size(400,400);
background(8,16,115);

float x, y, wd, ht;
x=190;
y=200;
wd=100;
ht=100;

//ring00
strokeWeight(5);
stroke(136,155,212,200);
noFill();
ellipse(200,200,350,350);

//ring0
strokeWeight(10);
stroke(136,155,212,200);
noFill();
ellipse(200,200,375,375);

//ring1
strokeWeight(5);
stroke(136,155,212,200);
noFill();
ellipse(200,200,400,400);

//ring2
strokeWeight(3);
stroke(136,155,212,150);
noFill();
ellipse(200,200,410,410);

//ring3
strokeWeight(3);
stroke(136,155,212,150);
noFill();
ellipse(200,200,420,420);

//ring4
strokeWeight(2);
stroke(136,155,212,125);
noFill();
ellipse(200,200,430,430);

//ring5
strokeWeight(2);
stroke(136,155,212,125);
noFill();
ellipse(200,200,445,445);

//ring6
strokeWeight(2);
stroke(136,155,212,115);
noFill();
ellipse(200,200,465,465);

//ring7
strokeWeight(1);
stroke(136,155,212,100);
noFill();
ellipse(200,200,490,490);

//ring8
strokeWeight(1);
stroke(136,155,212,100);
noFill();
ellipse(200,200,520,520);

//S
noFill();
stroke(174,184,214);
strokeWeight(5);
smooth();
arc(110, 150, .7*wd, .8*ht, HALF_PI, TWO_PI);
arc(110, 230, .7*wd, .8*ht, PI+HALF_PI, PI+TWO_PI);

//I 
line(200, 115, 200, 270);
line(170, 115, 230, 115);
line(170, 270, 230, 270);

//V
line(265, 115, 295, 275);
line(295, 275, 325, 115);

//saveFrame("hw1.jpg");


