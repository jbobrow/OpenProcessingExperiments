
/*****************************************
 * Assignment 3
 * Name:         James Reingruber
 * E-mail:       jreingru@haverford.edu
 * Course:       CS 110 - Section 001
 * Submitted:    October 3, 2012
 * 
 * I used object formatting to create three rendomly generated humans and frogs.  Both interact with the mouse, which is a fly.  
 ***********************************************/
//initialize objects
Frog myFrog1;
Frog myFrog2;
Frog myFrog3;
Human myHuman1;
Human myHuman2;
Human myHuman3;

//initialize global variables
boolean horsefly = false;
float frogbody;
float frogbodx;
float xposhead;
float yposhead;


void setup () {

  size (500, 500);
  background (255);


  //constructor for frog
  myFrog1 = new Frog (random (100, 350), random (0, 500), random (10, 20), random (20, 40), random (3, 8), frogbody - 40, frogbodx + 10, frogbodx - 10);
  myFrog2 = new Frog (random (100, 350), random (0, 500), random (10, 20), random (20, 40), random (3, 8), frogbody - 40, frogbodx + 10, frogbodx - 10);
  myFrog3 = new Frog (random (100, 350), random (0, 500), random (10, 20), random (20, 40), random (3, 8), frogbody - 40, frogbodx + 10, frogbodx - 10);
  //constructor for human
  myHuman1 = new Human (random (100, 500), 435, xposhead + 20, yposhead - 5, xposhead + 20, 2, 10, 10, random (0, 255), random (0, 255), random (0, 255), random (115, 135), random (90, 110));
  myHuman2 = new Human (random (100, 500), 435, xposhead + 20, yposhead - 5, xposhead + 20, 2, 10, 10, random (0, 255), random (0, 255), random (0, 255), random (115, 135), random (90, 110));
  myHuman3 = new Human (random (100, 500), 435, xposhead + 20, yposhead - 5, xposhead + 20, 2, 10, 10, random (0, 255), random (0, 255), random (0, 255), random (115, 135), random (90, 110));
}

void draw () {
  //background sky
  fill (0, 0, 170);
  rect (0, 0, 500, 100);
  //background grass
  fill (0, 170, 0);
  rect (0, 100, 500, 400);

  //call frog "appear" function
  myFrog1.appear ();
  myFrog2.appear ();
  myFrog3.appear ();

  //frog eats fly
  float frogdistance = dist (myFrog1.frogbodx, myFrog1.frogbody, mouseX, mouseY);
  if (frogdistance < 8) {
    horsefly = false;
  }

  float frogdistance2 = dist (myFrog2.frogbodx, myFrog2.frogbody, mouseX, mouseY);
  if (frogdistance2 < 8) {
    horsefly = false;
  }

  float frogdistance3 = dist (myFrog3.frogbodx, myFrog3.frogbody, mouseX, mouseY);
  if (frogdistance3 < 10) {
    horsefly = false;
  }

  if (horsefly == true) {
    drawfly ();
  }
  //make fly regenerate itself using random function
  if (random (0, 1) < .02) {
    horsefly = true;
  }

  //call human "display" function
  myHuman1.display ();
  myHuman2.display ();
  myHuman3.display ();
}

class Frog {

  //declare frog variables
  float frogbody;
  float frogbodx;
  float frogeyewidth;
  float frogeyeheight;
  float nosesize;
  float frogeye;
  float frogxeye;
  float frogeyex;

  //frog constructor
  Frog (float tempFrogbody, float tempFrogbodx, float tempFrogeyewidth, float tempFrogeyeheight, float tempNosesize, float tempFrogeye, float tempFrogxeye, float tempFrogeyex) {

    frogbody = tempFrogbody;
    frogbodx = tempFrogbodx;
    frogeyewidth = tempFrogeyewidth;
    frogeyeheight = tempFrogeyeheight;
    nosesize = tempNosesize;
    frogeye = tempFrogeye;
    frogxeye = tempFrogxeye;
    frogeyex = tempFrogeyex;
  }

  //frog draws itself using appear function
  void appear () {
    smooth ();

    //body
    fill (49, 152, 21);
    ellipse (frogbodx, frogbody, 55, 90);

    //nose
    fill (0);
    ellipse (frogbodx + 5, frogbody - 20, nosesize, nosesize);
    ellipse (frogbodx - 5, frogbody - 20, nosesize, nosesize);

    //mouth
    fill (0);
    ellipse (frogbodx, frogbody, 40, 20);

    //eyes
    fill (255);
    ellipse (frogxeye, frogeye, frogeyewidth, frogeyeheight);
    ellipse (frogeyex, frogeye, frogeyewidth, frogeyeheight);
    fill (0);
    ellipse (frogxeye, frogeye, frogeyewidth/2, frogeyeheight/2);
    ellipse (frogeyex, frogeye, frogeyewidth/2, frogeyeheight/2);

    //frog eyes follow mouse
    frogeyex = map (mouseX, 0, width, frogbodx + 3, frogbodx + 17);
    frogxeye = map (mouseX, 0, width, frogbodx - 17, frogbodx - 3);
    frogeye = map (mouseY, 0, height, frogbody - 50, frogbody - 30);


    //feet
    fill (49, 152, 21);
    ellipse (frogbodx + 35, frogbody + 45, 40, 10);
    ellipse (frogbodx - 35, frogbody + 45, 40, 10);

    //thys
    pushMatrix();
    translate (frogbodx + 30, frogbody + 30);
    rotate (radians(55));
    ellipse (0, 0, 27, 60);
    popMatrix();
    pushMatrix();
    translate (frogbodx - 30, frogbody + 30);
    rotate (radians(125));
    ellipse (0, 0, 27, 60);
    popMatrix();
  }
}

