
/**
 * "Spiral Connect the Dots" by Tom Greenbaum,
 *   licensed under Creative Commons Attribution-Share Alike 3.0 and GNU GPL license.
 *   Work: http://openprocessing.org/visuals/?visualID= 83165 
 *   License: 
 *     http://creativecommons.org/licenses/by-sa/3.0/
 *     http://creativecommons.org/licenses/GPL/2.0/
 * Generate a spiral based on varying the angle and distance between nodes. 
 * The initial angle between nodes is 120 degrees.
 * The initial angle can be varied using the a/s keys.
 * The initial distance between nodes is 30.
 * The inital distance between nodes is varied using the d/f keys.
 * The angle is incrementally varied between sequential nodes using the up/down arrows.
 * The distance is incrementally varied between sequential nodes using the left/right arrows.
 * The number of nodes is varied using the j/k keys.
 * The visibility of lines between nodes is toggled using the 'l' key.
 * The 'r' key resets the changes made to the angle and distance between sequential nodes.
 * The 'e' key resets the changes made to the initial angle and distance between nodes. 
*/

float angle1 = 0.0;
float angleInit = 0;
float angleDiv = 3;
float angleInitDiff = 0.1;
float angleIncr = 0.0;
float angleIncrDiff = 0.001;
float segLength = 0.0;
float segInit = 30;
float segInitDiff = 1;
float segIncr = 0.0;
float segIncrDiff = 0.05;
int maxIncr = 100;
int maxIncrDiff = 1;
int counter = 1;
boolean linesDrawn = true;               // toggled on, then lines are drawn
boolean dHelp = true;                    // toggle display of help on/off
PFont fontA;                             // Create the fonts
PFont fontB;

void setup() {
  size(800, 800);
  strokeWeight(2);
  stroke(0,255,0,120);
  fontA = loadFont("ArialNarrow-24.vlw");
  fontB = loadFont("CourierNewPSMT-12.vlw");
  angleInit = 360/angleDiv;
}

void draw() {
  colorMode(HSB,maxIncr,maxIncr,maxIncr,maxIncr);
  background(maxIncr);
  pushMatrix();
    translate (width/2-segInit/2,height/2-segInit/2);
    angle1 = radians(angleInit);
    segLength=segInit;
    for (counter=1; counter<maxIncr+1; counter=counter+1) {
      translate(segLength, 0);
      rotate(angle1);
      if (linesDrawn) {
        strokeWeight(2);
        stroke(counter-maxIncr*0.2,maxIncr,maxIncr,maxIncr*0.5);
        if (counter<maxIncr){
          line(0, 0, segLength, 0);
        }
      }
      strokeWeight(1);
      stroke(0);
      fill(maxIncr*0.4,maxIncr,maxIncr);
      ellipse(0,0,18,18);
      fill(0);
      pushMatrix();
        textAlign(CENTER, CENTER);
        textFont(fontA, 12);
        text(counter, 0, 0);
      popMatrix();
      angle1=angle1+radians(angleIncr);
      segLength=segLength+segIncr;
    }
  popMatrix();
  if (dHelp) {
    fill(0);
    textAlign(LEFT, TOP);
    textFont(fontB, 12);
    text("[left-arrow/right-arrow] Segment delta: " + segIncr,   5,  5);
    text("[  up-arrow/down-arrow ] Angle delta:   " + angleIncr, 5, 20);
    text("[ j/k ] Change number of nodes:         " + maxIncr,   5, 35);
    text("[ d/f ] Init segment length:            " + segInit,   5, 50);
    text("[ a/s ] Small changes to init angle:    " + angleInit, 5, 65);
    text("[ i/o ] Init angle = 360 / divisions:   " + angleDiv, 5, 80);
    textAlign(LEFT, BOTTOM);
    text("Press 'l' to toggle drawing of lines on/off.", 5, height-20);
    text("Press 'r' to reset segment and angle values.", 5, height-5);
    textAlign(RIGHT, TOP);
    fill(maxIncr*0.7,maxIncr,maxIncr);
    textFont(fontA, 24);
    text("SPIRAL CONNECT THE DOTS", width-5, 5);
    textFont(fontA, 24);
    text("www.karmatetra.com", width-5, 30);
  }
  fill(maxIncr*0.4,maxIncr,maxIncr);
  textAlign(RIGHT, BOTTOM);
  textFont(fontB, 12);
  text("Press SPACEBAR to toggle display of help on/off.", width-5, height-5);
}

void keyReleased() {
  if (key == ' ') {                      // Press 'space' to toggle help screen on and off
    if (dHelp) {
      dHelp = false;                     // Toggled off, then help text not displayed
    } else {
      dHelp = true;                      // Toggled on, then help text is displayed
    }
  } else if (key == 'l') {               // Press 'l' key = toggle lines drawn
    if(linesDrawn) {
      linesDrawn = false;                // Toggled off, then lines not drawn
    } else {
      linesDrawn = true;                 // Toggled on, then draw lines
    }
  }
}

void keyPressed() {                       // Vary the angle and segment increments
  switch(keyCode) {
    case LEFT:                            // Left arrow = negative acceleration of segment length
      segIncr = segIncr - segIncrDiff;
    break;
    case RIGHT:                           // Right arrow = positive acceleration of segment length
      segIncr = segIncr + segIncrDiff;
    break;
    case DOWN:                            // Down arrow = negative acceleration of angular change
      angleIncr = angleIncr - angleIncrDiff;
    break;  
    case UP:                              // Up arrow = positive acceleration of angular change
      angleIncr = angleIncr + angleIncrDiff;
    break;  
  }
    if (key == 'r') {                     // Press 'r' key = reset
      segIncr = 0;                        // segment increment to 0
      angleIncr = 0;                      // angle increment to 0
      angleInit = 360/angleDiv;           // Reset initial angle
      segInit = 30;                       // initial segment to 30
    } else if (key == 'a') {              // Press 'a' key = decrease initial angle
      angleInit = angleInit - angleInitDiff; 
    } else if (key == 's') {              // Press 's' key = increase initial angle
      angleInit = angleInit + angleInitDiff;
    } else if (key == 'd') {              // Press 'd' key = decrease initial segment
      segInit = segInit - segInitDiff; 
    } else if (key == 'f') {              // Press 'f' key = increase initial segment
      segInit = segInit + segInitDiff; 
    } else if (key == 'j') {              // Press 'j' key = decrease number of increments
      maxIncr = maxIncr - maxIncrDiff; 
    } else if (key == 'k') {              // Press 'f' key = increase number of increments
      maxIncr = maxIncr + maxIncrDiff; 
    } else if (key == 'i') {              // Press 'i' key = decrease number of angle divisions by whole number
      if (angleDiv-1 >= 2) {              // Only decrement if greater than or equal to 2, can't be 0 or negative
        angleDiv = angleDiv - 1;
        angleInit = 360/angleDiv;
      }
    } else if (key == 'o') {              // Press 'o' key = increase number of angle divisions by whole number
      angleDiv = angleDiv + 1;
      angleInit = 360/angleDiv;
    }
  }

