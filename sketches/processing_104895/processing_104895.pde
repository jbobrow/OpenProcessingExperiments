
/*
Xiaofeng's random experiment for Day 2 Code BC
*/

size(500,500);
background(199,200,250);

noStroke();

float xpos;
float ypos;
float whatever;

xpos = width/random(1,3);
ypos = height/random(1,3);
whatever = random(100,150);

fill(255,whatever,200);
arc(200,200,xpos,ypos * whatever,0,HALF_PI-random(PI/5,PI/4));

fill(255,255,whatever);
arc(200,200,xpos,ypos * whatever,HALF_PI,PI-random(PI/8,PI/7));

fill(whatever,255,255);
arc(200,200,xpos,ypos * whatever,PI,TWO_PI-HALF_PI-random(PI/3,PI/2));

fill(200);
arc(200,200,xpos,ypos * whatever,TWO_PI-HALF_PI,TWO_PI-random(PI/11,PI/10));

//random little squares
fill(190);
rect(xpos+random(2,200),ypos+random(15,300),width/15,height/15);
rect(xpos+random(2,200),ypos+random(15,300),width/15,height/15);
rect(xpos+random(2,200),ypos+random(15,300),width/15,height/15);
rect(xpos+random(2,200),ypos+random(15,300),width/15,height/15);
rect(xpos+random(2,200),ypos+random(15,300),width/15,height/15);
rect(xpos+random(2,200),ypos+random(15,300),width/15,height/15);
rect(xpos+random(2,200),ypos+random(15,300),width/15,height/15);
rect(xpos+random(2,200),ypos+random(15,300),width/15,height/15);
rect(xpos+random(2,200),ypos+random(15,300),width/15,height/15);
rect(xpos+random(2,200),ypos+random(15,300),width/15,height/15);
rect(xpos+random(2,200),ypos+random(15,300),width/15,height/15);
rect(xpos+random(2,200),ypos+random(15,300),width/15,height/15);
rect(xpos+random(2,200),ypos+random(15,300),width/15,height/15);
rect(xpos+random(2,200),ypos+random(15,300),width/15,height/15);
rect(xpos+random(2,200),ypos+random(15,300),width/15,height/15);
rect(xpos+random(2,200),ypos+random(15,300),width/15,height/15);
rect(xpos+random(2,200),ypos+random(15,300),width/15,height/15);
rect(xpos+random(2,200),ypos+random(15,300),width/15,height/15);
rect(xpos+random(2,200),ypos+random(15,300),width/15,height/15);
rect(xpos+random(2,200),ypos+random(15,300),width/15,height/15);
