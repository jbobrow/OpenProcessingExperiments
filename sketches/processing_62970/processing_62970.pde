
/*
ACCD Summer 2012
ID02
2b Face + Variable
Charlene Chen
06/01/2012
*/

size(600,600);
smooth();
background(0);

int faceWidth = 400;
int faceHeight = 400;

int hairline = 30;

int noseWidth = 10;
int noseHeight = 10;

int mouthYpos = 35;

int eyeYpos = 250;
int eyeHeight = 20;


//face
fill(255);
noStroke();
rect(100,hairline,faceWidth,faceHeight);

//mouth
rect(100,faceHeight+mouthYpos,faceWidth,50);

//nose
fill(0);
rect(280,faceHeight+20,noseWidth,noseHeight);
rect(310,faceHeight+20,noseWidth,noseHeight);

//eyebrows
stroke(0);
strokeWeight(20);
strokeCap(SQUARE);
line(99,eyeYpos-70, 300,eyeYpos-70);
line(299,eyeYpos-70, 500,eyeYpos-70);

//eyes
fill(255);
strokeWeight(9);
rect(100,eyeYpos, 150,eyeHeight);
rect(350,eyeYpos, 150,eyeHeight);


