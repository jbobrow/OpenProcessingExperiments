
import ddf.minim.*;

/*
 * Globalization
 *
 * Project 3 submission by David Leslie Williams
 *
 */

float[] x;      // position
float[] y;
float[] xInc;   // change per frame
float[] yInc;
int numArray;   // number of elements
float middleX, middleY, scaler;
float proximity;  // if distance between elements < proximity then draw a line between them
PImage earth, holly, branch, house;
boolean clickStart = false;
boolean pause = false;
boolean quiet = false;
int option;
long elapsedTime = 0;
long elapsedTime2 = 0;
long startTime = 0;
long startTime2 = 0;
Minim minim;
AudioPlayer soundFX;

void setup() {
  //set size to minimum 800x600 as this will display in openprocessing without clipping
  size(800, 600);
  background(0);
  earth = loadImage("earthb.png");
  holly = loadImage("holly.png");
  branch = loadImage("branch1.png");
  house = loadImage("house.png"); 
  minim = new Minim(this);
  soundFX = minim.loadFile("jigsaw.mp3");

  numArray = (int) random(50, 100);

  // allocate arrays
  x= new float[numArray];
  y= new float[numArray];
  xInc= new float[numArray];
  yInc= new float[numArray];

  proximity = 60;   // influence distance

  // set scaling as needed in drawEarth()
  setScaling();
  instructions();
  startTime = millis();
  startTime2 = millis();
}

void draw() {
  //Do nothing if mouse has not been clicked or paused
  if (clickStart && !pause) {
    //Start 2 timers - One to restart the globalisation animation after 5 minutes
    //               - Second to delay display of Seasonal greeting and holly rotation
    elapsedTime = millis() - startTime;
    elapsedTime2 = millis() - startTime2;
    //restart with random animation if current one has been running more than 5 minutes
    if (elapsedTime > 300000) {
      background(0);
      drawEarth();
      startTime = millis();
      option = (int)random(15);
    }
    //Globalization displayed
    globalization();
    //Xmas & New Year greeting displayed after 30 seconds.
    if (elapsedTime2 > 30000) {
      greetings();
    }
    //set random thickness of line between 1 and 3
    strokeWeight((int) random(1, 4));

    // iterate over each point
    for (int i=0; i<numArray; i++) {
      //add increment to x and y
      x[i] += xInc[i];
      y[i] += yInc[i];
      // bounce off a circle radius scaler -20
      if (((x[i]-scaler) * (x[i]-scaler)) + ((y[i]-scaler) * (y[i]-scaler)) >= ((scaler - 20) * (scaler - 20)) ) {
        if (x[i] < middleX) {
          xInc[i] =  random(0.1, 1);
        } else if (x[i] > middleX) {
          xInc[i] = -random(0.1, 1);
        } else if (x[i] == middleX) {
          xInc[i] =  random(-1, 1);
        }
        if (y[i] < middleY) {
          yInc[i] =  random(0.1, 1);
        } else if (y[i] > middleY) {
          yInc[i] = -random(0.1, 1);
        } else if (y[i] == middleY) {
          yInc[i] =  random(-1, 1);
        }
      }
    }
    //check if distance between points is less than proximity and if it is draw line between points
    //using different strokes.
    for (int i=0; i<numArray; i++) {
      for (int j=0; j<i; j++) {
        float distance = dist(x[i], y[i], x[j], y[j]  );
        if (distance < proximity) {
          if (option == 0) {
            stroke(map(distance, 0, proximity, 255, 0));
          } else if (option == 1) {
            stroke(map(distance, 0, proximity, 0, 255));
          } else if (option == 2) {
            stroke(0, map(distance, 0, proximity, 0, 255), 0);
          } else if (option == 3) {
            stroke(0, 0, map(distance, 0, proximity, 0, 255));
          } else if (option == 4) {
            stroke(map(distance, 0, proximity, 0, 255), 0, 0);
          } else if (option == 5) {
            stroke(0, map(distance, 0, proximity, 255, 0), 0);
          } else if (option == 6) {
            stroke(0, 0, map(distance, 0, proximity, 255, 0));
          } else if (option == 7) {
            stroke(map(distance, 0, proximity, 255, 0), 0, 0);
          } else if (option == 8) {
            stroke(map(distance, 0, proximity, 0, 255), map(distance, 0, proximity, 0, 255), 0);
          } else if (option == 9) {
            stroke(0, map(distance, 0, proximity, 0, 255), map(distance, 0, proximity, 0, 255));
          } else if (option == 10) {
            stroke(map(distance, 0, proximity, 0, 255), 0, map(distance, 0, proximity, 0, 255));
          } else if (option == 11) {
            stroke(map(distance, 0, proximity, 255, 0), map(distance, 0, proximity, 255, 0), 0);
          } else if (option == 12) {
            stroke(0, map(distance, 0, proximity, 255, 0), map(distance, 0, proximity, 255, 0));
          } else if (option == 13) {
            stroke(map(distance, 0, proximity, 255, 0), 0, map(distance, 0, proximity, 255, 0));
          } else {
            if (i%5 == 0 && j%5==0 || i%7 == 0 && j%7==0 ) {
              stroke((int)random(80), 255, (int)random(80), (int)random(10));
            } else if (i%3 == 0 && j%3==0 || i%11 == 0 && j%11==0) {
              stroke((int)random(80), (int)random(80), 255, (int)random(5));
            } else {
              stroke(255, (int)random(80), (int)random(80), (int)random(10));
            }
          }
          if (((x[i]-scaler) * (x[i]-scaler)) + ((y[i]-scaler) * (y[i]-scaler)) < ((scaler - 20) *(scaler - 20)) ) {
            line(x[i], y[i], x[j], y[j]  );
          }
        }
      }
    }
  }
}

