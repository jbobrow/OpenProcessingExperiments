
// Visualizing what the ultrasonic sensor sees

// Load Libraries
import processing.serial.*; // read serial ports
import pt.citar.diablu.nxt.protocol.*; // the next 3 are all for Mindstorms
import pt.citar.diablu.processing.nxt.*;
import pt.citar.diablu.nxt.brick.*;

// Objects
LegoNXT nxt;
PFont font;

// Variables
int distance = 0;

void setup() {
  size(200, 200);
  smooth();
  background(255);
  
  // Load Fonts
  font = loadFont("HelveticaNeue-12.vlw");
  
  // Connect to NXT brick
  println("Listing Serial Ports");
  println(Serial.list());
  println("");
  
  nxt = new LegoNXT(this, Serial.list()[0]);

  // Start Distance Sensor (in port 4 on the brick, serial port 3)
  nxt.getDistance(3);
  
}

void draw() {
  background(255);
  
  // Print sensor values
  textFont(font, 12); 
  fill(0);

  distance = nxt.getDistance(3);
  
  ellipse(width/2,(height-distance),20,10);
  text(distance, width/2, height/2);
}

