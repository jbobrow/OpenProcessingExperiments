
//sound library & analysis reference
import ddf.minim.*;
import ddf.minim.analysis.*;

//timer things
int actualSecs; //actual seconds elapsed since start
int actualMins; //actual minutes elapsed since start
int startSec = 0; //used to reset seconds shown on screen to 0
int startMin = 0; //used to reset minutes shown on screen to 0
int cSecs; //seconds will be 0-60
int cMins=0; //minutes will be reset at 5
int restartSecs=0; //number of seconds elapsed at last click or 60 sec interval
int restartMins=0; //number of seconds ellapsed at most recent minute or click

//audio stuff
Minim minim;
AudioInput input;

//reset the timer on/off
boolean reset = false;

//set initial sound level
float in = 0;

//stroke color designator
float s = 0;

//height/width
int w = 1440;
int h = 900;

void setup() {
  //sizing
  size(displayWidth, displayHeight);

  //audio
  minim = new Minim(this);
  input = minim.getLineIn(Minim.MONO, 512);

  //do this junk fast
  frameRate(60);
}

void draw() {

  //map input level
  in = input.left.level ()*1000;

  //start timer
  actualSecs = millis()/1000; //convert milliseconds to seconds, store values.
  actualMins = millis() /1000 / 60; //convert milliseconds to minutes, store values.
  cSecs = actualSecs - restartSecs; //seconds to be tracked in the artificial stopwatch
  cMins = actualMins - restartMins; //minutes to be tracked in the artificial stopwatch

  //drawn lines
  line(random(w), random(h), random(w), random(h));
  line(random(w*0.85), random(h*0.85), random(w*0.85), random(h*0.85));
  line(random(w*0.65), random(h*0.65), random(w*0.65), random(h*0.65));
  line(random(w*0.35), random(h*0.35), random(w*0.35), random(h*0.35));
  line(random(w*0.55), random(h*0.55), random(w*0.55), random(h*0.55));
  line(random(w), random(h), random(w), random(h));

  //controls the sensitivity
  if (in > 0) {
    colorShift();
  }

  //Picture/Timer stuff
  if (actualSecs % 60 == 0) { //after 60 secs, restart second timer 
    restartSecs = actualSecs;   //placeholder for this second in time
  }

  //save frame/begin reset
  if ((cMins == 1)) { 
    saveFrame("######.jpg");
    reset = true;
  }

  //send to reset
  if (reset = true) {
    restartSecs = actualSecs; //stores elapsed SECONDS
    cSecs = startSec; //restart timer 
    restartMins = actualMins; //stores elapsed MINUTES
    cMins = startMin; //restart timer
    reset = false;
  }
}


//decides color
void colorShift() {
  //black
  stroke(0);

  //reset lines/colors
  s = 0;

  //change value to make more/less black/white lines appear based on input value
  if (in > 25) {
    s = 1;
    if (s == 1) {
      stroke (255);
    }
  }
}



