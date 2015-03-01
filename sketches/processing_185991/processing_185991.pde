
//  Emanuel Resnikoff
//
//  This program uses an intuitive computer animation
//  as a control mechanism for a servo-articulated arm.
//  
//  This arm is outfitted with a magnet which can be used
//  to trip sensors or perform tasks at locations that  
//  correspond to the animation on screen.
//  
//  
//  This is v201502021329
//  This version adds articulation to the swing-arm.
//  
//  
//  
//  This section uses code samples from
//  Daniel Shiffman
//  http://natureofcode.com
//  and
//  Austin Lee / Daria




//  ON SCREEN EFFECTS - THE HOLLOW BALLS
class Mover {

  // The Mover tracks location, velocity, and acceleration 
  PVector location;
  PVector velocity;
  PVector acceleration;
  // The Mover's maximum speed
  float topspeed;

  Mover() {
    // Start in the center
    location = new PVector(random(width),random(height));
    velocity = new PVector(0,0);
    topspeed = 5.5;
  }

  void update() {
    
    // Compute a vector that points from location to mouse
    PVector mouse = new PVector(targetX,targetY);
    PVector acceleration = PVector.sub(mouse,location);
    // Set magnitude of acceleration
    //acceleration.setMag(0.2);
    acceleration.normalize();
    acceleration.mult(0.2);
    
    // Velocity changes according to acceleration
    velocity.add(acceleration);
    // Limit the velocity by topspeed
    velocity.limit(topspeed);
    // Location changes by velocity
    location.add(velocity);
  }

  void display() {
    noStroke();  
    //    stroke(0);
    strokeWeight(2);
    fill(200,255,200,64);
    ellipse(location.x,location.y,24,24);
  }

}


//  Emanuel Resnikoff
//
//  SETS POSITIONS FOR BOTH ON-SCREEN EFFECTS AND PHYSICAL CONTROLS.

int previousPosition;
int destinationPosition;


void mousePressed() {
  
  //  Choose Servo Destination
    //  Left Full
    if (mouseX<width/5){  destinationPosition = 1;  } 
    //  Left Half
    else if (mouseX<2*width/5){  destinationPosition = 2;  } 
    //  Middle
    else if (mouseX<3*width/5){  destinationPosition = 3;  }  
    //  Right Half
    else if (mouseX<4*width/5){  destinationPosition = 4;  } 
    //  Right Full
    else {  destinationPosition = 5;  } 

  
  //  Control Articulating Servo
    //  Determines Servo Transit Direction based on previous positions other than the middle position.
    if (previousPosition <3) {smallServoAngle = servoMax;}
    else if (previousPosition >3) {smallServoAngle = servoMin;}
    //  Determines Servo Transit Direction based on previous position in the middle.
    else if (destinationPosition<3) {smallServoAngle = servoMax;}
    else if (destinationPosition>3) {smallServoAngle = servoMin;}
    
 
  
  //  Control On-Screen Animation and Big Servo Targets
    //  Left Full
    if (destinationPosition == 1){
      targetX = 136;
      targetY = 488;
      bg = loadImage(leftFull);
      
      bigServoAngle = servoMin;
    } 
    //  Left Half
    else if (destinationPosition == 2){
      targetX = 390;
      targetY = 580;
      bg = loadImage(leftHalf);
      
      bigServoAngle = servoMax/4;
    } 
    //  Middle
    else if (destinationPosition == 3){
      targetX = 640;
      targetY = 610;
      bg = loadImage(middleFace);

      bigServoAngle = servoMax/2;
    }     
    //  Right Half
    else if (destinationPosition == 4){
      targetX = 890;
      targetY = 580;
      bg = loadImage(rightHalf);

      bigServoAngle = servoMax*3/4;
    }     
    //  Right Full
    else {
      targetX = 1144;
      targetY = 488;
      bg = loadImage(rightFull);

      bigServoAngle = servoMax;
    }
  
  
  
  
  
  
  
//    //  ARDUINO CONTROL - SET SERVO ANGLE  
//    arduino.servoWrite(smallServoPin,smallServoAngle);
//    delay(delayTime-100);
//    arduino.servoWrite(bigServoPin,bigServoAngle);
//    delay(delayTime);
//    arduino.servoWrite(smallServoPin,servoMax/2);



  //  Carry forward
  previousPosition = destinationPosition;
}




//  Emanuel Resnikoff
//
// This section modified from code provided by:
// Daniel Shiffman
// http://natureofcode.com


//Target Variable Declaration
  //Target Initially in center.
  int targetX = width/2;
  int targetY = height/2;


//Image Handler
  //Set Initial Image
  PImage bg;
  String leftFull = "robotLeftFull.jpg";
  String leftHalf = "robotLeftHalf.jpg";
  String middleFace = "robotMiddle.jpg";
  String rightHalf = "robotRightHalf.jpg";
  String rightFull = "robotRightFull.jpg";


//  HOW MANY SPHERES
Mover[] movers = new Mover[96];



void draw() {

  //  ON SCREEN EFFECTS - SET IMAGE
    background(bg);

  //  ON SCREEN EFFECTS - MOVES THE HOLLOW BALLS
    for (int i = 0; i < movers.length; i++) {
      movers[i].update();
      movers[i].display(); 
    }
  
}




//  Emanuel Resnikoff






//  SETUP HARDWARE INTERFACE
      import processing.serial.*;
      import cc.arduino.*;
      Arduino arduino;

//  SETUP SERVO-MOTOR VARIABLES

  //  Servo Interface Pins
  int bigServoPin = 9;
  int smallServoPin = 10;

  //  Servo Mechanical Tolerance (Radio Shack Brand.  Was supposed to be 180 deg!)
  int servoMin = 4;    //  Degrees
  int servoMax = 174;  //  Degrees
    
  int bigServoAngle;
  int smallServoAngle;
    
  //  Time Variables
  int delayTime = 350;






void setup() {
  
//  //  ARDUINO AND SERVO INITILIZATION
//    arduino = new Arduino(this, "/dev/tty.usbmodem2311", 57600);
//    //  Declare Servo Pins 
//    arduino.pinMode(bigServoPin, Arduino.SERVO);
//    arduino.pinMode(smallServoPin, Arduino.SERVO);
//       
//    //  Set Initial Servo Positions
//    smallServoAngle = servoMax/2;
//    bigServoAngle = servoMax/2;
//    previousPosition = 3;
//    
//    arduino.servoWrite(smallServoPin,smallServoAngle);
//    delay(delayTime);
//    arduino.servoWrite(bigServoPin,bigServoAngle);
//
  
  //  ON SCREEN EFFECT INITILIZATION
    size(1280,800);
    //frameRate(30);
    for (int i = 0; i < movers.length; i++) {
      movers[i] = new Mover(); 
    }
    
    //  Start in the center position
    targetX = 640;
    targetY = 610;
    bg = loadImage(middleFace);
}



