
//my initials
//kyree holmes aid: kholmes 
//copyright 2012

size(400,400);
background(236,243,208);
smooth();


//loop code for evenly spaced horizontal lines borrowed from learningprocessing.com
//left side of "n"
int y = 0; 

while (y < 210) { 
  stroke(107,109,59);
  line(200,y,0,y);  
  y = y + 10;
} 


//letter "k"
noStroke();
fill(185,195,136);
rect(0,0,150,400);

fill(0);
triangle(150,0,0,200,150,400);


//letter "n"
fill(0);
arc(200,200,325,275,TWO_PI-PI/2, TWO_PI);


stroke(107,109,59);
line(150,0,400,240);
line(200,0,400,200);

line(332,0,332,240);
line(362,0,362,240);

//letter "h"
fill(107,109,59);
rect(200,250,160,200);

//left side of letter "k"
stroke(0);
fill(185,195,136,80);
//noFill();
ellipseMode(CORNER);
ellipse(0,0,30,30);
ellipse(0,40,30,30);
ellipse(0,80,30,30);
ellipse(0,120,30,30);
ellipse(0,160,30,30);
ellipse(0,200,30,30);
ellipse(0,240,30,30);
ellipse(0,280,30,30);
ellipse(0,320,30,30);
ellipse(0,360,30,30);
ellipse(0,400,30,30);

//save jpeg
saveFrame("hw1.jpg");

