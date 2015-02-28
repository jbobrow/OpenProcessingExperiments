
int x = 250;
int y = 100;
int facePosition = 260;
int eye1Position = 250;
int eye2Position = 280;
int palmPosition = 310;
int finger1Outside = 303;
int finger2Outside = 317;
int fingerMiddle = 310;

size (500,500);
background(24,31,28);
smooth();
strokeWeight(2);
stroke(101,245,236);

//Body
ellipse(x,200,90,180);

//Head
ellipse(x,y-30,125,125);
strokeWeight(1);
ellipse(facePosition,y-30,80,80);
fill(24,31,28);
ellipse(eye1Position,y-40,20,20);
ellipse(eye2Position,y-40,15,15);

fill(225,250,237);

//Fingers
ellipse(finger1Outside,173,5,9);
ellipse(fingerMiddle,170,5,9);
ellipse(finger2Outside,173,5,9);

//Palm
ellipse(palmPosition,190,20,30);



