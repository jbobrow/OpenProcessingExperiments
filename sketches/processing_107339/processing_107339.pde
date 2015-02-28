
/* @pjs preload = "treb-back.jpg"; */
size(1200,500);

PImage img = loadImage("treb-back.jpg");
image(img, 0,0);
line(800,450,825,425); //left leg
line(850,450,825,425); //right leg

//torso
line(825,425,825,375);

//arms
line(810,400,840,400);

//head
fill(242,201,150);
ellipseMode(CORNER);
ellipse(812,350,25,25);

//house
stroke(0);
fill(173,33,42);
rect(500,325,150,150);
line(500,325,575,200);
line(575,200,650,325);
arc(650, 185, 180, 280, PI, TWO_PI);

//deck
stroke(0);
fill(137,87,34);
rect(650,450,200,25);
rect(850,450,100,10);
//house windows
fill(56,184,222);
rect(515,350,30,65);
rect(545,350,30,65);
rect(575,350,30,65);
rect(605,350,30,65);
rect(515,425,120,30);
rect(560,425,30,50);

//sun
noStroke();
fill(250,239,13);
ellipse(1000,50,100,100);
//pond or pool
fill(13,149,250);
ellipse(900,450,500,25);

//bluebuilding
stroke(0);
fill(13,149,250);
rect(250,250,250,225);
//blue building windows top
fill(56,184,222);
rect(275,275,30,65);
rect(330,275,30,65);
rect(385,275,30,65);
rect(440,275,30,65);
// bottom
rect(275,375,30,65);
rect(330,375,30,65);
rect(385,375,30,65);
rect(440,375,30,65);

//greybuilding
fill(225);
rect(3,300,250,175);
//top row windows
fill(56,184,222);
rect(10,325,30,65);
rect(50,325,30,65);
rect(90,325,30,65);
rect(130,325,30,65);
rect(170,325,30,65);
rect(210,325,30,65);
//bottom row windows
rect(10,400,30,65);
rect(50,400,30,65);
rect(90,400,30,65);
rect(130,400,30,65);
rect(170,400,30,65);
rect(210,400,30,65);


//satilite or solar panel
quad(150,250,210,140,185,183,150,196);
quad(196,150,183,185,140,210,250,150);
line(175,300,185,140);





