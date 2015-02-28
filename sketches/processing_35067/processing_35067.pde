
//Lecture 2 Practicing Variables

size(300,300);
background(200);
smooth();

//producing a space in memory for the number value of the birthday
float dayOfBirth;
//Sept. 26 translates to 26
//assigning a value for the valiable
dayOfBirth = 15;

ellipseMode(RADIUS);
fill(255,0,0);
ellipse(width/2,height/2,(3*dayOfBirth),(3*dayOfBirth));

fill(255,255,0);
ellipse((width/2+100),height/2,30,30);

fill(0,255,0);
rectMode(CENTER);
rect((width/dayOfBirth),height/2,80,80);

stroke(255,125,0);
strokeWeight(2);
line((width*2)/3,((height/2)+(3*dayOfBirth)),(width*2)/3,((height/2)-(3*dayOfBirth)));

float TMath;
TMath = dayOfBirth*2;
float TCenterX;
float TCenterY;
TCenterX = width/3;
TCenterY = height/2;

strokeWeight(1);
stroke(0);
fill(0,0,255);
triangle((TCenterX),(TCenterY-TMath),(TCenterX-TMath),(TCenterY+TMath),(TCenterX+TMath),(TCenterY+TMath));

