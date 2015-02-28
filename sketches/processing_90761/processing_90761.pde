
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/79178*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
//Paper Dolls - Alternate Version - now with OOP power

//I consulted the following while writing this code:
//Processing: A Programming Handbook for Visual Designeres and Artists, by Casey Reas and Ben Fry (2007)

//any numbers needed
float placeX, placeY; //used in randomizing the placement of dolls during the instances screen
int instanceNum = 199; // max number of instances during the instances screen - the higher the number, the more memory required, but the more fun you can have mashing the make one button
//declare our objects
Doll a, b, c, methodMan; // declare our object
Doll[] random = new Doll[instanceNum]; //this array will create randomly placed instances to fill the screen during the instantiation

//declare the types of screens we will have
boolean intro, define, defineTwo, instances, arguments, methods; // each of these arguments (and corresponding screens) represents a lesson
Screen text;
boolean[] instanceExists = new boolean[instanceNum];

//declares any buttons that will appear on the screen
Button letsMoveOn, makeInstance;

//these arrays will let you make various dance moves
int danceNum = 3;
String[] danceText = new String[danceNum];
Button[] danceMoves = new Button[danceNum];

//these arrays will let you review previous material
int reviewScreens = 4;
String[] reviewType = new String[reviewScreens];
Button[] reviewButton = new Button[reviewScreens];

//define any fonts
PFont bigFont, smallFont;

//These two strings determine the shape of your representation.
//Choose as you will - feel free to change the name
String male = "Alan";
String female = "Ada";
String moveOn = "Continue";
String instance = "Make One";

//declare any other variables
float mashCounter; //this counter will help us go through the different flags

//global variables for the variable screen

