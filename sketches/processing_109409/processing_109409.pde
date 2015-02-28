
/*
  Norm Krumpe
  September 22, 2012
  Models a light that is triggered by motion (in this case, motion
  of the mouse).  The light also has a timer.  So, motion turns on the
  light, but a certain amount of time passing with no motion will
  cause the light to turn off again.
*/

// How close you need to get to the
// light sensor in order to turn on
// the light.  Higher values make it
// easier to trigger the light.  Distance
// is measured in pixels.
final int TRIGGER_DISTANCE = 50;

// The location of the sensor:
final int SWITCH_CENTER_X = 100;
final int SWITCH_CENTER_Y = 400;

// seconds until light shuts off automatically when there is no motion
final float SECONDS_UNTIL_AUTO_SHUTOFF = 10; 

// Light will initially be on because of this next value.
// Want the light off initially?  
// Set this to something less than SECONDS_UNTIL_AUTO_SHUTOFF
float timeOfLastTrigger = 0; 
boolean revealTriggerRegion = false;

// Just choose a window size
void setup() {
  size(500, 500); 
}

// Each time the mouse moves, check to see
// if it triggered the motion sensor
void mouseMoved() {
  if (motionSensorWasTriggered()) {
    timeOfLastTrigger = millis()/1000.0;
  }
}

// When a key is pressed, toggle the "cheat" that
// reveals the motion sensor's trigger region.
void keyPressed() {
  revealTriggerRegion = !revealTriggerRegion;
}

// Draw the various parts of the scene
void draw() {
  background(0);
  text("Modified by Alex Gartner", 40, 20)
  drawLightSwitch();
  drawLamp();  
  drawTriggerRegion();
}

// Draws all components of the lamp
void drawLamp() {
  drawLight();
  fill(0, 255, 0, 50);
  quad(200, 90, 300, 50, 350, 250, 190, 250);
  fill(175, 127, 67);
  rect(240, 250, 20, 250);
}

// How the light gets drawn depends on whether
// the lightbulb is lit.
void drawLight() {

  if (secondsSinceLastTrigger() < SECONDS_UNTIL_AUTO_SHUTOFF) {
    // If the light is on:
    int strength = (int)random(156, 256);
    fill(strength, strength, 0);
    ellipse(250, 125, 45, 45);
    fill(255, 100);
    rect(0, 0, width, height);
  }

  else {
    // Light is off:
    fill(10, 10, 0);
    ellipse(250, 125, 45, 45);
  }
}

// Draw the light switch/sensor
void drawLightSwitch() {
  fill(55, 0, 200);
  rect(SWITCH_CENTER_X - 15, SWITCH_CENTER_Y - 25, 30, 60);
  fill(255);
  ellipse(SWITCH_CENTER_X, SWITCH_CENTER_Y, 5, 5);
}

// Return true if the mouse triggered the sensor
boolean motionSensorWasTriggered() {
  return distanceFromLightSwitch() < TRIGGER_DISTANCE;
}

// Compute the distance between the mouse and the sensor
float distanceFromLightSwitch() {  
  return dist(mouseX, mouseY, SWITCH_CENTER_X, SWITCH_CENTER_Y);
}

// Determine how long it has been since the motion sensor
// was last turned on.
float secondsSinceLastTrigger() {
  return millis()/1000.0 - timeOfLastTrigger;
}

// Show a "cheat" region so that you know where the mouse
// needs to go in order to trigger the light sensor
void drawTriggerRegion() {
  if (revealTriggerRegion) {
    fill(255, 25);
    ellipse(SWITCH_CENTER_X, SWITCH_CENTER_Y, 
    TRIGGER_DISTANCE * 2, TRIGGER_DISTANCE * 2);
  }
}