//fly
void drawfly () {
  noCursor ();
  fill (188, 218, 234);
  ellipse (mouseX +10, mouseY, 25, 10);
  ellipse (mouseX - 10, mouseY, 25, 10);
  fill (0);
  ellipse (mouseX, mouseY, 20, 20);
  fill (255, 0, 0);
  ellipse (mouseX + 5, mouseY - 5, 10, 13);
  ellipse (mouseX - 5, mouseY - 5, 10, 13);
}


class Human {
  float xposhead;
  float yposhead;
  float firsteyex;
  float eyey;
  float secondeyex;
  float eyesize;
  float mouthwidth;
  float mouthheight;
  float neckred;
  float neckgreen;
  float neckblue;
  float headwidth;
  float headheight;

  //human constructor
  Human (float tempXposhead, float tempYposhead, float tempFirsteyex, float tempEyey, float tempSecondeyex, float tempEyesize, float tempMouthheight, float tempMouthwidth, float tempNeckred, float tempNeckgreen, float tempNeckblue, float tempHeadheight, float tempHeadwidth) {

    xposhead = tempXposhead;
    yposhead = tempYposhead;
    firsteyex = tempFirsteyex;
    eyey = tempEyey;
    secondeyex = tempSecondeyex;
    eyesize = tempEyesize;
    mouthwidth = tempMouthwidth;
    mouthheight = tempMouthheight;
    neckred = tempNeckred;
    neckgreen = tempNeckgreen;
    neckblue = tempNeckblue;
    headheight = tempHeadheight;
    headwidth = tempHeadwidth;
  }

  //human draws itself using display function
  void display () {

    //neck
    fill (neckred, neckblue, neckgreen); 
    rectMode (CENTER);
    rect (xposhead, yposhead + 50, 40, 150);

    //head changes color based on mouse position
    float distance = dist (xposhead, yposhead, mouseX, mouseY);
    fill (255 - distance/5, 137, 47);

    //head
    ellipse (xposhead, yposhead, headwidth, headheight);
    rectMode (CORNER);

    //glasses
    fill(255);
    rect (xposhead - 30, yposhead - 10, 20, 10);
    rect (xposhead + 10, yposhead -10, 20, 10);
    line (xposhead - 50, yposhead - 5, xposhead - 30, yposhead - 5); 
    line (xposhead + 50, yposhead - 5, xposhead + 30, yposhead - 5);
    line (xposhead - 10, yposhead - 5, xposhead + 10, yposhead - 5);
    fill (0);

    //eyes
    if ((dist (firsteyex, eyey, mouseX, mouseY)) > 300) {
      eyesize = 2;
    } 
    else if ((dist (firsteyex, eyey, mouseX, mouseY)) > 250) {
      eyesize = 3;
    } 
    else if ((dist (firsteyex, eyey, mouseX, mouseY)) > 200) {
      eyesize = 4;
    } 
    else if ((dist (firsteyex, eyey, mouseX, mouseY)) > 150) {
      eyesize = 5;
    } 
    else if ((dist (firsteyex, eyey, mouseX, mouseY)) > 100) {
      eyesize = 6;
    } 
    else if ((dist (firsteyex, eyey, mouseX, mouseY)) > 50) {
      eyesize = 7;
    } 
    else {
      eyesize = 10;
    }
    fill (0);
    ellipse (firsteyex, eyey, eyesize, eyesize);
    ellipse (secondeyex, eyey, eyesize, eyesize);
    //eyes move 
    firsteyex = map (mouseX, 0, width, xposhead - 30, xposhead - 10);
    eyey = map (mouseY, 0, height, yposhead - 10, yposhead);
    secondeyex =map (mouseX, 0, width, xposhead + 10, xposhead + 30);

    //nose
    line (xposhead, yposhead +7, xposhead - 7, yposhead +20);
    line (xposhead - 7, yposhead +20, xposhead, yposhead + 20);

    //mouth
    if ((dist (firsteyex, eyey, mouseX, mouseY)) > 300) {
      mouthwidth =30;
      mouthheight = 2;
    } 
    else if ((dist (firsteyex, eyey, mouseX, mouseY)) > 250) {
      mouthwidth = 30;
      mouthheight = 10;
    } 
    else if ((dist (firsteyex, eyey, mouseX, mouseY)) > 200) {
      mouthwidth = 10;
      mouthheight = 7;
    } 
    else if ((dist (firsteyex, eyey, mouseX, mouseY)) > 150) {
      mouthwidth = 10;
      mouthheight = 12;
    } 
    else if ((dist (firsteyex, eyey, mouseX, mouseY)) > 100) {
      mouthwidth = 10;
      mouthheight = 15;
    } 
    else if ((dist (firsteyex, eyey, mouseX, mouseY)) > 50) {
      mouthwidth = 10;
      mouthheight =20;
    } 
    else {
      mouthwidth = 15;
      mouthheight = 27;
    }

    ellipse (xposhead, yposhead + 35, mouthwidth, mouthheight);
  }
}
