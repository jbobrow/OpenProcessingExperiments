
import ddf.minim.*;                  // import to enable sound player

/*
 * Globalization and Seasonal Greetings to All.
 *
 * Project 3 submission by David Leslie Williams
 *
 */
//Global Variables
float[] x, y;                        // x,y positions of points
float[] xInc, yInc;                  // change per frame of points
float snowFlakeX, snowFlakeY;        // x,y position of snowflakes
int numArray;                        // number of points
float middleX, middleY, scaler;      // constants from screen size
float proximity;                     // if distance between points < proximity then draw a line between the points
PImage earth, holly, branch, house;  // images used in the piece
boolean clickStart = false;          // boolean to detect click start
boolean houseDisplayed = false;      // boolean to display house once then snow will cover
boolean pause = false;               // set if user presses the pause option
boolean quiet = false;               // set if user wants to turn off the sound.
int option;                          // used for determining choice from the set of patterns
long elapsedTime = 0;                // timer for 5 minutes 
long elapsedTime2 = 0;               // timer for 30 seconds
long startTime = 0;                  // reseting start time for elapsed timer
long startTime2 = 0;                 // non-resetting start time

Minim minim;                         // set up Minim and AudioPlayer
AudioPlayer soundFX;

void setup() {
  //set size to minimum 800x600 as this will display in openprocessing without clipping
  size(800, 600);
  background(0);                      //Black background
  earth = loadImage("earthb.png");    //load the images
  holly = loadImage("holly.png");
  branch = loadImage("branch1.png");
  house = loadImage("house.png"); 
  minim = new Minim(this);                // create instance of minim.
  soundFX = minim.loadFile("jigsaw.mp3"); // load the music file

  numArray = (int) random(50, 100);       // set number of points in the pattern generator random 50 to 100
  x= new float[numArray];                 // allocate space for arrays
  y= new float[numArray];
  xInc= new float[numArray];
  yInc= new float[numArray];

  proximity = 60;                        // set the influence distance - determines max length of lines
  
  setScaling();                          // set scaling as needed in drawEarth()
  instructions();                        // draw the earth and instruction screen
  startTime = millis();                  // initialise start times
  startTime2 = millis();
}

