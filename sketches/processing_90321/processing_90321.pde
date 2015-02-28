
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/79178*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
//Paper Dolls - Ada Version

//universal variables
//where the head will center
float brainX = 200;
float brainY = 200;
//sizing the head
float headSizeX = 80;
float headSizeY = 80;
//rightmost point of head and bottom point of head
float rightMostPoint = brainX+headSizeX*.5;
float lowestPoint = brainY+headSizeY;
//sizing the neck
float neckX = headSizeX*.15; //thickness of the neck
float neckY = headSizeY*.75; //length of the neck
//giving the neck location variables based on the head
float neckStarts = brainX-neckX;
float neckStartsY = brainY-headSizeY*.5;

//CURVES, how I loathe them
float shoulders = 100;// the width of the shoulders
float torsoLength = 200; //the length of the shoulders
float leftCurveStartX = brainX- shoulders*.5; //leftmost point X
float leftCurveStartY = brainY+neckY; //leftmost top point Y
float leftCurveStopX = leftCurveStartX; //leftmost point X
float leftCurveStopY = leftCurveStartY+torsoLength; //leftmost bottom point Y
float rightCurveStartX = brainX+ shoulders*.5; //rightmost point X
float rightCurveStartY = leftCurveStartY; //rightmost top point Y
float rightCurveStopX =rightCurveStartX;//rightmost point X
float rightCurveStopY = rightCurveStartY+torsoLength; //leftmost bottom point Y

//joints
float jointSize = 30;

//arms
float leftElbowStartX = leftCurveStartX -50;
float leftElbowStartY = leftCurveStartY + 100;
float rightElbowStartX = rightCurveStartX + 50;
float rightElbowStartY = rightCurveStartY + 100;

//Mii-Style hand balls
float handSize = 40;

//Mii-Style foot balls
float footSize = 40;

//things I'd ideally like people to be able to change
float innerCurve= 20;
float waistSize;

//legs
float legWidth=25;
float legLength=60;

//pressure points
float pressurePointRad=10;
//waists - they do not lie. 
float waistX = rightCurveStartX-innerCurve;
float waistY = rightCurveStartY+torsoLength*.5;
//head - x value
float headWidthPointX = brainX+headSizeX*.5;
float headWidthPointY = brainY;

//head - y value 
float headLengthPointX = brainX;
float headLengthPointY = brainY+headSizeY*.5;

//text-based variables

PFont font;
PFont smallFont;



String variableLessonLineOne = "A variable is a storage location in coding associated with a symbolic name (an identifier).";
String variableLessonLineTwo = "In order to create a variable, you must first declare an identifier. Then give it a value.";
String variableLessonLineThree = "For example: float x = 45;";
String variableLessonLineFour = "Float is the type, x is the identifier, and 45 is the value.";
String variableLessonLineFive = "Try changing some of Ada's variables.";
String variableLessonLineSix = "Pull on the dots and watch the numbers change below.";
String variableLessonLineSeven;
String variableLessonLineEight;
String variableLessonLineNine;

float headSizeXText = headSizeX;
float headSizeYText = headSizeY;

void setup() {
  size(800, 600);
  smooth();
  background(240);

  //font
  font = createFont("Georgia", 24, true); 
  smallFont = createFont("Georgia", 14, true); 
  textFont(smallFont);
}