void setup() {
  //size of screen
  size(800, 600);
  //smooths out lines
  smooth();
  //provides the color of the background
  background(240);
  //sets up any fonts
  bigFont = createFont("Arial", 36, true);  
  smallFont = createFont("Arial", 24, true);
  //assign variables for our object - change the variables to change the basic look of the ball & where it is positioned
  //use male or female to determine gender and name - anything else will confuse the code.
  a = new Doll(male, #B92525, width/2, height/2, 100, 100);
  b = new Doll(male, #236FE5, width/2, height/2, 100, 100);
  c = new Doll(male, #236FE5, width/2, height/2, 100, 100);
  methodMan = new Doll(male, #B92525, width/2, height/2, 100, 100);
  text = new Screen(male, bigFont, smallFont);
  letsMoveOn = new Button (width-100, height-100, 100, 50, #7B64FF, moveOn);
  makeInstance = new Button (width*.5, height*.6, 120, 120, #AE2EFF, instance);
  //everything related the methods/dance screen
  danceText[0] = "To the Left";
  danceText[1] = "To the Right";
  danceText[2] = "Now Kick";
  danceMoves[0] = new Button (width*.2, height*.53, 180, 70, #AE2EFF, danceText[0]);
  danceMoves[1] = new Button (width*.2, height*.73, 180, 70, #AE2EFF, danceText[1]);
  danceMoves[2] = new Button (width*.2, height*.93, 180, 70, #AE2EFF, danceText[2]);
  //initializing button color
  danceMoves[0].setupColor();
  danceMoves[1].setupColor();
  danceMoves[2].setupColor();
  makeInstance.setupColor();
  //setting up review buttons & initializing color
  reviewType[0] = "Introduction";
  reviewType[1] = "Instances";
  reviewType[2] = "Variables";
  reviewType[3] = "Methods";
  reviewButton[0] = new Button (width*.35, height*.5, 180, 120, #AE2EFF, reviewType[0]);
  reviewButton[1] = new Button (width*.35, height*.75, 180, 120, #AE2EFF, reviewType[1]);
  reviewButton[2] = new Button (width*.65, height*.5, 180, 120, #AE2EFF, reviewType[2]);
  reviewButton[3] = new Button (width*.65, height*.75, 180, 120, #AE2EFF, reviewType[3]);
  reviewButton[0].setupColor();
  reviewButton[1].setupColor();
  reviewButton[2].setupColor();
  reviewButton[3].setupColor();
  //setting up variables so that they are given proper values (meaning they only are valued as this once and can be changed later using methods)
  a.setupDoll();
  b.setupDoll();
  c.setupDoll();
  a.waveSetup();
  a.variableSetup();
}

void draw() {
  background(240);
  //letsMoveOn.buttonDraw();
  //draw the doll and any text screens relating to the doll
  if (mashCounter==0) { //this draws the intro screen
    text.writeIntro();
    pushMatrix();
    scale(.5);
    translate(width/2, -height/4);
    a.wave();
    popMatrix();
  }
  if (mashCounter==1) { //this draws the first screen defining OOP
    text.defineOOP1();
    pushMatrix();
    translate(-width/4, -height/8);
    a.wave();
    popMatrix();
  }
  if (mashCounter==2) {
    pushMatrix();
    translate(-width/4, -height/8);
    a.wave();
    popMatrix();
    text.defineOOP2();
  } 
  if (mashCounter ==3) { //in this screen a button lets you create an unlimited number of dolls by pressing the create button, graphically explaining instances
    text.instances(); 
    makeInstance.buttonDraw();
    for (int i = 1; i<makeInstance.mashCounter(); i = i+1 ) {
      random[i].make();
    }
    makeInstance.buttonDraw();
  }
  if (mashCounter ==4) {
    makeInstance.reset();
    pushMatrix();
    scale(.75, .75);
    translate(width*.55, height*.15);
    b.make();
    popMatrix();
    pushMatrix();
    scale(.75, .75);
    translate(width*-.25, height*.15);
    c.make();
    popMatrix();
    a.drawVariables();
    text.variables();
  }
  if (mashCounter==5) {
    text.methods();
    println(danceMoves[0].mashCounter()+" and "+danceMoves[1].mashCounter()+" and "+danceMoves[2].mashCounter());
    if (danceMoves[0].mashCounter()%2 ==0) {
      if (danceMoves[1].mashCounter()%2 ==0) {
        if (danceMoves[2].mashCounter()%2 ==0) {
          danceMoves[0].buttonDraw();
          danceMoves[1].buttonDraw();
          danceMoves[2].buttonDraw();
          pushMatrix();
          scale(.6, .6);
          translate(width*.52, height*.49);
          //methodMan.clearChanges();
          methodMan.make();
          popMatrix();
          danceMoves[0].bumpCounter();
          danceMoves[1].bumpCounter();
          danceMoves[2].bumpCounter();
          methodMan.dancingIsForbidden();
        }
      }
    }
    if (danceMoves[0].mashCounter() > 1 && danceMoves[0].mashCounter() %2 ==1) {
      pushMatrix();
      scale(.6, .6);
      translate(width*.52, height*.49);
      methodMan.toTheLeft(); 
      popMatrix();
      danceMoves[0].turnOn();
      danceMoves[1].buttonDraw();
      danceMoves[2].buttonDraw();
      danceMoves[1].putBabyInACorner();
      danceMoves[2].putBabyInACorner();
    }
    else if (danceMoves[1].mashCounter() > 1 && danceMoves[1].mashCounter() %2 ==1) {
      pushMatrix();
      scale(.6, .6);
      translate(width*.52, height*.49);
      methodMan.toTheRight(); 
      popMatrix();
      danceMoves[1].turnOn();
      danceMoves[0].buttonDraw();
      danceMoves[2].buttonDraw();
      danceMoves[0].putBabyInACorner();
      danceMoves[2].putBabyInACorner();
    }
    else if (danceMoves[2].mashCounter() > 1 && danceMoves[2].mashCounter() %2 ==1) {
      pushMatrix();
      scale(.6, .6);
      translate(width*.52, height*.49);
      methodMan.nowKick(); 
      popMatrix();
      danceMoves[2].turnOn();
      danceMoves[0].buttonDraw();
      danceMoves[1].buttonDraw();
      danceMoves[1].putBabyInACorner();
      danceMoves[0].putBabyInACorner();
    }
  }
  if ( mashCounter == 6) {
    text.finishHim();
    reviewButton[0].buttonDraw();
    reviewButton[1].buttonDraw();
    reviewButton[2].buttonDraw();
    reviewButton[3].buttonDraw();
    if (reviewButton[0].mashCounter()>=1) {
      mashCounter = 0;
      reviewButton[0].reset();
      reviewButton[1].reset();
      reviewButton[2].reset();
      reviewButton[3].reset();
    }
    if (reviewButton[1].mashCounter()>=1) {
      mashCounter=3;
      reviewButton[0].reset();
      reviewButton[1].reset();
      reviewButton[2].reset();
      reviewButton[3].reset();
    }
    if (reviewButton[2].mashCounter()>=1) {
      mashCounter=4;
      reviewButton[0].reset();
      reviewButton[1].reset();
      reviewButton[2].reset();
      reviewButton[3].reset();
    }
    if (reviewButton[3].mashCounter()>=1) {
      mashCounter = 5;
      reviewButton[0].reset();
      reviewButton[1].reset();
      reviewButton[2].reset();
      reviewButton[3].reset();
    }
    if (mashCounter>6) {
      mashCounter = 6;
      reviewButton[0].reset();
      reviewButton[1].reset();
      reviewButton[2].reset();
      reviewButton[3].reset();
    }
  }
}
//press M and you continue in the program
void keyReleased() {
  if ((key == 'm' || key == 'M' )) {
    mashCounter++;
  }
}
void mouseReleased() {
  makeInstance.buttonMash();
  if (mashCounter==3) {
    instanceExists[makeInstance.mashCounter()] = true;
    randomizePlacement();
    random[makeInstance.mashCounter()] = new Doll (male, #B92525, placeX, placeY, 100, 100);
    random[makeInstance.mashCounter()].setupDoll();
  }
  if (mashCounter==5) {
    //a.dancingIsForbidden(); 
    // danceMoves[0].putBabyInACorner();
    // danceMoves[1].putBabyInACorner();
    //danceMoves[2].putBabyInACorner();
  }
  if (mashCounter==6) {

    if (mouseX<width*.5) {

      if (mouseY<height*.65) {

        reviewButton[0].buttonMash();
      } 
      else {
        reviewButton[1].buttonMash();
      }
    } 
    else {
      if (mouseY<height*.65) {
        reviewButton[2].buttonMash();
      } 
      else {
        reviewButton[3].buttonMash();
      }
    }
  }
}
void randomizePlacement() {
  placeX = random(0, width);
  placeY = random(height/2, height);
}
void mouseDragged() {
  if (mashCounter ==4) {
    if (mousePressed) {
      //waist joint
      //if (mouseX >=a.waistX() -a.pressurePoint() && mouseX<=a.waistX() +a.pressurePoint()) {
      // if (mouseY >=a.waistY() -a.pressurePoint() && mouseY<=a.waistY() +a.pressurePoint()) {

      // a.dragWaist();
      // }
      // }
      //head - x values - manipulate the width of the head
      //if (mouseX >=headWidthPointX-pressurePointRad && mouseX <=headWidthPointX+pressurePointRad) {
      //if (mouseY>=headWidthPointY-pressurePointRad && mouseY<=headWidthPointY+pressurePointRad) {
      //headSizeX = brainX+headSizeX*.5-mouseX;
      //headWidthPointX = mouseX;
      //}
      //}
      //head - y values - manipulate the width of the head
      if (mouseX>=a.headLengthX()-a.pressurePoint() && mouseX<=a.headLengthX()+a.pressurePoint()) {
       // if (mouseY>=a.headLengthY()-a.pressurePoint() && mouseY<=a.headLengthY()+a.pressurePoint()) {
          a.dragChin();
       // }
      }
      //if (mouseX>=a.headWidthX()-a.pressurePoint() && mouseX<=a.headWidthX()+a.pressurePoint()) {
        if (mouseY>=a.headWidthY()-a.pressurePoint() && mouseY<=a.headWidthY()+a.pressurePoint()) {
          a.dragEar();
        }
     // }
      if (mouseY>=a.waistY()-a.pressurePoint() && mouseY<=a.waistY()+a.pressurePoint()) {
        a.dragWaist();
      }
    }
  }
  // }
  // }
}
void mousePressed() {
  if (mashCounter == 5) {
    if (mouseY<height*.53+70) {
      danceMoves[0].buttonMash();
    }
    if (mouseY>height*.73-70 && mouseY<height*.73+70) {
      danceMoves[1].buttonMash();
    }
    if (mouseY>height*.93-70) {
      danceMoves[2].buttonMash();
    }
  }
}

class Button {
  float xPos, yPos, howWide, howTall;
  color shading, shade;
  String text;
  int counter = 0;
  Button(float x, float y, float xLong, float yLong, color pretty, String words) {
    xPos = x;
    yPos = y;
    howWide = xLong;
    howTall = yLong;
    shade = pretty;
    text = words;
  }
  
  void setupColor() {
   shading = shade; 
  }

  void buttonDraw() {
    fill(shading);
    stroke(0);
    rectMode(CENTER);
    rect(xPos, yPos, howWide, howTall, 7);
    fill(0);
    textAlign(CENTER, CENTER);
    text(text, xPos, yPos);
    fill(shading);
  }
  void buttonMash() {
    if (mouseX>xPos-howWide || mouseX<xPos+howWide) {
      if (mouseY>yPos-howTall || mouseY<yPos+howWide) {
        counter = counter+1;
      }
    }
  }
  int mashCounter() {
    int mashCounter = counter;
    return(mashCounter);
  }
  void turnOn() {
     shading = shade;
     
    if (counter%2 == 1) {
  shading = #CE1D1D; //red
    } 
    buttonDraw(); 
    shading = shade;
 
  }
  void putBabyInACorner() { //no one puts baby in a corner except me - a method to stop all the dancing by reducing all mash Counters to zero
   counter = 2; 
  }
  void bumpCounter() { // increases the counter value so that dancing can start as soon as the first button is pressed
   counter = 2; 
  }
  void reset() {
    counter = 0;
  }
}

//this tab will have everything relating to the doll as an object. Here you'll find the class declaration, the constructor, all of the custom functions, everything you need to change the ball
//to change the appearance of the ball, scroll to the "make" function
//to give the doll new animations, add a new custom function
//to make the figure female, look for Ada
//to make a male figure, look for Alan

class Doll { // this is the class name
  float brainX, brainY, diameterX, diameterY; // these are all of the variables that we can change when we declare the object
  color shade;
  String gender;

  //sizing the neck
  float neckWidth; //thickness of the neck
  float neckLength; //length of the neck

  //giving the neck location variables based on the head
  float neckStartsX;
  float neckStartsY;

  //things I'd ideally like people to be able to change
  float innerCurve; //this determines how thin the waist is - the bigger the value, the more extreme the waist size
  float waistSize;

  //CURVES, how I loathe them
  float shoulders;// the width of the shoulders - bigger the value, the thicker the body
  float torsoLength; //the length of the body
  float leftCurveStartX; //leftmost point X
  float leftCurveStartY; //leftmost top point Y - the higher the value, the further the body will be from the head
  float leftCurveStopX; //leftmost point X
  float leftCurveStopY; //leftmost bottom point Y
  float rightCurveStartX; //rightmost point X
  float rightCurveStartY; //rightmost top point Y
  float rightCurveStopX;//rightmost point X
  float rightCurveStopY; //leftmost bottom point Y

    //Mii-Style hand balls
  float leftHandX;
  float rightHandX;
  float leftHandY;
  float rightHandY;
  float handSize;

  //Mii-Style foot balls
  float leftFootX;
  float rightFootX;
  float leftFootY;
  float rightFootY;
  float footSize;

  //waists - they do not lie. Unlike hips. 
  float waistX = rightCurveStartX-innerCurve;
  float waistY = rightCurveStartY+torsoLength*.5;
  //bottom
  float bottomHalf;

  //dance variables
  //for arms
  float danceSpeed = 1;
  float danceDirection = 1;
  //for head and body
  int bopSpeed=5;
  int bopDirection=1;
  //step counter 
  int danceStepsLeft = 0;
  int danceStepsRight = 0;
  //for kicking
  int kickSpeed = 5;
  int kickDirection = 1;
  boolean kickLeft = true;
  boolean kickRight = false;

  //waving variables
  float waveDirection = 1;
  float waveSpeed = 1;

  //variable stuff
  //pressure points
  float pressurePointRad;
  //head - x value
  float headWidthPointX;
  float headWidthPointY;

  //head - y value 
  float headLengthPointX;
  float headLengthPointY;
  
  //variables indicating change in values, so that variables can be reset later
  float changeX, changeY;
  

  Doll(String sex, color tone, float xSpot, float ySpot, float diamX, float diamY) { 
    //this is the constructor, it assures us that the value assignments we give in the drawing code will associate with the proper variables
    gender = sex;
    brainX = xSpot;
    brainY = ySpot;
    diameterX = diamX;
    diameterY =diamY;
    shade = tone;
  }

  void setupDoll() {
    //these are variables that need declaration/definition but don't need to be individually declared when declaring the object
    //the value of these variables are determined based on what you declared
    //feel free to experiment with changing ratios in the setupDoll function

    //sizing the neck
    neckWidth = diameterX*.4; //thickness of the neck
    neckLength = diameterY; //length of the neck

    //giving the neck location variables based on the head
    neckStartsX = brainX;
    neckStartsY = brainY+(diameterY*.75);

    //things I'd ideally like people to be able to change
    innerCurve= diameterX*.5; //this determines how thin the waist is - the bigger the value, the more extreme the waist size

    //CURVES, how I loathe them
    shoulders = diameterX*1.5;// the width of the shoulders - bigger the value, the thicker the body
    torsoLength = diameterY*2; //the length of the body
    leftCurveStartX = brainX- shoulders*.5; //leftmost point X
    leftCurveStartY = brainY+(neckLength*.75); //leftmost top point Y - the higher the value, the further the body will be from the head
    leftCurveStopX = leftCurveStartX; //leftmost point X
    leftCurveStopY = leftCurveStartY+torsoLength; //leftmost bottom point Y
    rightCurveStartX = brainX+ shoulders*.5; //rightmost point X
    rightCurveStartY = leftCurveStartY; //rightmost top point Y
    rightCurveStopX =rightCurveStartX;//rightmost point X
    rightCurveStopY = rightCurveStartY+torsoLength; //leftmost bottom point Y

    //Mii-Style hand balls
    leftHandX = brainX - (shoulders*.75);
    rightHandX = brainX + (shoulders*.75);
    leftHandY = brainY + torsoLength*.75;
    rightHandY = brainY + torsoLength*.75;
    handSize = diameterX*.5;

    //Mii-Style foot balls
    footSize = diameterX*.6;
    leftFootX = brainX - (shoulders*.35);
    rightFootX = brainX + (shoulders*.35);
    leftFootY = brainY + torsoLength*1.6;
    rightFootY = brainY + torsoLength*1.6;

    //waists - they do not lie. Unlike hips. 
    waistX = rightCurveStartX-innerCurve;
    waistY = rightCurveStartY+torsoLength*.5;

    //bottom half
    bottomHalf = shoulders*.5;


    //this code determines the color
    fill(shade);
    //this determines the color of the outline - I'm leaving it black & unchangeable, but you don't have to
    stroke(0);
    
    //pressure points
  pressurePointRad=20;
  //head - x value
  headWidthPointX = brainX+diameterX*.5;
  headWidthPointY = brainY;

  //head - y value 
  headLengthPointX = brainX;
  headLengthPointY = brainY+diameterY*.5;
  
  //sets value of changed variables to zero
  changeX = 0;
  changeY = 0;
  }

  void make() {

    //sets how Processing will read the ellipse and rectangle functions. Switch around and your doll will turn Picasso
    rectMode(CENTER);
    ellipseMode(CENTER);
    fill(shade);
    stroke(0);

    //THIS IS WHERE THE DRAWING BEGINS
    //I CANNOT STRESS THIS ENOUGH

    if (gender == female) {
      //this is the female coe
      //CHANGE FEMALE CHARACTERISTICS HERE

      //this draws the doll
      //neck
      rect(neckStartsX, neckStartsY, neckWidth, neckLength);



      //body

      //curves, which I hate, die curves die
      beginShape();
      // left curve
      vertex(leftCurveStartX, leftCurveStartY); //sets the left shoulder
      curveVertex(leftCurveStartX, leftCurveStartY); //guiding point
      curveVertex(leftCurveStartX, leftCurveStartY); //first actual point
      curveVertex(leftCurveStartX+innerCurve, leftCurveStartY+torsoLength*.5);//waist 
      curveVertex(leftCurveStopX, leftCurveStopY); //moves back to the left
      curveVertex(leftCurveStopX, leftCurveStopY);  //guiding point
      vertex(leftCurveStopX, leftCurveStopY); //sets the bottom left point


      // right curve
      vertex(rightCurveStopX, rightCurveStopY); //right bottom point
      curveVertex(rightCurveStopX, rightCurveStopY); //guiding point
      curveVertex(rightCurveStopX, rightCurveStopY); //bottom right point
      curveVertex(rightCurveStartX-innerCurve, rightCurveStartY+torsoLength*.5);//waist
      curveVertex(rightCurveStartX, rightCurveStartY); //top right point
      curveVertex(rightCurveStartX, rightCurveStartY); //guiding point
      vertex(rightCurveStartX, rightCurveStartY); //sets the right shoulder

      //give the shoulders a small amount of curve...hopefully
      curveVertex(rightCurveStartX, rightCurveStartY); //guiding point
      curveVertex(rightCurveStartX, rightCurveStartY);
      curveVertex(brainX, rightCurveStartY-2); //puts a touch of curve, making the shoulders
      curveVertex(leftCurveStartX, leftCurveStartY); 
      curveVertex(leftCurveStartX, leftCurveStartY); //guiding point

      vertex(leftCurveStartX, leftCurveStartY); //finishes the shape using the first point

      endShape();

      //hands
      ellipse(leftHandX, leftHandY, handSize, handSize);
      ellipse(rightHandX, rightHandY, handSize, handSize);

      //feet
      ellipse(leftFootX, leftFootY, footSize, footSize);
      ellipse(rightFootX, rightFootY, footSize, footSize);

      //head
      ellipse(brainX, brainY, diameterX, diameterY);
    } 
    else {
      //this is the male code

        //CHANGE MALE CHARACTERISTICS HERE

      //this draws the doll
      //neck
      rect(neckStartsX, neckStartsY, neckWidth, neckLength);

      //body - the female shape focuses on making the waist, meanwhile this guy focuses on hips

      //curves, which I hate, die curves die
      beginShape();
      // left curve
      vertex(leftCurveStartX, leftCurveStartY); //sets the left shoulder
      curveVertex(leftCurveStartX, leftCurveStartY); //guiding point
      curveVertex(leftCurveStartX, leftCurveStartY); //first actual point
      curveVertex(leftCurveStartX+innerCurve, leftCurveStartY+torsoLength*.5);//hip 
      vertex(leftCurveStartX+innerCurve, leftCurveStartY+torsoLength*.5); //guiding point


      // right curve
      vertex(rightCurveStartX-innerCurve, rightCurveStartY+torsoLength*.5); //right bottom point
      curveVertex(rightCurveStartX-innerCurve, rightCurveStartY+torsoLength*.5); //guiding point
      curveVertex(rightCurveStartX-innerCurve, rightCurveStartY+torsoLength*.5);//hip
      curveVertex(rightCurveStartX, rightCurveStartY); //top right point
      curveVertex(rightCurveStartX, rightCurveStartY); //guiding point
      vertex(rightCurveStartX, rightCurveStartY); //sets the right shoulder


      //give the shoulders a small amount of curve...hopefully
      curveVertex(rightCurveStartX, rightCurveStartY); //guiding point
      curveVertex(rightCurveStartX, rightCurveStartY);
      curveVertex(brainX, rightCurveStartY-2); //puts a touch of curve, making the shoulders
      curveVertex(leftCurveStartX, leftCurveStartY); 
      curveVertex(leftCurveStartX, leftCurveStartY); //guiding point

      vertex(leftCurveStartX, leftCurveStartY); //finishes the shape using the first point

      endShape();

      //bottom half
      rectMode(CORNER);
      rect(leftCurveStartX+innerCurve, leftCurveStartY+torsoLength*.5, shoulders-innerCurve*2, bottomHalf);      

      //hands
      ellipse(leftHandX, leftHandY, handSize, handSize);
      ellipse(rightHandX, rightHandY, handSize, handSize);

      //feet
      ellipse(leftFootX, leftFootY, footSize, footSize);
      ellipse(rightFootX, rightFootY, footSize, footSize);
      //head
      ellipse(brainX, brainY, diameterX, diameterY);

      fill(shade);
    }
  }
  void shakeHand() { //we want people to be able to grab the hand and "shake it" by holding down the mouse button
    make();
    if (mouseX> brainX && mouseX<brainX+200) {
      rightHandX = mouseX;
      rightHandY = mouseY;
    } 
    else if (mouseX< brainX && mouseX>brainX-200) {
      leftHandX = mouseX;
      leftHandY = mouseY;
    }
  }
  void waveSetup() {
    leftHandX = brainX-100;
    leftHandY = brainY;
  }
  void wave() {
    make();
    leftHandX = leftHandX+waveSpeed*waveDirection;
    leftHandY = leftHandY+ waveSpeed*.5*waveDirection;
    if (leftHandX < brainX-150 || leftHandX >brainX-diameterX) {
      waveDirection=waveDirection*-1;
    }
  }
  void dance() {
    make();
    //putting hands in the air, like we just don't care
    leftHandX = leftHandX + danceSpeed*danceDirection;
    rightHandX = rightHandX + danceSpeed*danceDirection;
    if (leftHandX < brainX-150 || leftHandX >brainX-diameterX) {
      danceDirection=danceDirection*-1;
    }
    //whip his/her hair back and forth, whip his/her hair back and forth
    brainY = brainY +bopSpeed*bopDirection;
    if (brainY > leftCurveStartY-diameterY*.65 || brainY < neckStartsY-diameterY*.75) {
      bopDirection = bopDirection*-1;
    }
  }

  void variableSetup() {
    //head - x value
    headWidthPointX = brainX+diameterX*.5;
    headWidthPointY = brainY;

    //head - y value 
    headLengthPointX = brainX;
    headLengthPointY = brainY+diameterY*.5;
    
    //waist
    waistX = rightCurveStartX-innerCurve;
    waistY = rightCurveStartY+torsoLength*.5;
  }

  void drawVariables() { //this method draws a doll with pressure points, which you can use to change variables
    make();
    //draw pressure points
    fill(#3A00FF);
    ellipse(waistX, waistY, pressurePointRad, pressurePointRad); //waist joint
    ellipse(headWidthPointX, headWidthPointY, pressurePointRad, pressurePointRad);// x value of head
    ellipse(headLengthPointX, headLengthPointY, pressurePointRad, pressurePointRad);// y value of head
}
  void dragVariables() { 
    //animation allows people to "pull" on pressure points, 
    //changing value of certain variables

      if (mouseX >=waistX -pressurePointRad && mouseX<=waistX +pressurePointRad) {
      if (mouseY >=waistY -pressurePointRad && mouseY<=waistY +pressurePointRad) {

        innerCurve = rightCurveStopX-mouseX;
        waistX = mouseX;
      }
    }
    //head - x values - manipulate the width of the head
    if (mouseX >=headWidthPointX-pressurePointRad && mouseX <=headWidthPointX+pressurePointRad) {
      if (mouseY>=headWidthPointY-pressurePointRad && mouseY<=headWidthPointY+pressurePointRad) {
        diameterX = brainX+diameterX*.5-mouseX;
        headWidthPointX = mouseX;
      }
    }
    //head - y values - manipulate the width of the head
    if (mouseX >=headLengthPointX-pressurePointRad && mouseX <=headLengthPointX+pressurePointRad) {
      if (mouseY>=headLengthPointY-pressurePointRad && mouseY<=headLengthPointY+pressurePointRad) {
        diameterY = brainY+diameterY*.5-mouseY;
        headLengthPointY = mouseY;
      }
    }
  }
  //these are methods for the methods screen. All three will be connected to buttons to execute them at will
  void toTheLeft() {
    pushMatrix();

    danceStepsLeft= danceStepsLeft+bopSpeed*bopDirection;


    leftFootX = leftFootX-danceSpeed*danceDirection;
    rightFootX = rightFootX+danceSpeed*danceDirection;
    if (leftFootX < leftCurveStopX || leftFootX> brainX) {
      danceDirection = danceDirection*-1;
    } 

    if (brainX< width*.35 || brainX>width*.9) {
      bopDirection = bopDirection*-1;
    }
    translate(0-danceStepsLeft, 0);
    make();
    popMatrix();
  }
  void toTheRight() {
    danceStepsRight= danceStepsRight+bopSpeed*bopDirection;
    pushMatrix();

    leftFootX = leftFootX+danceSpeed*danceDirection;
    rightFootX = rightFootX-danceSpeed*danceDirection;
    if (rightFootX > rightCurveStopX || rightFootX< brainX) {
      danceDirection = danceDirection*-1;
    }
    if (brainX< width*.35 || brainX>width*.9) {
      bopDirection = bopDirection*-1;
    }
    translate(0+danceStepsRight, 0);
    make();
    popMatrix();
  }
  void nowKick() {
    make();
    if (kickLeft == true) {
      leftFootX = leftFootX - kickSpeed*kickDirection;
      leftFootY = leftFootY - kickSpeed*kickDirection;
      if (leftFootX < leftHandX || leftFootY>rightFootY) {
        kickDirection = kickDirection*-1;
      }
    } 
    else if (kickRight == true) {
      rightFootX = rightFootX + kickSpeed*kickDirection;
      rightFootY = rightFootY - kickSpeed*kickDirection;
      if (rightFootX > rightHandX || rightFootY>leftFootY) {
        kickDirection = kickDirection*-1;
      }
    }
  }
  void dancingIsForbidden() {
    setupDoll();
    danceStepsLeft=0;
    danceStepsRight=0;
    //kickDirection = 1;
    if ( kickLeft == true) {
      kickLeft = false;
      kickRight = true;
    }
    else if (kickRight = true) {
      kickLeft = true;
      kickRight = false;
    }
  }
  //we'll have local variables return so that we can do the mousePressed thing
  float headLengthY() {
  
  headLengthPointY = brainY+diameterY*.5;
    return(headLengthPointY);
  }
  float headLengthX() {
    headLengthPointX = brainX;
    return(headLengthPointX);
  }
  float headWidthY() {
     headWidthPointY = brainY;
   return (headWidthPointY);
  }
  float headWidthX() {
    headWidthPointX = brainX+diameterX*.5;
    return (headWidthPointX);
  }
  float waistY() {
    waistY = rightCurveStartY+torsoLength*.5;
   return (waistY); 
  }
  float waistX() {
    waistX = rightCurveStartX-innerCurve;
   return(waistX); 
  }
  float pressurePoint() {
   return (pressurePointRad); 
  }
  void dragChin() {
    changeY = mouseY;
   diameterY = brainY+diameterY*.5-changeY;
   headLengthPointY = mouseY; 
  }
  void dragEar() {
    changeX = mouseX;
   diameterX = brainX+diameterX*.5-changeX;
   headWidthPointX = mouseX; 
  }
  void dragWaist() {
    changeX = mouseX;
    innerCurve = rightCurveStopX-changeX;
    waistX = mouseX;
  }
  void clearChanges() {
    if(changeX > 0 || changeX < 0) {
      rotate(radians(180));
    }
    setupDoll();
  }
}

//This segment will be used to organize words on the screen. Any text content and positioning can be edited here. 

class Screen {
  boolean type;
  PFont littleF, bigF;
  String gender;

  //universal text 
  String pressMToContinue = "Press M to continue.";

  //any text on the intro screen
  String introOne = "Object-Oriented Processing";
  String introTwo = "By Tracy Carlin";
  String introThree = "Georgetown University";
  String introFour = "Spring 2013";

  //any text on the definition screen
  String defineOne = "Hi guys! Meet "+female+".";
  String defineTwo = female+" is made using";
  String defineThree = "Object-Oriented";
 String defineFour = "Programming,";
  String defineFive = "or OOP.";
  String defineSix = "OOP represents";
  String defineSeven = "concepts as 'objects,'";
  String defineEight = "which can have their";
  String defineNine = "own data and procedures.";
  String defineTen = "Let's explore";
  String defineEleven = "how they work.";

  String defineOneMale = "Hi guys! Meet "+male+".";
  String defineTwoMale = male+" is made using";
  
  //any text on the variance screen
  String varianceOne = "Objects work like complex custom functions.";
  String varianceTwo = "You can pass arguments";
  String varianceThree = "and create multiple variants.";
  String varianceFourFemale = "Make many "+female+"s using the button.";
  String varianceFourMale ="Make many "+male+"s using this button.";

//any text for the variable screen
String variableOne = "Each object behaves on its own.";
String variableTwoFemale = "For example, watch these "+female+"s.";
String variableTwoMale = "For example, watch these "+male+"s.";
String variableThree = "Change the variables on one.";
String variableFour = "It won't affect the other.";
String variableFive = "";
String variableSix = "";

//any text for the methods screen

String methodOne = "Objects can also execute methods.";
String methodTwo = "Each object executes customized functions";
String methodThree = "without affecting others.";
String methodFour = "Experiment with methods using these buttons.";
String methodFive = "The doll will only execute what is 'on.'";
String methodSix = "";
String methodSeven = "";

//end screen
String finishOne = "That's the basics!";
String finishTwo = "What kind of objects will you make?";
String finishThree = "Hit the buttons to review anything.";
//String finishFour
//String finishFive
//String finishSix

  Screen(String sex, PFont fontUno, PFont fontDos) {
    //constructor
    gender = sex;
    bigF = fontUno;
    littleF = fontDos;
    textAlign(CENTER);
  }

  void writeIntro() {
    fill(0);
    textAlign(CENTER);
      textFont(bigFont);
      text(introOne, width/2, height/2);
      text(introTwo, width/2, height/2+50);
      text(introThree, width/2, height/2+100);
      text(introFour, width/2, height/2+150);
      textFont(smallFont);
      text(pressMToContinue, width/2, height-10);
    
  }

  void defineOOP1() {
    fill(0);
      if (gender == male) {
         textFont(bigFont);
         textAlign(CENTER);
        text(defineOneMale, width/2, height/8);
        textAlign(RIGHT);
        text(defineTwoMale, width-50, height/3);
        text(defineThree,width-50,height/3+50);
        text(defineFour, width-50, height/3+100);
        text(defineFive, width-50, height/3+150);
        textFont(smallFont);
        textAlign(CENTER);
        text(pressMToContinue, width/2, height-10);
      }
      if (gender == female) {
        fill(0);
         textFont(bigFont);
         textAlign(CENTER);
        text(defineOne, width/2, height/8);
        textAlign(RIGHT);
        text(defineTwo, width-50, height/3);
        text(defineThree,width-50,height/3+50);
        text(defineFour, width-50, height/3+100);
        text(defineFive, width-50, height/3+150);
        textFont(smallFont);
        textAlign(CENTER);
        text(pressMToContinue, width/2, height-10);
      }
    }
     void defineOOP2() {
       fill(0);
        textFont(bigFont);
         textAlign(CENTER);
        text(defineSix, width*.7, height/3);
        text(defineSeven, width*.7, height/3+50);
        text(defineEight, width*.7, height/3+100);
        text(defineNine, width*.7, height/3+150);
        text(defineTen, width*.7, height/3+200);
        text(defineEleven, width*.7, height/3+250);
        textFont(smallFont);
        textAlign(CENTER);
        text(pressMToContinue, width/2, height-10);
     }
     void instances() {
        fill(0);
        textFont(bigFont);
         textAlign(CENTER);
        text(varianceOne, width*.5, height/7);
        text(varianceTwo, width*.5, height/7+50);
        text(varianceThree, width*.5, height/7+100);
        if (gender == female) {
        text(varianceFourFemale, width*.5, height/7+150);
        }
        if (gender == male) {
          text(varianceFourMale, width*.5, height/7+150);
        }
        //text(varianceFive, width*.5, height/7+200);
        textFont(smallFont);
        textAlign(CENTER);
        text(pressMToContinue, width/2, height-10);
     }
     void variables() {
       fill(0);
        textFont(bigFont);
         textAlign(CENTER);
        text(variableOne, width*.5, height/7);
        if (gender == female) {
        text(variableTwoFemale, width*.5, height/7+50);
        }
        if (gender == male) {
          text(variableTwoMale, width*.5, height/7+50);
        }
        text(variableThree, width*.5, height/7+100);
        text(variableFour, width*.5, height/7+150);
        //text(variableOne, width*.5, height/7);
        //text(variableOne, width*.5, height/7);
        textFont(smallFont);
        textAlign(CENTER);
        text(pressMToContinue, width/2, height-10);
     }
     void methods() {
     fill(0);
    textAlign(CENTER);
      textFont(bigFont);
      text(methodOne, width/2, height/8);
      text(methodTwo, width/2, height/8+50);
      text(methodThree, width/2, height/8+100);
      text(methodFour, width/2, height/8+150);
      text(methodFive, width/2, height/8+200);
      textFont(smallFont);
      text(pressMToContinue, width/2, height-10);
     }
     
     void finishHim() {
       fill(0);
    textAlign(CENTER);
      textFont(bigFont);
      text(finishOne, width*.5, height/6);
      text(finishTwo, width*.5, height/6+50);
      text(finishThree, width*.5, height/6+100);
     }
  }



