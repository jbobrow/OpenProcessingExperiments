
int speed =1;   
int headA =100;//head
int eyeL=140;  //left eye
int eyeM=140;  //right eye
int bodyS=200; //body
int legR=200;  //left leg (start point)
int legK=200;  //right leg (start point)
int legB=300;  //left leg (end point)
int legA=300;  //right leg (end point)


void setup () {
size (400,400);

}
void draw () {
  background (200);
ellipseMode (CENTER);
rectMode (CENTER);  

fill(#06B739);
rect(200, bodyS, 40, 200); //body

fill(#49FA05);
ellipse(200, headA, 120, 120);// head

fill(#0AEBF5);
ellipse (172, eyeL, 32, 60);// left eye

fill(#0AEBF5);
ellipse (220, eyeM, 32, 60); // right eye

fill(150);
line(100,legR,190,legB); // left leg

line(275,legK,200,legA);// right leg
println("What's your name?"); 



headA=headA -1; //moves -1 pixel at a time
eyeL=eyeL -1; //moves -1 pixel at a time 
eyeM=eyeM -1; //moves -1 pixel at a time
bodyS=bodyS -1;//moves -1 pixel at a time 
legR=legR -1; //moves -1 pixel at a time 
legK=legK -1;//moves -1 pixel at a time
legB=legB -1; //moves -1 pixel at a time
legA=legA -1; //moves -1 pixel at a time 

}




