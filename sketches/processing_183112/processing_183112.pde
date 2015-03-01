
/*-----------------------------
Robot
Looks pretty cool and is named Bob 

Created January 24, 2015
By Lauren Alman
contact alman.5@osu.edu
Modified January 28, 2015

project URL
-----------------------------*/

size(500,750);
int a;
int b;
int c;

a = 20;
b = 0;
c = 105;

background(a*9+16,a*12+7,a*12+15);    //background is purple
//head and mouth and neck
fill(a*12+15,a+c+9,a+c+9);
rect(270,70,60,110);
fill(a*3);
rect(275,120,50,50);
fill(a*10);
rect(290,180,20,15);

//Antenna
line(300,70,300,60);
line(300,60,295,55);
line(295,55,305,50);
line(305,50,295,45);
line(295,45,305,40);
line(305,40,300,35);
line(300,35,300,30);
fill(a*12+15,a*12+18,b);
ellipse(300,24,15,15);

//Teeth
//Top Row
fill(a*12+10);
rect(275,120,10,10);
rect(285,120,10,10);
rect(295,120,10,10);
rect(305,120,10,10);
rect(315,120,10,10);
//Bottom Row
rect(275,160,10,10);
rect(285,160,10,10);
rect(295,160,10,10);
rect(305,160,10,10);
rect(315,160,10,10);

//Eyes
fill(a*12+15);
ellipse(275,90,30,30);
fill(a*12+15,a*12+15,b);
ellipse(275,90,25,25);
fill(a*12+15);
ellipse(325,90,30,30);
fill(a*12+15,a*12+15,b);
ellipse(325,90,25,25);

//Torso
fill(b);
quad(225,195,375,195,360,400,240,400);
fill(a*7+10,a*7+10,a*11);
quad(230,195,370,195,360,350,240,350);

//Arms
fill(a,b,c);
quad(224,200,226,220,80,60,80,45);
fill(a,a*5,c);
ellipse(219,205,40,40);
fill(a,b,c);
quad(380,200,390,220,390,460,380,455);
fill(a,a*5,c);
ellipse(380,205,40,40);

//Button
fill(a*10+55,b,b);
ellipse(300,260,60,60);
fill(a*10,b,b);
ellipse(300,260,50,50);

//Legs
fill(a,b,c);
rect(250,400,20,200);
rect(332,400,20,200);
//Feet
fill(a,a*5,c);
rect(215,600,60,30);
rect(327,600,60,30);
//Text
fill(b);
textSize(42);
text("I AM BOB",20,300);

