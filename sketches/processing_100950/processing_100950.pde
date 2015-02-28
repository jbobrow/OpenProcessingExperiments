
// i love music and dancing
// so i tried to draw a person listening to music and tapping his foot.

// this is what happens when the program starts:
// only happens once.

// load the P5 libraries:
import oscP5.*;
import netP5.*;

// create the objects we need:
OscP5 oscP5;
NetAddress myRemoteLocation;

int dist = 0;
int distbuffer = 5;
int step = 200;
int stepbuffer = 50;

void setup() {
  // start oscP5:
  oscP5 = new OscP5(this, 11111);
  // set up the address we will send messages to:
  // "127.0.0.1" means 'send to the same machine this is running on'
  // 12345 is the port number Max is listening on
  myRemoteLocation = new NetAddress("127.0.0.1", 12345);
  
  // creates a canvas of 400 pixels wide and 400 pixels high
  size(400, 400);
  // draws smoothly
  // active by default
  smooth();
}

// this is what happens continuously
// after setup is done:
void draw() {
  // start building a message (with the message address /mouse):
  OscMessage myMessage = new OscMessage("/mouse");

  // add some arguments:
  myMessage.add(mouseX); /* add an int to the osc message */
  myMessage.add(mouseY); /* add an int to the osc message */
  myMessage.add(dist); /* add an int to the osc message */

  // and finally, send it:
  oscP5.send(myMessage, myRemoteLocation);
  
  // fills in the background
  background(126, 206, 253);

  //"skin"
  // draws lines without strokes
  noStroke();
  // fills in the face
  fill(255, 246, 229);

  // draws a triangle for the neck
  triangle(195+mouseX/30, 70, 195, 120, 205, 120);
  // draws an ellipse for the face
  // default mode is center
  ellipse(195+mouseX/30, 65+mouseY/30, 100, 70);

  // draws two ellipses for hands
  ellipse(143, 220+mouseY/30, 10, 10);
  ellipse(257, 220+mouseX/30, 10, 10);

  // fills in the hair
  fill(0);
  // draws an arc for hair
  arc(195+mouseX/30, 65+mouseY/30, 100, 70, PI-QUARTER_PI, TWO_PI+QUARTER_PI, OPEN);

  // fills with dark blue color
  fill(31, 50, 62);
  // draws rectangles in CORNERS mode
  rectMode(CORNERS);
  // draws two rectangles for feet
  rect(145, 340+mouseX/30, 195, 355+mouseX/30, 18, 18, 18, 18);
  rect(205, 340+mouseY/30, 255, 355+mouseY/30, 18, 18, 18, 18);

  //"headsets"
  // fills in the headsets
  fill(33, 133, 197);
  // draws two ellipses for headsets
  ellipse(145+mouseX/30, 65+mouseY/30, 20, 40);
  ellipse(245+mouseX/30, 65+mouseY/30, 20, 40);

  //"cable of headsets"
  // draws blue lines
  stroke(33, 133, 197);
  // draws thicker lines
  strokeWeight(5);
  // does not fill in the cable
  noFill();
  // draws an arc around the head
  arc(195+mouseX/30, 75+mouseY/30, 100, 50, PI+PI+PI, PI+PI+PI+PI, OPEN);

  //"eyes"
  // draws black lines
  stroke(0);
  // draws thinner lines
  strokeWeight(3);
  // draws two points for eyes
  point(175+mouseX/30, 93+mouseY/30);
  point(215+mouseX/30, 93+mouseY/30);

  //"body"
  // draws without lines
  noStroke();
  // fills with gray color
  fill(62, 69, 76);
  // draws rectangles in CORNER mode, the default mode
  rectMode(CORNER);
  // draws a rectangle for the upper body
  // the first two of the radius values are for rounded corners
  rect(175, 120, 50, 90, 18, 18, 0, 0);

  // draws two quadrilaterals for arms
  quad(180, 123, 200, 125, 150, 215+mouseY/30, 135, 215+mouseY/30);
  quad(220, 123, 200, 125, 250, 215+mouseX/30, 265, 215+mouseX/30);

  // fills with rosy color
  fill(255, 127, 102);
  // draws two quadrilaterals for legs
  quad(175, 210, 200, 210, 195, 343+mouseX/30, 180, 343+mouseX/30);
  quad(225, 210, 200, 210, 205, 343+mouseY/30, 220, 343+mouseY/30);

  //"backpack"
  // draws lines with brown color
  stroke(126, 84, 33);
  // draws thick lines
  strokeWeight(10);
  // draws two lines for backpack
  line(185, 123, 178, 210);
  line(215, 123, 222, 210);

  //"musical note"
  // draws with black lines
  stroke(0);
  // draws thin lines
  strokeWeight(2);
  // fills with black color
  fill(0);
  // draws a line
  line(dist+8, step, dist+8, step+20);
  // draws an ellipse
  ellipse(dist+4, 21+step, 8, 4);
  // increments dist
  dist = dist + distbuffer;

  if (dist==width) {
    distbuffer = -5;
  }
  else if (dist==0) {
    distbuffer = 5;
  }

  if (step==height-50) {
    stepbuffer = -50;
  }
  else if (step==0) {
    stepbuffer = 50;
  }
}

// when mouse is clicked, place musical notes at the initial positions
void mouseClicked() {
  step = step + stepbuffer;
  
  // start building a message (with the message address /test):
  OscMessage myMessage = new OscMessage("/noteStep");

  // add some arguments:
  myMessage.add(step); /* add an int to the osc message */

  // and finally, send it:
  oscP5.send(myMessage, myRemoteLocation);
}
