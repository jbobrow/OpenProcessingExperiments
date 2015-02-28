
boolean flipFlop = false;
String keyPrompt = "press any key";
int eyeBallSize; //first place
int bgColor;
int glasses;
int fillColor;
int outEar;
int inEar;
int colorHair;
int beetlesHair;
int fillEye;
int neck;
int noseShape;
int mouthShapeOne;
int mouthShapeTwo;
int mouthShapeThree;
int chin;
int weirdHead;
int movePlanetOne;
int movePlanetTwo;
 
  
void setup(){
  size(300, 300);
  background(240,237,194);
  textSize(12);
}
  
void draw(){
  if (flipFlop == false){
    eyeBallSize = 50; //second place
    bgColor = 255;
    glasses = -5;
    fillColor = 176;
    outEar = 40;
    inEar = 20;
    colorHair = 74;
    beetlesHair = 50;
    fillEye = 0;
    neck = 250;
    noseShape = 50;
    mouthShapeOne = 72;
    mouthShapeTwo = 80;
    mouthShapeThree = 45;
    chin = 120;
    weirdHead = 150;
    movePlanetOne = -200;
    movePlanetTwo = -200;
  }
  if (flipFlop == true){
    eyeBallSize = 10; //third place
    bgColor = 40;
    glasses = -205;
    fillColor = 5; 
    outEar = 90;
    inEar = 50;
     colorHair = 305;
     beetlesHair = 90;
     fillEye = 326; 
     neck = 30;
     noseShape = 20;
     mouthShapeOne = -200;
     mouthShapeTwo = 20;
     mouthShapeThree = 5;
     chin = -200;
     weirdHead = 120;
     movePlanetOne = -120;
     movePlanetTwo = -130;
  }
  makeFace();
  smooth();
  text(keyPrompt,-145,-135);
}
  
void keyPressed(){
  flipFlop =! flipFlop;
  keyPrompt = ("");
}
  
void makeFace(){
  size(300, 300);
  noStroke();
  background(25,bgColor,130);
  rectMode(CENTER);
  translate(150,150);
   
 // head
  fill(224,fillColor,112);
  ellipse(-75, 0, outEar, 40);
  ellipse(75, 0, outEar, 40);
  fill(244,fillColor,132);
  rect(0, 0, weirdHead, 200, 40);
  ellipse(0, 100, neck, 200);  
  ellipse(-75, 0, inEar, 20);
  ellipse(75, 0, inEar, 20);
   
// hair
  fill(120,colorHair,30);
  rect(0, -75, 150, beetlesHair, 40, 40, 0, 0);
   
// eyes
  fill(255);
  stroke(0);
  ellipse(-37.5, 0, eyeBallSize, eyeBallSize); //fourth place
  ellipse(37.5, 0, eyeBallSize, eyeBallSize);
  fill(fillEye);
  ellipse(-37.5, 0, 15, 15);
  ellipse(37.5, 0, 15, 15);
  rect(1, glasses, 25.1, 2);
   
 // nose
  noFill();
  stroke(0);
  arc(0, 30, noseShape, 50, 0, PI);
  
 //mouth
 fill(255);
 ellipse(0, 90, mouthShapeTwo, mouthShapeThree);
 noStroke();
 fill(244,176,132);
 ellipse(0, mouthShapeOne, 60, 30);
  
 //chin
  noFill();
  stroke(0);
  arc(-20, chin, 50, 50, 0, PI);
   
  noFill();
  stroke(0);
  arc(30, chin, 50, 50, 0, PI);
  
 //planet
  fill(245,157,5);
  ellipse(107.5, movePlanetOne, 50, 50);
  fill(245,21,5);
  ellipse(120.5, movePlanetTwo, 10, 10);
  
}