void draw() {
  //reset background
  background(240);
  //draw Ada
  //neck
  rect(neckStarts, brainY, neckX*2, neckY);

  //chest

  //fill(#980C0C);

  //legs
  rect(leftCurveStopX+15, leftCurveStopY-2, legWidth, legLength);
  rect(rightCurveStopX-legWidth-15, rightCurveStopY-2, legWidth, legLength);

  //feet
  ellipse(leftCurveStopX+legWidth, leftCurveStopY+legLength, footSize, footSize);
  ellipse(rightCurveStopX-legWidth, rightCurveStopY+legLength, footSize, footSize);

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



  //left upper arm - shaped in parallelogram form
  beginShape();
  vertex(leftCurveStartX+jointSize/4, leftCurveStartY+2);//leftmost top point
  vertex(leftCurveStartX+jointSize/4, leftCurveStartY+jointSize/4+2); // right top point
  vertex(leftElbowStartX+jointSize/4, leftElbowStartY+jointSize/4); //right bottom
  vertex(leftElbowStartX-jointSize/4, leftElbowStartY-jointSize/4); //left bottom
  vertex(leftCurveStartX-jointSize/4, leftCurveStartY+2); //back to left top
  endShape();

  //right upper arm -shaped in parallelogram form
  beginShape();
  vertex(rightCurveStartX+jointSize/4, rightCurveStartY+2);//rightmost top point
  vertex(rightCurveStartX-jointSize/4, rightCurveStartY+jointSize/4+2);// left top point
  vertex(rightElbowStartX-jointSize/4, rightElbowStartY+jointSize/4);//left bottom
  vertex(rightElbowStartX+jointSize/4, rightElbowStartY-jointSize/4);//right bottom
  vertex(rightCurveStartX+jointSize/4, rightCurveStartY+2);//back to left top
  endShape();


  //shoulder joints
  ellipse(leftCurveStartX, leftCurveStartY+jointSize/2, jointSize, jointSize);
  ellipse(rightCurveStartX, rightCurveStartY+jointSize/2, jointSize, jointSize);
  //hands
  ellipse(leftElbowStartX, leftElbowStartY, handSize, handSize);
  ellipse(rightElbowStartX, rightElbowStartY, handSize, handSize);

  //head
  ellipse(brainX, brainY, headSizeX, headSizeY);

  //draw pressure points
  fill(#3A00FF);
  ellipse(waistX, waistY, pressurePointRad, pressurePointRad); //waist joint
  ellipse(headWidthPointX, headWidthPointY, pressurePointRad, pressurePointRad);// x value of head
  ellipse(headLengthPointX, headLengthPointY, pressurePointRad, pressurePointRad);// y value of head

    //get rid of any negative values appearing on the screen 
  if (headSizeX <0) {
    headSizeXText = headSizeX*-1;
  }

  if (headSizeY <0) {
    headSizeYText = headSizeY*-1;
  }

  float waistValue = waistX-leftCurveStartX-innerCurve;

  variableLessonLineSeven = "Waist = "+waistValue+" pixels.";
  variableLessonLineEight = "Head Width = "+headSizeXText+" pixels.";
  variableLessonLineNine = "Head Length = "+headSizeYText+" pixels.";

  //here is where the text will be placed
  textFont(smallFont); 
  text(variableLessonLineOne, 150, 50);
  text(variableLessonLineTwo, 160, 80);
  textFont(font); 
  text(variableLessonLineThree, 400, 180);
  textFont(smallFont);
  text(variableLessonLineFour, 370, 200);
  textFont(font); 
  text(variableLessonLineFive, 350, 260);
  textFont(smallFont);
  text(variableLessonLineSix, 380, 285);
  text(variableLessonLineSeven, 420, 350);
  text(variableLessonLineEight, 420, 400);
  text(variableLessonLineNine, 420, 450);


  fill(#FFFFFF);
}

void mouseDragged() { 
  //animation allows people to "pull" on pressure points, 
  //changing value of certian variables
  if (mousePressed) {
    //waist joint
    if (mouseX >=waistX -pressurePointRad && mouseX<=waistX +pressurePointRad) {
      if (mouseY >=waistY -pressurePointRad && mouseY<=waistY +pressurePointRad) {

        innerCurve = rightCurveStopX-mouseX;
        waistX = mouseX;
      }
    }
    //head - x values - manipulate the width of the head
    if (mouseX >=headWidthPointX-pressurePointRad && mouseX <=headWidthPointX+pressurePointRad) {
      if (mouseY>=headWidthPointY-pressurePointRad && mouseY<=headWidthPointY+pressurePointRad) {
        headSizeX = brainX+headSizeX*.5-mouseX;
        headWidthPointX = mouseX;
      }
    }
    //head - y values - manipulate the width of the head
    if (mouseX >=headLengthPointX-pressurePointRad && mouseX <=headLengthPointX+pressurePointRad) {
      if (mouseY>=headLengthPointY-pressurePointRad && mouseY<=headLengthPointY+pressurePointRad) {
        headSizeY = brainY+headSizeY*.5-mouseY;
        headLengthPointY = mouseY;
      }
    }
  }
}



