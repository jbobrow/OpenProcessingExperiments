
// Sound
import ddf.minim.*;
Minim minim;
AudioSample gallopLoop;
AudioSample endRace;

// Button
float buttonX;
float buttonY;
float buttonW;
float buttonH;
int buttonColor;

// Countdown
float startingTime;
boolean countDown;

// Text
PFont myFont;

// "Racers"
float[] circleX = new float[10];
float[] circleY = new float[10];
float[] yVel = new float[10];
float[] colorR = new float[10];
float[] colorG = new float[10];
float[] colorB = new float[10];

// Race state
boolean raceIsOn = false;
boolean musicIsPlaying = false;

void setup() {
  size(400, 700);
  smooth();
  frameRate(30);
  stroke(150);
  fill(150);

  // Button: Assign values
  buttonX = width/2;
  buttonY = height/2;
  buttonW = 100;
  buttonH = 50;
  buttonColor = 0;

  // Countdown: Assign values
  startingTime = 0;
  countDown = false;

  // Text: Load font & assign values
  myFont = loadFont("321impact-20.vlw");
  textFont(myFont);
  rectMode(CENTER);

  // Make array of racers
  for (int i = 0; i < 10; i++) {

    circleX[i] = 35*(i+1);
    circleY[i] = 0;

    //Set the velocity
    yVel[i] = random(1, 1.5);
  
    // Set the colors
    colorR[i] = (int)random(255);
    colorG[i] = (int)random(255);
    colorB[i] = (int)random(255);
  }

  // Sound: Set the sound
  minim = new Minim(this);
  gallopLoop = minim.loadSample("galloploop.mp3", 512);
  endRace = minim.loadSample("endrace.wav", 512);

  // FIGURE THIS OUT
  //  gallopLoop.trigger();
}

void draw() {
  // Erase sketch
  background(255);
  
  // Draw the button
  text("PLAY", height/2, width/2);
  rect(buttonX, buttonY, buttonW, buttonH);
  fill(buttonColor);
  
  // Start countdown
  clickButton();
  startingTime = millis();

  if (countDown == true) {
    // Display: 3
    if (millis()-startingTime>=1000 && millis()-startingTime<2000) {
      text("3", height/2, width/2);
    }
    // Display: 2
    if (millis()-startingTime>=2000 && millis()-startingTime<3000) {
      text("2", height/2, width/2);
    }
    // Display: 1
    if (millis()-startingTime>=3000 && millis()-startingTime<4000) {
      text("1", height/2, width/2);
    }
    //Start the race
    if (millis()-startingTime>=4000) {
      for (int i = 0; i < 10; i++) {
      fill(colorR[i], colorG[i], colorB[i]);
      ellipse(circleX[i], circleY[i], 15, 15);
      raceIsOn = true;
      }
      // Update racer positions
      update();
    }     
  }
}

void update() {  

  for (int i = 0; i < 10; i++) {

    if (raceIsOn == true) {
      yVel[i] = yVel[i] + random(-0.4, 0.4);

      if (yVel[i] <= 0.2) {
        yVel[i] = random(0.2, 0.4);
      }

      if (circleY[i] + 15 >= height) {
        circleY[i] = height;
        println(circleY[i]);
        raceIsOn = false;
        stop();
      }
    }

    if (raceIsOn == false) {
      stop();
      endRace.trigger();
      noLoop();
    }


    circleY[i] = circleY[i]+yVel[i];
    circleX[i] = 35*(i+1);
  }
}


void clickButton() {
  if (mousePressed == true) {
    if (mouseX >= (height/2 - buttonW) && mouseX <= (height/2 + buttonW) && mouseY >= (width/2 - buttonH) && mouseY <= (width/2 + buttonH)) {
      buttonColor = 150;
      startingTime = millis();
      countDown = true;
    }
  }
}

void mouseReleased() {
  buttonColor = 0;
  startingTime = millis();
}

void stop() {
  gallopLoop.close();
}

/*void playMusic() {
  gallopLoop.trigger();
  musicIsPlaying = false;
}*/


