
//Paper Dolls - Ada Version

//universal variables
//where the head will center
float brainX = 200;
float brainY = 150;
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

//legs
float legWidth=25;
float legLength=60;

//pressure points
float pressurePointRad=10;
//hips
float hipX = rightCurveStartX-innerCurve;
float hipY = rightCurveStartY+torsoLength*.5;
//head - x value
float headWidthPointX = brainX+headSizeX*.5;
float headWidthPointY = brainY;

//head - y value 
float headLengthPointX = brainX;
float headLengthPointY = brainY+headSizeY*.5;

void setup() {
  size(800, 600);
  smooth();
  background(240);
}

void draw() {
  //reset background
  background(240);
  //draw Ada
  //neck
  rect(neckStarts, brainY, neckX*2, neckY);
  //head
  ellipse(brainX, brainY, headSizeX, headSizeY);
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
  curveVertex(leftCurveStartX+innerCurve, leftCurveStartY+torsoLength*.5);//hip 
  curveVertex(leftCurveStopX, leftCurveStopY); //moves back to the left
  curveVertex(leftCurveStopX, leftCurveStopY);  //guiding point
  vertex(leftCurveStopX, leftCurveStopY); //sets the bottom left point


  // right curve
  vertex(rightCurveStopX, rightCurveStopY); //right bottom point
  curveVertex(rightCurveStopX, rightCurveStopY); //guiding point
  curveVertex(rightCurveStopX, rightCurveStopY); //bottom right point
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

  //draw pressure points
  fill(#3A00FF);
  ellipse(hipX, hipY, pressurePointRad, pressurePointRad); //hip joint
  ellipse(headWidthPointX, headWidthPointY, pressurePointRad, pressurePointRad);// x value of head
  ellipse(headLengthPointX, headLengthPointY, pressurePointRad, pressurePointRad);// y value of head
  
  fill(#FFFFFF);
}

void mouseDragged() { 
  //animation allows people to "pull" on pressure points, 
  //changing value of certian variables
  if (mousePressed) {
    //hip joint
    if (mouseX >=hipX -pressurePointRad && mouseX<=hipX +pressurePointRad) {
      if (mouseY >=hipY -pressurePointRad && mouseY<=hipY +pressurePointRad) {

        innerCurve = rightCurveStopX-mouseX;
        hipX = mouseX;
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

