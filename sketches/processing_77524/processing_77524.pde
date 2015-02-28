
/*
Use the left and right arrow keys to aim a ball at the sides of a hexagon. The up key launches it.
At collision, a servo is triggered via arduino to hit a key on a xylophone.

The classes Ball, VectorLine and doLineCollision are based upon user allonestring's "vector-based collision"
sketch" found at http://www.openprocessing.org/sketch/40818 (creative commons).

The Timer class is taken from Daniel Shiffman's "Learning Processing" on page 177.

Any changes/comments to the aforementioned classes are indicated in comments at the top of the window
of the selected tab.
*/




//import statements for Arduino/Servo Firmata
import processing.serial.*;
import cc.arduino.*;
Arduino arduino;

//create an arraylist of ball objects
ArrayList Balls = new ArrayList();

//a class that controls the servo functions
ArdCla ardcla;

float radius = 10; //ball radius

float myAng = 0; //angle of the aimer
float r = 200; //radius of aimer
float r2 = 2; //radius of launch angle

//these two values are used to calculate the x and y velocity of the ball
float myX = 0; 
float myY = 0;
//these two values are used to calculate the angle/direction of launch
float x2;
float y2;

//make an arraylist of VectorLine (wall) objects with six items in it
VectorLine[] lines;
int numLines = 6;

//measurements of the line wall barriers
float lineLength = 250;
float lineWidth = 5;

//number used to calculate position of lines relative to window
int offset = 75;

//colours of line wall barriers
color myBlue = color(35, 55, 185);
color myRed = color(170, 20, 20);
color myYellow = color(200, 200, 20);
color myPink = color(235, 100, 100);
color myGreen = color(30, 140, 50);

//analog output pins on arduino
//decided not to put these in an array for easy change/passing of values
int myPin1 = 3;
int myPin2 = 5;
int myPin3 = 6;
int myPin4 = 11;
int myPin5 = 10;
int myPin6 = 9;

void setup()
{
  size(600, 600);
  smooth();

  //uncomment below to check port numbers arduino might be connected to
  //  println(Arduino.list());

  //arduino is connected to tty.usbmodem411, so select 4
  arduino = new Arduino(this, Arduino.list()[4], 57600);

  //new servo controller class
  ardcla = new ArdCla();

  //arraylist of VectorLine objects
  lines = new VectorLine[numLines];

  /* The below are statements creating VectorLine objects. Because they
   are arranged in a hexagonal shape (and because I'm pretty new at this)
   values were calculated on paper and then hard-coded in. */

  float xbit1 = width/2-lineLength/2; //horizontal arrangement to center
  float ybit1 = offset; //vertical position
  PVector linePosition1 = new PVector(xbit1, ybit1); //create line at that position
  lines[0] = new VectorLine(linePosition1, lineLength, lineWidth);
  lines[0].colour = color(myBlue);
  //rotation pivots about the center of the line. Convert from degrees using radians() function
  lines[0].rotation = radians(0); 


  float xbit2 = width/2+lineLength/2;
  float ybit2 = offset;
  PVector linePosition2 = new PVector(xbit2, ybit2);
  lines[1] = new VectorLine(linePosition2, lineLength, lineWidth);
  lines[1].colour = color(myRed);
  lines[1].rotation = radians(60);

  float xbit3 = width/2 + (sin(radians(30)) *lineLength);
  float ybit3 = offset + (2*sin(radians(60)) *lineLength);
  PVector linePosition3 = new PVector(xbit3, ybit3);
  lines[2] = new VectorLine(linePosition3, lineLength, lineWidth);
  lines[2].colour = color(myYellow);
  lines[2].rotation = radians(-60);

  float xbit4 = width/2-lineLength/2;
  float ybit4 = offset + (2*sin(radians(60)) *lineLength);
  PVector linePosition4 = new PVector(xbit4, ybit4);
  lines[3] = new VectorLine(linePosition4, lineLength, lineWidth);
  lines[3].colour = color(myBlue);
  lines[3].rotation = radians(0); 

  float xbit5 = width/2-lineLength;
  float ybit5 = offset + (sin(radians(60)) *lineLength);
  PVector linePosition5 = new PVector(xbit5, ybit5);
  lines[4] = new VectorLine(linePosition5, lineLength, lineWidth);
  lines[4].colour = color(myPink);
  lines[4].rotation = radians(60); 

  float xbit6 = width/2-lineLength;
  float ybit6 = offset + (sin(radians(60)) *lineLength);
  PVector linePosition6 = new PVector(xbit6, ybit6);
  lines[5] = new VectorLine(linePosition6, lineLength, lineWidth);
  lines[5].colour = color(myGreen);
  lines[5].rotation = radians(-60);
}

