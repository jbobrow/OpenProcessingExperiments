
 int headA=140; //head
int eyeB=140;//eye
int eyeC=140; //eye
int bodyD=120; //body
int legE=300; //leg
int legF=300; //leg

void setup() {
  size(400,400);
}
void draw() {
  background(#0AEBF5);
 ellipseMode(CENTER);
rectMode(CENTER);

fill(150);
rect(200,bodyD,40,200); //body

fill(150);
ellipse(200,headA,120,120); //head

fill(#0AEBF5);
ellipse(172,eyeB,32,60); //eye1

fill(#0AEBF5);
ellipse(220,eyeC,32,60); //eye2


fill(125);
line(225,legE,250,400); //right leg
line(175,legF,100,400); //left leg


headA=headA -1;
eyeB=eyeB -1;
eyeC=eyeC -1;
bodyD=bodyD -1;
legE=legE ;
legF=legF ;
}