void keyPressed() {
  //q for quiet
  if (key == 'q' || key == 'Q') {
    quiet = true;
    soundFX.pause();
  }
  //m for music
  if (key == 'm' || key == 'M') {
    quiet = false;
    soundFX.loop();
  }
  //p for pause / continue toggle
  if (key == 'p' || key == 'P') {
    pause = !pause;
  }
}

void stop() {
  // stops sound when sketch stopped.
  super.stop();
}

void mouseClicked() {
  //when mouse clicked restart globalisation
  background(0);
  proximity =(int) random(50, width/10);
  drawEarth();
  if (!quiet) {
    soundFX.loop();
  }
  clickStart = true;
  //randomly select one of the 15 pattern type options
  option = (int)random(15);
  //check if mouse clicked on the earth or not.
  if (((mouseX-scaler) * (mouseX-scaler)) + ((mouseY-scaler) * (mouseY-scaler)) < ((scaler - 20) *(scaler - 20)) ) {
    //if clicked on earth start with points localised to location of mouse click with random directions
    for (int i=0; i<numArray; i++) {
      do {
        x[i] = mouseX + random(-10, 10);
        y[i] = mouseY + random(-10, 10);
        xInc[i] = random(-1, 1);
        yInc[i] = random(-1, 1);
      } 
      while ( ( (x[i]-scaler) * (x[i]-scaler)) + ((y[i]-scaler) * (y[i]-scaler)) >= ((scaler - 20) *(scaler - 20)) );
    }
  } else {
    //otherwise start with random points.
    randomStart();
  }
}

void setScaling() {
  //set up scaling values to allow image to be resized
  //Note: resizing removed for project as it messes up on javascript.
  middleY = height/2;
  middleX = width/2;
  //to alow for scaling when width and height are not equal use the smaller value.
  if (middleY <= middleX) {
    scaler = middleY;
  } else {
    scaler = middleX;
  }
}

void drawEarth() {
  //draw the earth image and apply a random rotation to it.
  pushMatrix();
    translate(scaler, scaler);
    rotate(random(2*PI));
    scale(2*(scaler-20)/1000, 2*(scaler-20)/1000); 
    imageMode(CENTER);
    image(earth, 0, 0);
  popMatrix();
}

void instructions() {
  //used in setup to form the opening screen text instructions.
  drawEarth();
  textSize(30);
  fill(255, 0, 0);
  String instruct1 = "\n\n                 GLOBALIZATION \n\nClick on the earth for 'localised' start / restart. \nClick ouside the earth for random start / restart.\n\nPress P or p to toggle pause / continue.\nPress Q or q to turn the music off.\nPress M or m to turn the music on."; 
  text(instruct1, 50, 50);
}

void greetings() {
  //Display seasonal greetings and objects
  pushMatrix();
    scale(0.2, 0.2);
    //Display stationary holly for first 5 minutes
    if (elapsedTime2 < 300000) {
      image(holly, (width-60)*4.8, 320);
    }
    image(house, (width-60)*4.6, 1580);
    image(branch, (width-60)*4.0, 2650);
  popMatrix();
  //Display rotating holly after 5 minutes
  if (elapsedTime2 >= 300000) {
    rotateHolly();
  }
  //Display seasonal greetings in red on right of screen around the seasonal objects
  textSize(28);
  fill(255, 0, 0);
  String greeting = "\n\nMerry \n    Xmas \n\n      And\n\n\n\n\n   Happy New \n            Year \n                 To\n                  All.";  
  text(greeting, width-250, 10);
}

void rotateHolly() {
  // rotate holly for a different effect
  pushMatrix();
    scale(0.2, 0.2);
    translate((width-60)*4.8, 320);
    imageMode(CENTER);
    rotate((frameCount)*(PI/240));
    image(holly, 0, 0);
  popMatrix();
}

void globalization() {
  //Display globalisation on left of the screen vertically
  textSize(29);
  fill(0, 255, 0, 50);
  String global = "\nG\nL\nO\nB\nA\nL\nI\nZ\nA\nT\nI\nO\nN";
  text(global, 0, 0);
}

void randomStart() {
  // random starting position and direction
  for (int i=0; i<numArray; i++) {
    do {
      x[i] = random(width);
      y[i] = random(height);
    }
    while ( ( (x[i]-scaler) * (x[i]-scaler)) + ((y[i]-scaler) * (y[i]-scaler)) >= ((scaler - 20) *(scaler - 20)) );
    xInc[i] = random(-1, 1);
    yInc[i] = random(-1, 1);
  }
}