void draw()
{


  background(65);


//calculate vert and horz direction of angle for end of aimer
  float x = r * cos(myAng);
  float y = r * sin(myAng);

//calculate vert and horz direction of angle for calculating velocity/position of ball
  float x2 = r2 * cos(myAng);
  float y2 = r2 * sin(myAng);

//set myX and myY to equal x2 and y2. This is later fed into velocity. I don't think that this creates 
//a constant velocity as is desired. However, values are close enough for the purpose of this project.
  myX = x2;
  myY = y2;

//this is visual appearance for the aiming line
  strokeWeight(2);
  stroke(200, 200, 0);
  //draw the aiming line from the centre of the window to half window length + vert/horz direction of angle
  line(width/2, height/2, x + width/2, y + width/2);

//activate servos
  ardcla.playing(myPin1);
  ardcla.playing(myPin2);
  ardcla.playing(myPin3);
  ardcla.playing(myPin4);
  ardcla.playing(myPin5);
  ardcla.playing(myPin6);

//move and display each element of the balls arraylist
  for (int i = 0; i <Balls.size(); i++) {
    Ball tempBall = (Ball) Balls.get(i);
    tempBall.move();
    tempBall.display();

//if there are more than five balls, remove the first created one
    if (Balls.size() > 5) {
      Balls.remove(0);
    }

//each time a ball collides with a line, trigger the collision behaviour
//pass in pin number so that the servo corresponding to that line can be triggered to move
    for (int v = 0; v < numLines; v++)
    {
      tempBall.lineBounce(lines[0], myPin1);
      tempBall.lineBounce(lines[1], myPin2);
      tempBall.lineBounce(lines[2], myPin3);
      tempBall.lineBounce(lines[3], myPin4);
      tempBall.lineBounce(lines[4], myPin5);
      tempBall.lineBounce(lines[5], myPin6);
    }
  }

//display the wall VectorLines
  for (int v = 0; v < numLines; v++)
  {
    lines[v].display();
  }
}

//using the arrow keys controls the aimer, right moves clockwise, left, counter clockwise
void keyPressed() {

  if (key == CODED) {

    if (keyCode == RIGHT) {
      if (myAng == 360) {
        myAng = 0;
      }
      myAng += 0.05;
    } 
    else if (keyCode == LEFT) {

      if (myAng == 0) {
        myAng = 360;
      }

      myAng -= 0.05;
    } 
    
    //if the up key is pressed, add a new ball to the array
    else if (keyCode == UP) {

      newBall();
    }
  }
}

//new ball creates a ball object
void newBall() {
  PVector position = new PVector(width/2, height/2); //position starts at the middle of the screen
  color colour = color(random(15, 220), random(15, 220), random(15, 220)); //random colour
  //velocity is set according to the x and y position of a point a short distance from the middle of screen along the angle
  PVector velocity = new PVector(myX, myY); 
  //new ball object added
  Ball tempBall = new Ball(position, velocity, radius, colour);
  Balls.add(tempBall);
}

class ArdCla {

  //default set servos in motion to false
  boolean isPlaying = false;

  int thePin; //checks pin number
  int myPin; //variable used to hold the value of the passed in pin value

//must create an external timer object so as to allow servos time to reach desired position
  Timer timer;

