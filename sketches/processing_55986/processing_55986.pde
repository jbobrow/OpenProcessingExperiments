
int MAX_PULSES = 50000; // max number of events on-screen
int numPulses = 0; // initial number of events on-screen

Pulse pulses[] = new Pulse[MAX_PULSES]; // pulse array

void setup() { // set up us the document
  size(600, 600);
  smooth(); // anti-aliasing ftw
  noStroke(); // no frickin' borders!
}

void draw() { // draw stuff on the screen
  background(0); // black background

  for (int i=0; i < numPulses; i++) { // for all of the pulses that exist
    pulses[i].draw(); // draw ALL THE PULSES!!!!1
  }
}

void mousePressed() { // on left click
  addPulse(mouseX, mouseY); // add another pulse
}

void mouseDragged() { // when the mouse is moved
  addPulse(mouseX, mouseY); // place another pulse at the mouse coords
}

void keyPressed() { // when a key is pressed
  if (key == 32) {  // if it is the space bar
    numPulses = 0; // clear the screen
  } 
}

void addPulse(int newX, int newY) { // new function to add pulse to the screen
  if (numPulses < MAX_PULSES) { // if we have not reached our limit
    pulses[numPulses] = new Pulse(newX, newY); // set a new pulse in the array
    numPulses++; // increase our numPulses variable by one
  }
}

class Pulse {
  float SCALE = random(10,40); // random size from 10-40px in diameter
  int x;    // x-coordinate of the pulse
  int y;    // y-coordinate of the pulse
  float s;  // size of the pulse

  Pulse(int pulseX, int pulseY) { // set the initial pulse variables
    x = pulseX; // set the y-coordinate of the pulse to the determined mouse location
    y = pulseY; // same for x
    s = 0; // reset the size
  }

  void draw() { // this actually draws the pulse ellipse shapes
    fill(random(200,255),random(200,255),random(200,255),random(255)); // random color
    ellipse(x, y, sin(s)*SCALE+random(10), sin(s)*SCALE+random(10)); // draw the ellipse, randomize the H and W a little and make it all wibbly wobbly!
    s += random(0.05); // determine the speed of the pulse based on how much the size changes each frame
  }
}

