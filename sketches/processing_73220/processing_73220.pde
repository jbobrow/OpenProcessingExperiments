
//////////////////////////////////////////////////////////////////////
/////Danny Gardner
/////October 3, 2012
/////procrastination
/////no interactions, simply watch a procrastinator hit the different stages
/////of procrastination.
//////////////////////////////////////////////////////////////////////


/////when timer > 500, the boolean acts as a switch to shut down the skit


///////these variables determine the time at which the character becomes 
//////progressively more nervous.
int firstFacialChange=100;
int secondFacialChange=200;
int thirdFacialChange=300;
int fourthFacialChange=400;
int endScene=450;

void setup() {
  size (500, 500);
  smooth();
  frameRate (30);
  background (65);
  
}

int timer=0;


//////drawing the kid

void draw () {
  drawKid();




timer=timer+1;
//////if statements. These statements follow a timer that change the face 
//////and words of the character as time goes  by.

if (timer<firstFacialChange) {
  drawSmileHappy(); 
   
}
if (timer < firstFacialChange) {
  textOne();
 
}

  if (timer > firstFacialChange) {
  background (65); drawKid ();
  textTwo();
  drawSmileContent() ;
   
}
  if (timer > secondFacialChange) {
    background (65); 
    drawKid ();
    drawFrown ();
    textThree();
}
if (timer > thirdFacialChange) {
  background (65);
  fill (255, 0, 0,255); 
  drawKid ();
  textFour();
  drawFrownExaggerated ();

}
if (timer > fourthFacialChange) {
  background (65);
  drawKid();
  text("Im going to drop out of school now...", width/3, height/12);
}
if (nTime()) {
  background (65);
  

  }
}






////////methods for the phrases the procrastinator will say.
void textOne() {
  fill (200, 150, 150);
  strokeWeight (3);
  text ("I've got plenty of time", width/3, height/10);
}
void textTwo() {
  fill (200, 150, 150);
  strokeWeight (3);
  text ("I should get started soon", width/3, height/10);
}
void textThree() {
  fill (0);
  strokeWeight (5);
  text ("Okay, I really need to get started", width/3, height/10);
  
}
void textFour () {
  fill (255,0,0,255);
  strokeWeight(20);
  text ("OH NO, IT WAS DUE 10 MINUTES AGO!!!", width/3, height/10);
}

  
///////methods for the faces of the character

void drawSmileHappy () {
  fill (255);
  strokeWeight (2);
 ////mouth
 arc(width/2, 26*height/101, width/12, height/12, -.1, PI+.1);
/////teeth
fill (0);
line (width/2, 26*height/101, width/2, 30*height/100); 
line (52*width/100, 26*height/101, 52*width/100, 29*height/100);
line (48*width/100, 26*height/101, 48*width/100, 29*height/100);
}

void drawSmileContent () {
  fill (250, 210, 210);
  strokeWeight (2);
 ////mouth
 arc(width/2, 26*height/101, width/12, height/12, -.1, PI+.1);

}  

void drawFrown () {
  fill (250, 210, 210);
  strokeWeight (2);
  ////mouth
  arc(width/2, 26*height/90, width/15, height/15, PI, 2*PI);

}
void drawFrownExaggerated () {
  fill (0);
  strokeWeight (2);
  ////mouth
  arc(width/2, 26*height/90, width/15, height/15, PI, 2*PI);
  
}
///////the code used to construct the kid
void drawKid () {
  strokeWeight(2);
fill (250, 210, 210);
////head
ellipse (width/2,height/4, height/10,height/10);
////eyes
fill (0);
ellipse (31*width/60, 24*height/100, height/100, height/100);
ellipse (29*width/60, 24*height/100, height/100, height/100);
///body
line (width/2, 30*height/100, width/2, 6*height/10);
///legs
line (width/2, 6*height/10, 9*width/20, 7*height/10);
line (width/2, 6*height/10, 11*width/20, 7*height/10);
///arms
line (width/2, height/3, 9*width/20, width/2);
line (width/2, height/3, 11*width/20, width/2);
}
  
  
  boolean nTime() {
    boolean iMustGo;
    if (timer > endScene) {
      iMustGo = true;
    }
  else {
    iMustGo = false;
  }
  return iMustGo;
  }