  ArdCla() {
    timer = new Timer(500); //timer at 500 millis (half a second)
  }

//start motions of servos (triggered from ball hitting wall)
  void startPlay(int _thePin) {
    thePin = _thePin; 
    
//start movement
    isPlaying = true; 

    
    timer.start(); //start the timer at contact
  }

  void playing(int _myPin) {
    myPin = _myPin;
    int myPosA = 10; //striking angle of servo
    int myPosB = 70; //neutral angle of servo
    int myPos = myPosB; //start at neutral angle

    //if isPlaying is true and it is true for the pin passed in on contact
    if (isPlaying == true  && thePin == myPin) {

      myPos = myPosA; //move to posA
      
      //give the servo time to reach this position, then...
      if (timer.isFinished()) {
        //reset to neutral position
        myPos = myPosB;
      //  println("Yes!! " + myPin);
        isPlaying = false; //set isPLaying to false

      }
      
      //write the position on the arduino
          arduino.analogWrite(myPin, myPos);
      
        
    }
  }
  
  
}

//from this class I have removed gravity and the behaviour of interacting with other balls and stationary ring objects
//Code I have written specific to this program can be found at the end of the lineBounce function

class Ball
{
  float radius;
  PVector position;
  PVector velocity;
  color colour;
  float bounce = -1;
  float mass;


  Ball(PVector position, PVector velocity, float radius, color colour)
  {
    this.position = position;
    this.velocity = velocity;
    this.radius = radius;
    this.colour = colour;
    this.mass = radius;
  }


  void move()
  {

    position.add(velocity);
    velocity.limit(5);
  }

  void display()
  {
    noStroke();
    fill(colour);
    ellipse(position.x, position.y, 2*radius, 2*radius);
  }

  void lineBounce(VectorLine vLine, int myPin)
  {
    

    //line stuff
    PVector lineStart = vLine.getOneEnd();
    PVector lineEnd = vLine.getOtherEnd();
    PVector theLine = new PVector(lineStart.x - lineEnd.x, lineStart.y - lineEnd.y);
    //------lineStart
    PVector start2ball = new PVector(position.x - lineStart.x, position.y - lineStart.y);
    float dpStart = theLine.dot(start2ball);
    //------lineEnd    
    PVector end2ball = new PVector(lineEnd.x - position.x, lineEnd.y - position.y);
    float dpEnd = theLine.dot(end2ball);

    //------line middle
    //find normal to vectorLine and set in to unit length
    PVector lineNormal = new PVector(-(lineStart.y - lineEnd.y), lineStart.x - lineEnd.x);
    lineNormal.normalize();
    //we already have start2ball joining lineStart to ballCentre
    //find dot product of start2ball and normalised normal
    float ballDOTnormal = start2ball.dot(lineNormal);

    //------check collision with lineStart and lineEnd
    if (dpStart > 0) 
    {
      if (start2ball.mag() < radius + vLine.lineWidth/2)
      {
        Ball lineStartBall = new Ball(lineStart, new PVector(0, 0), vLine.lineWidth, color(0));
      }
    }
    else if (dpEnd > 0) 
    {
      if (end2ball.mag() < radius + vLine.lineWidth/2)
      {
        Ball lineEndBall = new Ball(lineEnd, new PVector(0, 0), vLine.lineWidth, color(0));
      }
    }
    //------check collision between the two ends    
    //if start2ball dot normalToLine < radius then collision
    else if (abs(ballDOTnormal) < radius + vLine.lineWidth/2)
    {
      doLineCollision(this, vLine);
      
      //at the instance of collision, trigger the servos to move
      //only move if not already in motion in case of simultaneous collisions
         if (ardcla.isPlaying == false){ 
      ardcla.startPlay(myPin);
         }
    }
  }
  
  
}

class Timer {
  
