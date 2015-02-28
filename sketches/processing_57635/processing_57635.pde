
// Experimenting with driving a jeep via Processing

// Load Libraries
import processing.serial.*;
import pt.citar.diablu.nxt.protocol.*;
import pt.citar.diablu.processing.nxt.*;
import pt.citar.diablu.nxt.brick.*;

LegoNXT nxt;

PFont fontA;
PImage bgImg;

int jeepSpeed = 0;
long jeepSteer = 0; // the amount the jeep is currently steering
int jeepSteerGoal = 0; // the amount the jeep should be steering
int jeepRange = 0;
String jeepBackLeft = "";
String jeepBackRight = "";
long tachoLimit;
long tachoCount;
long rotationCount;

void setup() {
  size(300, 300);
  smooth();
  background(155);

  // Load Background
  bgImg = loadImage("control-background.jpg");  

  // Load Fonts
  fontA = loadFont("HelveticaNeue-12.vlw");

  // Start connection with LegoNXT brick
  println(Serial.list());
  nxt = new LegoNXT(this, Serial.list()[0]);

  // reset motor limits - note that wheels must be in the center when you start the sketch
  nxt.resetMotorPosition(1, true);
  nxt.resetMotorPosition(0, true);
  
  //get tacho values
  tachoLimit = nxt.getMotorTachoLimit(0);
  tachoCount = nxt.getMotorTachoCount(0);
  rotationCount = nxt.getMotorRotationCount(0);
}

void draw() {
  background(bgImg);
  
  textFont(fontA, 12); 
  fill(0);

  // ********************
  // Read sensor values
  // ********************
  // Touch Sensor 1 (back left bumper)
  if (nxt.getButtonState(0) == true) {
    jeepBackLeft = "Pressed";
  } else {
    jeepBackLeft = "";
  }
  // Touch Sensor 2 (back right bumper)
  if (nxt.getButtonState(1) == true) {
    jeepBackRight = "Pressed";
  } else {
    jeepBackRight = "";
  }
  // Ultrasonic Sensor (forward-facing roof)
  jeepRange = nxt.getDistance(3);
  
  // ********************
  // Jeep Speed Controls
  // Attempted speed is read from the mouse's vertical position in the control window
  // The ultrasonic sensor acts as a safety for forward motion
  // The two touch sensors are the safety for backward motion
  // ********************
  jeepSpeed = height/2-mouseY;
  if (jeepSpeed > 100) {
    jeepSpeed = 100;
  } else if (jeepSpeed < -100) {
    jeepSpeed = -100;
  }
  text("Speed:", 20, 140);
  text(jeepSpeed, 80, 140);
  
  // Ultrasonic Sensor
  text("Clear Distance:", 20, 160);
  text(jeepRange, 110, 160);
  
  // Touch Sensor
  text("Rear Bumper:", 20, 180);
  text(jeepBackLeft, 20, 200);
  text(jeepBackRight, 60, 200);
  
  // Jeep Steering is set by mouse position left-to-right
  jeepSteerGoal = -1*(width/2 - mouseX);
  if (jeepSteerGoal > 65) {
    jeepSteerGoal = 65;
  } else if (jeepSteerGoal < -65) {
    jeepSteerGoal = -65;
  }
  text("Steer Goal:", 170, 140);
  text(jeepSteerGoal, 230, 140);
  
  // read sensor values
  jeepSteer = nxt.getMotorRotationCount(0);
  text("Actual:", 170, 160);
  text(jeepSteer, 230, 160);
  
  text(jeepSteerGoal - (int)jeepSteer, 230, 180);
  if(jeepSteerGoal > jeepSteer){
    if(jeepSteerGoal-jeepSteer > 10) {
      nxt.motorForward(0, 5);
    } else {
      nxt.motorStop(0);
    }
  } else if(jeepSteerGoal < jeepSteer) {
    if(jeepSteerGoal - jeepSteer < -10){
      nxt.motorForward(0, -5);
    } else {
      nxt.motorStop(0);
    }
  } else {
    nxt.motorStop(0);
  }
    
  if (mousePressed == true) {
    // we only try to move when the mouse button is pressed
    // need to check the safeties (range finder for drive, rear bumper for reverse)
    
    if ((jeepSpeed > 0 && jeepRange < 20 && jeepRange > -1) || (jeepSpeed < 0 && (nxt.getButtonState(0) == true || nxt.getButtonState(1) == true))) {
      //hit the brakes before we hit something
      jeepBrake();
    } else {
      nxt.motorForward(1, -1*jeepSpeed);
      nxt.motorForward(2, -1*jeepSpeed);
    } 
  } else {
    jeepBrake();
  }

}

void jeepBrake() {
  // this stops all motors
  //nxt.motorStop(0);
  nxt.motorStop(1);
  nxt.motorStop(2);
}

void keyPressed() {
  println("Keyboard pressed - aborting");
  jeepBrake();
  exit();
}