void draw() {                            //Do nothing if mouse has not been clicked or if paused is selected
  if (clickStart && !pause) {
    
    
    elapsedTime = millis() - startTime;    //Test 2 timers - One to restart the globalisation animation after 5 minutes
    elapsedTime2 = millis() - startTime2;  //              - Second to display Seasonal greeting for 30 seconds
    
    if (elapsedTime > 300000) {      //restart with random animation if current one has been running more than 5 minutes
      background(0);                 // black background
      drawEarth();                   // draw the earth
      houseDisplayed = false;        // indicate house not drawn
      startTime = millis();          // reset the start time to start next 5 minutes
      option = (int)random(15);      // select random pattern from 15 available.
    }
    globalization();                 //Globalization displayed
    if (elapsedTime2 > 30000) {      //Seasonal greeting displayed after 30 seconds.
      greetings();
    }
    strokeWeight((int) random(1, 4));  //set random thickness of line between 1 and 3 for pattern

    
    for (int i=0; i<numArray; i++) {    // iterate over each of the points
      
      x[i] += xInc[i];                  //add increment to x and y of each point
      y[i] += yInc[i];
      // if co-ordinates go ouside a circle radius scaler -20 then modify them to be inside and 
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
    //using different strokes depending on option.
    for (int i=0; i<numArray; i++) {
      for (int j=0; j<i; j++) {
        float distance = dist(x[i], y[i], x[j], y[j]  );
        if (distance < proximity) {
          switch(option) {
            case 0:   // greyscale light - short dark - long
              stroke(map(distance, 0, proximity, 255, 0));
              break;
            case 1:   // greyscale light - long dark - short
              stroke(map(distance, 0, proximity, 0, 255));
              break;
            case 2:  // green light - long dark - short
              stroke(0, map(distance, 0, proximity, 0, 255), 0);
              break;
            case 3:  // blue light - long dark - short
              stroke(0, 0, map(distance, 0, proximity, 0, 255));
              break;
            case 4:  // red light - long dark - short
              stroke(map(distance, 0, proximity, 0, 255), 0, 0);
              break;
            case 5:  // green light - short dark - long
              stroke(0, map(distance, 0, proximity, 255, 0), 0);
              break;
            case 6:  // blue light - short dark - long
              stroke(0, 0, map(distance, 0, proximity, 255, 0));
              break;
            case 7:  // red light - short dark - long
              stroke(map(distance, 0, proximity, 255, 0), 0, 0);
              break;
            case 8:  // Yellow light - long dark - short
              stroke(map(distance, 0, proximity, 0, 255), map(distance, 0, proximity, 0, 255), 0);
              break;
            case 9:  // cyan light - long dark - short
              stroke(0, map(distance, 0, proximity, 0, 255), map(distance, 0, proximity, 0, 255));
              break;
            case 10:  // purple light - long dark - short
              stroke(map(distance, 0, proximity, 0, 255), 0, map(distance, 0, proximity, 0, 255));
              break;
            case 11:  // yellow light - short dark - long
              stroke(map(distance, 0, proximity, 255, 0), map(distance, 0, proximity, 255, 0), 0);
              break;
            case 12:  // cyan light - short dark - long
              stroke(0, map(distance, 0, proximity, 255, 0), map(distance, 0, proximity, 255, 0));
              break;
            case 13:  // purple light - short dark - long
              stroke(map(distance, 0, proximity, 255, 0), 0, map(distance, 0, proximity, 255, 0));
              break;
            case 14:  //more random mix of colours and includes transparency
              if (i%5 == 0 && j%5==0 || i%7 == 0 && j%7==0 ) {
                stroke((int)random(80), 255, (int)random(80), (int)random(10));
              } else if (i%3 == 0 && j%3==0 || i%11 == 0 && j%11==0) {
                stroke((int)random(80), (int)random(80), 255, (int)random(5));
              } else {
                stroke(255, (int)random(80), (int)random(80), (int)random(10));
            }
          }
          if (((x[i]-scaler) * (x[i]-scaler)) + ((y[i]-scaler) * (y[i]-scaler)) < ((scaler - 20) *(scaler - 20)) ) {
            line(x[i], y[i], x[j], y[j]  );      // if the point is inside the circle draw line to it
          }
        }
      }
    }
  }
}

void keyPressed() {                        // test for keypad input
  if (key == 'q' || key == 'Q') {          // q for quiet
    quiet = true;
    soundFX.pause();
  }
  if (key == 'm' || key == 'M') {          // m for music
    quiet = false;
    soundFX.loop();
  }
  if (key == 'p' || key == 'P') {          // p for pause / continue toggle
    if (!quiet && !pause){
      soundFX.pause();                     // pause sound if playing
    }
    if (!quiet && pause){                  // start sound if required
      soundFX.loop();
    }
    pause = !pause;
  }
}

void stop() {                              // ensure sound stops when the sketch stops
  super.stop();
}

void mouseClicked() {                      // when mouse clicked restart globalisation
  background(0);                           // clear back ground to black
  houseDisplayed = false;                  // clear house displayed boolean
  proximity =(int) random(50, width/10);   // set a new random proximity distance
  drawEarth();                             // draw the earth
  if (!quiet) {                            // restart sound
    soundFX.loop();
  }
  clickStart = true;                       // set click start flag
  option = (int)random(15);                //randomly select one of the 15 pattern type options
                                           //check if mouse clicked on the earth or not.
  if (((mouseX-scaler) * (mouseX-scaler)) + ((mouseY-scaler) * (mouseY-scaler)) < ((scaler - 20) *(scaler - 20)) ) {
    
    for (int i=0; i<numArray; i++) {       //if clicked on earth start with points localised to mouse click with random directions
      do {
        x[i] = mouseX + random(-10, 10);
        y[i] = mouseY + random(-10, 10);
        xInc[i] = random(-1, 1);
        yInc[i] = random(-1, 1);
      }                                   // ensure points are inside the earth.
      while ( ( (x[i]-scaler) * (x[i]-scaler)) + ((y[i]-scaler) * (y[i]-scaler)) >= ((scaler - 20) *(scaler - 20)) );
    }
  } else {
    randomStart();                       //otherwise start with random points.
  }
}

void setScaling() {                      //set up scaling values to allow image to be resized
  middleY = height/2;
  middleX = width/2;
  if (middleY <= middleX) {             // scaling when width and height are not equal use the smaller value.
    scaler = middleY;
  } else {
    scaler = middleX;
  }
}

void drawEarth() {                    //draw the earth image and apply a random rotation to it.
  pushMatrix();
    translate(scaler, scaler);
    rotate(random(2*PI));
    scale(2*(scaler-20)/1000, 2*(scaler-20)/1000); 
    imageMode(CENTER);
    image(earth, 0, 0);
  popMatrix();
}

void instructions() {                //used in setup to form the opening screen text instructions.
  drawEarth();                       // draw the earth
  textSize(30);                      // set size of text
  fill(255, 0, 0);                   // fill colour red
  String instruct1 = "\n\n                 GLOBALIZATION "+
                     "\n\nClick on the earth for 'localised' start / restart. "+
                     "\nClick ouside the earth for random start / restart."+
                     "\n\nPress P or p to toggle pause / continue."+
                     "\nPress Q or q to turn the music off."+
                     "\nPress M or m to turn the music on."; 
  text(instruct1, 50, 50);          // display instructions
}

void greetings() {                  //Display seasonal greetings and objects
  pushMatrix();
    scale(0.2, 0.2);
    if (!houseDisplayed){
      if (elapsedTime2 < 300000) {  //Display stationary holly for first 5 minutes
        image(holly, (width-60)*4.8, 320);
      }
      image(house, (width-60)*4.7, 1580);  // display house and telephone kiosk
      houseDisplayed = true;               // set flag so house is not redrawn every loop
      image(branch, (width-60)*4.0, 2650); // display branch
    }
  popMatrix();
  snow();                            //start snowing
  if (elapsedTime2 >= 300000) {      //Display rotating holly after 5 minutes
    rotateHolly();
  }
  
  textSize(28);       // Display seasonal greetings on right of screen around the seasonal objects
  fill(255, 0, 0);    // text colour red
  String greeting = "\n\nMerry "+
                    "\n    Xmas "+
                    "\n\n      And"+
                    "\n\n\n\n\n   Happy New "+
                    "\n            Year "+
                    "\n                 To"+
                    "\n                  All.";  
  text(greeting, width-250, 10); // display greeting
}

void snow(){                     //white points for snow effect
 for (int i = 0; i < 40; i++){
   stroke(255);
   strokeWeight(random(3));
   snowFlakeX = random(0,4000);
   snowFlakeY = random(0,3000);
   if (((snowFlakeX-scaler) * (snowFlakeX-scaler)) + ((snowFlakeY-scaler) * (snowFlakeY-scaler)) > ((scaler - 20) * (scaler - 20)) ) {
     point(snowFlakeX, snowFlakeY);    // only draw if outside of the earth
   }
 } 
}

void rotateHolly() {                  // rotate holly for a different effect
  pushMatrix();
    scale(0.2, 0.2);
    translate((width-60)*4.8, 320);
    imageMode(CENTER);
    rotate((frameCount)*(PI/240));
    image(holly, 0, 0);
  popMatrix();
}

void globalization() {              //Display globalisation on left of the screen vertically
  textSize(29);
  fill(0, 255, 0, 50);              // green text 
  String global = "\nG\nL\nO\nB\nA\nL\nI\nZ\nA\nT\nI\nO\nN";
  text(global, 0, 0);
}

void randomStart() {                // random starting position and direction
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


