
import ddf.minim.*;
import ddf.minim.signals.*;

PFont myFont;

Minim minim;
Minim minim2;
AudioInput in;
AudioOutput out;
SineWave sine;

Ball ballArray[];
Goal goalArray[];

int ballNumber;
int goalNumber;
int goalIndex;
int goalCounter;
int frameCounter;
int seconds;
int roundTimeLimit;
boolean gameOver;
//boolean upPressed;
//boolean downPressed;

void setup() {
  size(500, 500);
  myFont=loadFont("font.vlw");
  ballNumber=1;
  goalNumber=100;
  goalIndex=0;
  seconds=0;
  roundTimeLimit=20;
  gameOver=false;
  frameCounter=0;
  //  upPressed=false;
  //  downPressed=false;

  InitiateBall();
  InitiateGoal();

  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 2048);

  minim2 = new Minim(this);
  // get a line out from Minim, default bufferSize is 1024, default sample rate is 44100, bit depth is 16
  out = minim2.getLineOut(Minim.STEREO);
  // create a sine wave Oscillator, set to 440 Hz, at 0.5 amplitude, sample rate from line out
  sine = new SineWave(440, 0.5, out.sampleRate());
  // set the portamento speed on the oscillator to 200 milliseconds
  sine.portamento(200);
  // add the oscillator to the line out
  out.addSignal(sine);
}

void draw() {
  if (!gameOver) {
    rectMode (CENTER);
    noStroke();
    fill(255, 255, 255, 60);
    rect(width/2, height/2, width, height); 
    fill (255, 0, 0);
    rect (width/2, height/2, 10, height - 40);

    DisplayGoal();
    DisplayBall();
    UpdateGoal();
    UpdateBall();
    BallLast();
    freqChange();
    textFont(myFont, 20);
    fill(0);
    textAlign(LEFT);
    text("Level: " + (goalIndex+1), 10, 50);
    textAlign(RIGHT);
    text("Timer: " + (roundTimeLimit-seconds), 450, 50);
    frameCounter++;
    seconds=frameCounter/60;
  }
  else if (gameOver) {
    stop();
    background(0);
    fill(255);
    textFont(myFont, 48); 
    textAlign(CENTER);
    text("GAME OVER", width/2, 225);
    textFont(myFont, 30); 
    text("Press the R key to reset.", width/2, 275);
  }
}

void freqChange() {
  for (int i=0; i<ballNumber; i++) {
    float freq = map(ballArray[i].posY, 35, height-35, 1500, 60);
    sine.setFreq(freq);
  }
}

void InitiateBall() {
  ballArray = new Ball[ballNumber]; 

  for (int i = 0; i < ballArray.length; i++) { //iniate each  ball with for loop
    ballArray[i] = new Ball();
    ballArray[i].init(width/2, height-20, 40, color(0));
  }
}

void DisplayBall() {
  for (int i = 0; i < ballNumber; i++) {
    ballArray[i].drawBall();
  }
}

void UpdateBall() {

  for (int i = 0; i < ballNumber; i++) {
    ballArray[i].updateBall();
  }
}

void BallLast() {
  for (int i =0 ; i<ballNumber; i++) {
    ballArray[i].posYLast=ballArray[i].posY;
  }
}


void InitiateGoal() {
  goalArray = new Goal[goalNumber]; 

  for (int i = 0; i < goalArray.length; i++) { //iniate each  ball with for loop
    goalArray[i] = new Goal();
    goalArray[i].init(width/2, random(200, 400), 150-i*5, color(0, 255, 0));
  }
}

void DisplayGoal() {
  goalArray[goalIndex].drawGoal();
}

void UpdateGoal() {

  for (int i = 0; i < goalNumber; i++) {
    goalArray[i].updateGoal();
  }
}

void stop() {
  out.close();
  minim.stop();
}

//void keyPressed() {
//
//  if (keyCode == UP) {
//    upPressed=true;
//  }
//  if (keyCode == DOWN) {
//    downPressed=true;
//  }
//}

void keyReleased() {
  if (keyCode == 'R') {
    stop();
    setup();
  }

  //  if (keyCode == UP) {
  //    upPressed=false;
  //  }
  //  if (keyCode == DOWN) {
  //    downPressed=false;
  //  }
}


