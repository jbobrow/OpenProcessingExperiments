
//************************
// SETUP Class Fangs
//************************

class fangs{
  // declaration of variables for fangs class
  color batColor;                                      // holds bat color, which is provided as an argument in the fangs object
  float pupilx, pupily;                                // holds the position of the bat pupils
  float yspeed, xspeed;                                // holds the speed of the x and y coordinates
  float fangSize;                                      // holds random size as a percentage of full size (x 180, y 130)
  float batRotation;                                   // holds current rotation of the bat
  float newRotation;                                   // holds new rotation value
  float oldRotation;                                   // holds old rotation value (pre-sleeping mode)
  float transX, transY;                                // holds location of bat at all times
  float sleepX,sleepY;                                 // holds location of bat before sleepMode
  boolean sleepMode;                                   // holds status information about whether bat is in sleep mode
  boolean wakeSet;                                     // holds information about awake (e.g. launching) the bats after sleep mode
  float eyeStatus, eyeClosed, eyeOpen;                 // holds the thickness of eyebrow


  fangs(color tempC, float tempx, float tempy) {    //construction of fangs data type (this is essentially the setup section of the object)
    batColor = tempC;
    xspeed = random(-6,6);          // generate x speed
    yspeed = random(-6,6);          // generate y speed
    fangSize = 0;                   // holds the relative size of the bat (original x 180, x 130)
    batRotation = radians(0);       // sets rotation degrees to 0 so that bats will start upright
    newRotation = radians(0);       // initializes newRotation to 0 degrees
    oldRotation = radians(0);       // initializes oldRotation to 0 degrees
    transX = tempx;                 // initializing x coordinates of the bat
    transY = tempy;                 // initializing y coordinates of the bat
    sleepX = tempx;                 // initializes sleepX coordinate to current x location
    sleepY = tempy;                 // initializes sleepY coordinate to current y location
    sleepMode = false;
    wakeSet = false;
    eyeClosed = 20;
    eyeOpen = 7;
    eyeStatus = eyeOpen;
 }


  void sizeSet (float tempSize) {  // function that enables the setting of the size of the bat
    fangSize = map(tempSize, 0, 200, 0, 2); 
  }


  float sizeReturn () {  // function that enables the setting of the size of the bat
    return fangSize; 
  }


  void sizeRandom () {
    fangSize = map(random (0,15), 0, 15, 0.6, 1.25);   // holds the relative size of the bat (original x 180, x 130)
  }


  void mouseFollow(color drawc, float xdraw, float ydraw) {   // function that enables the bat to follow the mouse
    // set position variables (use fangSize to move center of fangs 
    transX = xdraw;    
    transY = ydraw;
    batColor= drawc;
  }
  

  void randomMove() {   // function that enables the bat to randomly move
    // LOGIC that determines when bat has reached edge of window
    // also checks to confirm that original direction, based on speed, aligns with expectations before changing direction
    xspeed = speedXadj(xspeed, transX);
    yspeed = speedYadj(yspeed, transY);
    transX = transX + xspeed;
    transY = transY + yspeed;

  }


  // function that checks the speed and location of the bat to ensure that the does not go off screen horizontally
  float speedXadj(float moveXspeed, float curXlocation) {  
    float tempXspeed = moveXspeed;
    float tempXLoc = curXlocation;
    if (tempXLoc > width - 90*fangSize && tempXspeed > 0 || tempXLoc < 90*fangSize && tempXspeed < 0)   {
       tempXspeed = tempXspeed * -1;    
        }
    return tempXspeed;                         // returns adjusted X speed
  }

  // function that checks the speed and location of the bat to ensure that the does not go off screen vertically
  float speedYadj(float moveYspeed, float curYlocation) {
    float tempYSpeed = moveYspeed;
    float tempYLoc = curYlocation;
    if (tempYLoc > height - 65*fangSize && tempYSpeed > 0 || tempYLoc < 65*fangSize && tempYSpeed < 0)   {
       tempYSpeed = tempYSpeed * -1;    
        }
    return tempYSpeed;                         // returns adjusted Y speed
  }


  void setSleepLocation() {                    // save location of bat for return after sleep mode
   oldRotation = batRotation;
   sleepX = transX;
   sleepY = transY;
  }
  
  void sleepMove() {                            // function that moves the bats to the top of the screen.
  wakeSet = false;                              // set the wake status to false
  if (transY > 55*fangSize) {                   // if the bat is higher than sleeping posision
    transY = transY -8;                         // move the bat up towards -3
    transX = transX + xspeed/2;
  }

  // if the bat is close to the top of the page (transY), his rotation is not upside down (batRotation), and his status is not a sleep (sleepMode)  
  if (transY < 180*fangSize) {
      if(sleepMode == false) {
         if (degrees(batRotation) > 190 ) {
            newRotation = radians(-8);                  // rotate the bat 5 degress at a time till he reaches sleeping position
         }
         else if (degrees(batRotation) < 170) {
            newRotation = radians(14);                  // rotate the bat 5 degress at a time till he reaches sleeping position
         }
         else {
            batRotation = radians(180);                // set bat rotation to 180 degrees (upside down)
            sleepMode = true;                           // set bat status to sleep
            eyeStatus = eyeClosed;
         }           
      }
    if (eyeStatus < eyeClosed) {                  // check if eyes are opened
       eyeStatus++;                              // open eyes
     }     

  }
  }
  