  int savedTime; //when timer started
  int totalTime; //how long timer should last
  
  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }
  
  //starting the timer
  void start() {
    savedTime = millis();
  }
  
  
  void setTime(int t){
    totalTime = t;
  }
  
    
  boolean isFinished() {
    //check how much time has passed 
    int passedTime = millis() - savedTime;
    if(passedTime > totalTime) {
      return true;
    } else {
      return false;
    }
  }
}
//in this code, I have removed the move function and the behaviours related to other pivot-type lines

class VectorLine
{
  PVector position;
  float lineLength;
  float lineWidth;
  float rotation;
  color colour = (255);
  String pivotType;
  
  VectorLine(PVector position, float lineLength, float lineWidth)
  {
    this.position = position;
    this.lineLength = lineLength;
    this.lineWidth = lineWidth;
    this.rotation = rotation;
    this.colour = colour;
  }
  
  void display()
  {
    fill(colour);
    noStroke();
 
      pushMatrix();
      translate(position.x, position.y);
      rotate(rotation);
      rect(0, -lineWidth/2, lineLength, lineWidth);
      popMatrix(); 
      
 }
  
  PVector getOneEnd()
  {
  
      float xbit = position.x - cos(rotation) * lineLength/2;
      float ybit = position.y - sin(rotation) * lineLength/2;
      return new PVector(xbit, ybit);

  }
  PVector getOtherEnd()
  {
   
      float xbit = position.x + cos(rotation) * lineLength;
      float ybit = position.y + sin(rotation) * lineLength;
      return new PVector(xbit, ybit);
 
  }
}
//I don't believe that I made any changes to this class due to its complexity. It's worth noting that there is some
//code here that works to imitate Newton's law of restitution (ie. speeds of objects changing on collision)
//that I would have liked to remove (to keep velocity more or less constant) however in the time I looked at this
//code, I couldn't think of a quick way to get rid of this factor


void doLineCollision(Ball ball, VectorLine vLine)
{
  PVector lineStart = vLine.getOneEnd();
  PVector lineEnd = vLine.getOtherEnd();
  PVector start2ball = new PVector(ball.position.x - lineStart.x, ball.position.y - lineStart.y);
  
  //find normal to line and set it to unit length
  PVector normalToLine = new PVector(-(lineStart.y - lineEnd.y), lineStart.x - lineEnd.x);
  normalToLine.normalize();

  //to resolve overlap of ball and line
  //find vector representing the line
  PVector theLine = new PVector(lineStart.x - lineEnd.x, lineStart.y - lineEnd.y);
  //first: find dist from lineStart to ball along the line
  //project start2ball onto the line
  //need dot products
  float ballDOTline = start2ball.dot(theLine);
  float lineDOTline = theLine.dot(theLine);
  PVector ballProjectedOntoLine = PVector.mult(theLine, ballDOTline/lineDOTline);
  PVector projectionAddedToStart = PVector.add(lineStart, ballProjectedOntoLine);

  //second: find offset needed to negate overlap
  //to find out which side of the line the ball is
  //find dot product of start2ball and the normalised normal
  //it'll be negative or positive (one side of the line or the other)
  float ballDOTnormal = start2ball.dot(normalToLine);
  //normalised normalToLine multiplied by ballDOTnormal and normalised again
  PVector offsetFromLine = PVector.mult(normalToLine, ballDOTnormal);
  offsetFromLine.normalize();
  //normalised offsetFromLine multiplied by the radius
  offsetFromLine.mult(ball.radius + vLine.lineWidth/2);
  //set the ball's position to the distance from start plus the offset
  ball.position = PVector.add(projectionAddedToStart, offsetFromLine);
  
  PVector incidence = new PVector(-ball.velocity.x, -ball.velocity.y);
  //find dot product of incident vector and line normal 
  float incidenceDOTline = incidence.dot(normalToLine);
    
  //calculate reflection (assuming coefficient of restitution = 1)
  //reflection = (1 + coefficient of restitution) * normalToLine
  //             * (normalToLine DOT incidence) - incidence
  PVector temp = PVector.mult(normalToLine, (2*incidenceDOTline));
  ball.velocity = PVector.sub(temp, incidence);
//  velocity.limit(5);
}


