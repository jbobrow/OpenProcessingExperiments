
/* 
  This will be a sketch that will interactively control the position of a Mindstorms motor.

  Right now all I have is the control interface, while I work on a reliable way of connecting
  to the NXT brick. The sketch tracks mouse position and will translate that into the rotation 
  of a motor. There is a visual indicator in the center of the window of where the motor will 
  be in its rotation. The width of the window allows two complete revolutions of the motor.
  
  The vertical position of the mouse is intended to control the speed/power of the motor's 
  rotation.
  
  Once I get the connection into a more stable state, the next step will be to visualize the 
  actual position of the motor, showing the motor's attempts to keep up with the changing mouse
  position.
*/

// Libraries
import processing.serial.*; // read serial ports
import pt.citar.diablu.nxt.protocol.*; // the next 3 are all for Mindstorms
import pt.citar.diablu.processing.nxt.*;
import pt.citar.diablu.nxt.brick.*;

// Objects
LegoNXT nxt;
PFont font;

// Variables
int value = 0;
long tachoCount = 0;
long rotateCount = 0;

void setup() {
  size(720,200);
  background(255);

  // Load Fonts
  font = loadFont("TrebuchetMS-12.vlw");

  // Connect to NXT brick
//  println(Serial.list());
//  nxt = new LegoNXT(this, Serial.list()[1]);

  // Reset Motor 0 (A) position sensor
//  nxt.resetMotorPosition(0, true);
}

void draw() {
  background(255);
  stroke(0);
    
  // Draw crosshairs
  line(0,mouseY,width,mouseY);
  line(mouseX,0,mouseX,height);
  rect(mouseX-3,mouseY-3,6,6);

  // Define Text characteristics
  textFont(font, 12);
  fill(0);

  // Print Crosshair position
  text("("+mouseX+","+mouseY+")", mouseX+10, mouseY-15);

  // Graphic rotation indicator
  stroke(128);
  line(width/2,(height/2)-10,width/2,(height/2)+10);
  line((width/2)-10,height/2,(width/2)+10,height/2);
  stroke(0);
  translate(width/2, height/2);
  rotate(radians(mouseX-90));
  rect(0, -2, (height-mouseY)/2, 4);

  // This part checks the rotation value of the Mindstorms motor A  
  //rotateCount = nxt.getMotorRotationCount(0);
  //text(rotateCount, mouseX+10, (mouseY)+15);
}

