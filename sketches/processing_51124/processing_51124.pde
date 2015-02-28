
/*
  Ka Kit Cheong
  Face with variables
  02/02/2012
*/

// variables
int leftEye_xpos = 142;
int rightEye_xpos = 332;
int eyeWidth = 26;
int Eyebrow_ypos = 80;
int EyebrowThickness = 10;
int mouthHeight = 40;
int lipHeight = 35;


// setup 
size(500, 500);
background(255);
smooth();
stroke(0);
strokeWeight(3);
fill(255);
 
//draw

// Left Eye
rect(100,130, 110,50);
noStroke();
fill(0);
rect(leftEye_xpos,130, eyeWidth,50);
 
// Left Eyebrow
stroke(0);
line(100,130, 155,100);
line(155,100, 210,130);
strokeWeight(EyebrowThickness);
line(100,Eyebrow_ypos, 210,100);
 
// Right Eye
strokeWeight(3);
stroke(0);
fill(255);
rect(290,130, 110,50);
noStroke();
fill(0);
rect(rightEye_xpos,130, eyeWidth,50);
 
// Right Eyebrow
stroke(0);
line(290,130, 345,100);
line(345,100, 400,130);
strokeWeight(EyebrowThickness);
line(290,100, 400,Eyebrow_ypos);
 
// Nose
stroke(0);
strokeWeight(3);
fill(255);
line(210,180, 210,280);
line(210,280, 290,280);
line(290,280, 290,180);
 
arc(155,255, 110,110, 0,PI); // Semicircle on left face
arc(345,255, 110,110, 0,PI); // Semicircle on right face
 
// Mouth
line(155,310, 155,335+mouthHeight+lipHeight);
line(345,310, 345,335+mouthHeight+lipHeight);
fill(0);
rect(155,335, 190, mouthHeight);
stroke(0);
fill(255);
rect(155, 335+mouthHeight, 190,35);

