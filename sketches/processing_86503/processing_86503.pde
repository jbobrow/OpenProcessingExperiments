
//copyright Kelech Edozie-Anyadiegwu 2013
//Computer Arts with Processing
//Homework 2

size(400,400);
smooth();
background(201,201,201);

float x,y,wd,ht,facewd,faceht;

x=100;
y=150;
wd=200;
ht=250;
facewd=200;
faceht=200;
//face

strokeWeight(1);
fill(245,217,146);
ellipse(facewd,faceht,width/1.1,height);

//initals + mustache

//stroke
stroke(245,217,146);
noFill();
ellipse(x*2,y+(ht/5),wd,ht/3.7);

//control points
//stroke(255,0,0);
strokeWeight(3);
stroke(245,217,146);

point(x-(.125*wd),y+(ht/5));
point(x+(1.125*wd),y+(ht/5));

//y-(ht/5)+ht/2.5

//line
stroke(255,0,0);
point(x,y+(ht/5));
point(x+(wd/2), y+(ht/5));
point(x+wd,y+(ht/5));

stroke(137,98,19);
//stroke(255,0,0);
beginShape();
curveVertex(x-(.125*wd),y+(ht/5));
curveVertex(x,y+(ht/5));
curveVertex(x+(wd/2), y+(ht/5));
curveVertex(x+wd,y+(ht/5));
curveVertex(x+(1.125*wd),y+(ht/5));
endShape();

//stroke of K/hairs
//control points

stroke(245,217,146);
point (x+(wd*.335),y);
point (x+(wd*.335),y+(ht*.4));

point (x+(wd/1.35),y);
point (x+(wd/1.35),y+(ht*.4));

point (x+(wd*.1),y+(ht*.24));
point (x+(wd*.1),y+(ht*.32));

point (x+(wd*.85), y+(ht*.24));
point (x+(wd*.85), y+(ht*.32));

//non control points

//stroke(255,255,255);
point (x*2,y*1.33);

//stroke (255,0,0);
point (x+(wd/5),y+(ht*.316));
point (x+(wd/1.35),y+(ht*.316));

point (x+(wd*.1),y+(ht*.28));
point (x+(wd*.85),y+(ht*.296));

stroke(137,119,83);
beginShape();
curveVertex(x+(wd*.335),y);
curveVertex(x*2,y*1.33);
curveVertex(x+(wd/5),y+(ht*.316));
curveVertex(x+(wd*.335),y+(ht*.4));
endShape();

beginShape();
curveVertex(x+(wd/1.35),y);
curveVertex(x*2,y*1.33);
curveVertex(x+(wd/1.35),y+(ht*.316));
curveVertex(x+(wd/1.35),y+(ht*.4));
endShape();

stroke(175,119,7);

beginShape();
curveVertex(x+(wd*.1),y+(ht*.04));
curveVertex(x*2,y*1.33);
curveVertex (x+(wd*.1),y+(ht*.28));
curveVertex (x+(wd*.2),y+(ht*.32));
endShape();

beginShape();
curveVertex(x+(wd*.85), y+(ht*.04));
curveVertex(x*2,y*1.33);
curveVertex (x+(wd*.85),y+(ht*.28));
curveVertex (x+(wd*.85),y+(ht*.32));
endShape();

//cross the a
stroke(137,119,83);
line(x+(wd*.35),y+(ht*.28),x+(wd*.65),y+(ht*.28));

stroke(0,0,0);

//smile
float smileX, smileY, smileWD, smileHT;
smileX=100;
smileY=100;
smileWD=100;
smileHT=100;

arc(smileX*2,smileY*2.7,smileWD*1.5,smileHT,radians(60),radians(165));

float glassesX, glassesY, glassesWD, glassesHT;
glassesX=100;
glassesY=100;
glassesWD=100;
glassesHT=100;

//glasses
fill(255,255,255);
ellipse(glassesX+(glassesWD*.3),glassesY+(glassesHT*.3),glassesWD,glassesHT);
ellipse(glassesX+(glassesWD*1.7),glassesY+(glassesHT*.3),glassesWD,glassesHT);

//stroke(255,0,0);



//control
point(glassesX/3,glassesY*.5);
point(glassesX*3.65,glassesY*.5);

//non-control
point(glassesX*.42,glassesY+(glassesHT*0));
point(glassesX/1.24,glassesY+(glassesHT*.3));
point(glassesX*1.8,glassesY+(glassesHT*.3));
point(glassesX*2.2,glassesY+(glassesHT*.3));
point(glassesX*3.2,glassesY+(glassesHT*.3));
point(glassesX*3.57,glassesY+(glassesHT*0));

noFill();
beginShape();
curveVertex(glassesX/3,glassesY*.5);
curveVertex(glassesX*.42,glassesY+(glassesHT*0));
curveVertex(glassesX/1.24,glassesY+(glassesHT*.3));
curveVertex(glassesX*3.65,glassesY*.5);
endShape();

beginShape();
curveVertex(glassesX/3,glassesY*.5);
curveVertex(glassesX*1.8,glassesY+(glassesHT*.3));
curveVertex(glassesX*2.2,glassesY+(glassesHT*.3));
curveVertex(glassesX*3.65,glassesY*.5);
endShape();

beginShape();
curveVertex(glassesX/3,glassesY*.5);
curveVertex(glassesX*3.2,glassesY+(glassesHT*.3));
curveVertex(glassesX*3.57,glassesY+(glassesHT*0));
curveVertex(glassesX*3.65,glassesY*.5);
endShape();

//eyeballs

float eyeballsX,eyeballsY, eyeballsWD, eyeballsHT;
eyeballsX =100;
eyeballsY =100;
eyeballsWD=100;
eyeballsHT=100;

fill(0,0,0);
ellipse(eyeballsX+(eyeballsWD*.3),eyeballsY+(eyeballsHT*.3),eyeballsWD/2,eyeballsHT/2);
ellipse(eyeballsX+(eyeballsWD*1.7),eyeballsY+(eyeballsHT*.3),eyeballsWD/2,eyeballsHT/2);

//eyebrows
float eyebrowsX, eyebrowsY,eyebrowsWD, eyebrowsHT;
eyebrowsX=100;
eyebrowsY=100;
eyebrowsWD=100;
eyebrowsHT=100;

rect(eyebrowsX+(eyebrowsWD*0),eyebrowsY*.6,eyebrowsWD/1.5,eyebrowsHT/6);
rect(eyebrowsX+(eyebrowsWD*1.3),eyebrowsY*.6,eyebrowsWD/1.5,eyebrowsHT/6);

//bowtie
float bowtieX, bowtieY;
bowtieX=100;
bowtieY=100;

fill(113,62,185);

triangle(bowtieX*1,bowtieY*3.5,bowtieX*2,bowtieY*3.9,bowtieX*1,bowtieY*3.9);
triangle(bowtieX*3,bowtieY*3.5,bowtieX*2,bowtieY*3.9,bowtieX*3,bowtieY*3.9);

//freckles

float frecklesX, frecklesY;
frecklesX=100;
frecklesY=100;

stroke(85,58,4);
point(frecklesX,frecklesY*2.5);
point(frecklesX*.8,frecklesY*2.8);
point(frecklesX*.8,frecklesY*2.3);
point(frecklesX*3,frecklesY*2.5);
point(frecklesX*3.2,frecklesY*2.8);
point(frecklesX*3.2,frecklesY*2.3);

//saveFrame("hw2.jpg");



