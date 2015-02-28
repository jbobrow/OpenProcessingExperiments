
int x = 250;
int y = 100;
int facePosition = 240;
int eye1Position = 250;
int eye2Position = 220;
int palmPosition = 190;
int finger1Outside = 183;
int finger2Outside = 197;
int fingerMiddle = 190;

size (500,500);
background(24,31,28);
smooth();
strokeWeight(2);
stroke(101,245,236);

//Body
ellipse(250,200,90,180);

//Head
ellipse(250,100,125,125);
strokeWeight(1);
ellipse(facePosition,110,80,80);
fill(24,31,28);
ellipse(eye1Position,100,20,20);
ellipse(eye2Position,100,15,15);

fill(225,250,237);

//Fingers
ellipse(finger1Outside,173,5,9);
ellipse(fingerMiddle,170,5,9);
ellipse(finger2Outside,173,5,9);

//Palm
ellipse(palmPosition,190,20,30);