   void wakeMove() {                           // function that makes bats wake up from sleeping 
   sleepMode = false;                          // set sleepMode to false
   if (eyeStatus > eyeOpen) {                  // check if eyes are opened
     eyeStatus--;                              // open eyes
   }     
   // check if bat has already returned to his previous location from an x perspective
   if (transY < sleepY) {  
      transY = transY + abs(yspeed*2); 
   }
   // check if bat has already rotate to be right side up
   if (degrees(batRotation) <= 5) {
      wakeSet = true;                           // set bat awake status to true
      batRotation = radians (0);
   }
   else {                                       
      newRotation = radians(-8);                // rotate the bat 5 degress at a time till he reaches sleeping position
     }
    } 

    boolean wakeStatus() {                      // return status of the bat
       return wakeSet;
   }
  
   void randomDir() {          // function that changes the direction of the bat to a random new direction
      xspeed = random(-6,6); 
      yspeed = random(-6,6);
   }


   void rotateBat(boolean rotateDir) {          // function that rotates the bats
         boolean rotateTest = rotateDir;
         if (rotateTest == true)  {
           newRotation = radians(xspeed*3);
//            println(newRotation);
         }
         else if (rotateTest == false){
           newRotation = radians(xspeed*3*-1);
//           println(newRotation);
         }
   }

   
    void display() {           // function that displays the bat in the location set by one of the movement functions
    //move the origin of the screen to the location where the bat will be drawn
    pushMatrix();
    translate(transX, transY);

    // LOGIC = check to see if bat should be rotated (if newRotation variable is not equal 0)
    if (degrees(newRotation) != 0){ 
       batRotation = batRotation + newRotation;
       newRotation = radians(0);
       }
    rotate(batRotation);    

    //draw wings 
    noStroke();
    fill(batColor);
    triangle (-55*fangSize,   -65*fangSize,   -25*fangSize,   -25*fangSize,   -95*fangSize,   45*fangSize);
    triangle (-55*fangSize,   -25*fangSize,   -25*fangSize,   -25*fangSize,   -75*fangSize,   55*fangSize);
    triangle (-65*fangSize,   -25*fangSize,   5*fangSize,     -25*fangSize,   -35*fangSize,   55*fangSize);
    
    triangle (-30*fangSize,   -25*fangSize,    30*fangSize,    -25*fangSize,    0,    65*fangSize);

    triangle (55*fangSize,   -65*fangSize,   25*fangSize,   -25*fangSize,   95*fangSize,   45*fangSize);
    triangle (55*fangSize,   -25*fangSize,   25*fangSize,   -25*fangSize,   75*fangSize,   55*fangSize);
    triangle (65*fangSize,   -25*fangSize,   -5*fangSize,   -25*fangSize,   35*fangSize,   55*fangSize);
    
    // draw the ears
    fill(batColor);
    triangle (-20*fangSize,   -65*fangSize,   -30*fangSize,   -25*fangSize,   -10*fangSize,   -25*fangSize);
    triangle (20*fangSize,    -65*fangSize,   30*fangSize,    -25*fangSize,   10*fangSize,    -25*fangSize);

    // draw head
    fill(batColor);
    ellipseMode (CENTER);
    ellipse (0,-28*fangSize,  60*fangSize,   45*fangSize);

    // draw eyes
    fill (235);
    ellipseMode (CORNER);
    // left eye placement x: 65 - 88, y: 30 - 49
    ellipse (-25*fangSize, -35*fangSize, 23*fangSize, 19*fangSize);
    // right eye placement x: 92 - 115, y: 30 - 49
    ellipse (2*fangSize, -35*fangSize, 23*fangSize, 19*fangSize);

    //LOGIC - calculate pupil location based on location of bat
    pupilx = -20*fangSize + map(width-transX, 0, width, 0, 12*fangSize);
    pupily = -26*fangSize + map(height-transY, 0, height, 0, 6*fangSize);

    // draw pupils
    ellipseMode (CENTER);
    fill (0);
    ellipse (pupilx, pupily, 5*fangSize, 5*fangSize);
    ellipse (pupilx + 28*fangSize, pupily, 5*fangSize, 5*fangSize); // add 28 to adjust placement of second eye

    // draw eyebrow
    fill(batColor);
    rectMode (CORNER);
    rect (-27*fangSize,-36*fangSize,53*fangSize,eyeStatus*fangSize);

    // draw fangs
    noStroke();
    fill (235);
    triangle (-14*fangSize,   -5*fangSize,   -5*fangSize,   -5*fangSize,   -11*fangSize,   3*fangSize);
    triangle (-5*fangSize,    -5*fangSize,   0,             -5*fangSize,   -3*fangSize,    -2*fangSize);
    triangle (0,              -5*fangSize,   5*fangSize,    -5*fangSize,   3*fangSize,     -2*fangSize);
    triangle (6*fangSize,     -5*fangSize,   15*fangSize,   -5*fangSize,   11*fangSize,    8*fangSize);

    // draw legs
    stroke(batColor);
    strokeWeight (1);
    line (-60*fangSize,   -70*fangSize,   -55*fangSize,   -65*fangSize);
    line (-55*fangSize,   -70*fangSize,   -55*fangSize,   -65*fangSize);
    line (-50*fangSize,   -70*fangSize,   -55*fangSize,   -65*fangSize);

    line (60*fangSize,    -70*fangSize,   55*fangSize,    -65*fangSize);
    line (55*fangSize,    -70*fangSize,   55*fangSize,    -65*fangSize);
    line (50*fangSize,    -70*fangSize,   55*fangSize,    -65*fangSize);

popMatrix();

  }  // close display () function

}  // close fangs class


