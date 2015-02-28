
// Meet Fangs 
// Developed in September, 2009
// Developed by Julio Terra

fangs [] myFangs = new fangs [1]; // declaring instances of object fangs
color fangColor1;  // color for first
int startx; // x coordinate start position for each bat
int starty;  // y coordinate start position for each bat
color backColor = color(150,225,100); // set the background color

//***********
// Application SETUP
//***********

void setup() {

  // setting the size of the window and smoothness
  size (1000, 450);        // bat movement will adjust to screen size
  smooth();

  // initiating additional variables
  startx = width/2;      // initiate x coordinate
  starty = height/2;     // initiated y coordinate 
  fangColor1 = #000000;

  // loop to initiate the array of bats by setting color and location
  for (int fangCount = 0; fangCount < myFangs.length; fangCount++) {
    myFangs[fangCount] = new fangs(fangColor1,startx,starty);          // initiates the first bat, which follows the coordinate
    myFangs[fangCount].sizeSet(100);                                    // set size of bat using the sizeSet function from the fangs object
  }

}

//************************
// DRAW Function
//************************

void draw() {
  // setting background color
  background (backColor);

  // loop to draw each bat from the array of bats
  // loop counts backwards to ensure black pointer bat is in the front
  for (int fangCount = 1; fangCount <= myFangs.length; fangCount++) {
 
    // LOGIC - determine whether bat should move randomly and which should follow the mouse
    if (fangCount == myFangs.length) {                       // if the loop has reached the length of the array then draw the pointer bat in the front
      myFangs[0].mouseFollow(fangColor1, mouseX, mouseY);    // move the coordinates of the black pointer bat by following the mouse coordinates using the mouseFollow function of the bat object
      myFangs[0].display();                                  // display the black pointer bat
    }
    else if (fangCount < myFangs.length){                    // if loop is lower than length of array then draw the bat on the screen using random move function
      myFangs[fangCount].randomMove();                       // move the coordinates of all randomly moving bats using the randomMove function of the bat object
      myFangs[fangCount].display();
    }  

    // draw bat on screen by calling the display function from the fangs object
  }
  
}

//************************
// Response to MOUSEPRESS
//************************

// creates a new fangs when mouse is pressed
void mousePressed() {
  color newColor = color(random(254), random(254), random(254));     // set random color for the new bat
  fangs newFangs = new fangs(newColor, mouseX, mouseY);              // create new fangs variable
//  fangs newFangs = new fangs(newColor, mouseX + 90*myFangs[0].fangSize, mouseY + 65*myFangs[0].fangSize);              // create new fangs variable
  myFangs = (fangs[]) append (myFangs, newFangs);                    // append fangs variable to end of myFangs array
  myFangs[myFangs.length-1].sizeRandom();                            // randomly set the size of the new bat
}

// randomly change directions of all bats when a key is pressed
void keyPressed() {
  for (int fangCount2 = myFangs.length-1; fangCount2 >= 0; fangCount2--) {      // loop to change the direction of all randomly moving bats
//    myFangs[fangCount2].changeDir();                                            // change the direction of each bat using the changeDir function from the fangs object
    myFangs[fangCount2].rotateBat();                                            // rotate the orientation of all bats
  }
}


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
  float transX, transY;                                // holds location of translated coordinates

  fangs(color tempC, float tempx, float tempy) {    //construction of fangs data type (this is essentially the setup section of the object)
    batColor = tempC;
    xspeed = random(-6,6);          // generate x speed
    yspeed = random(-6,6);          // generate y speed
    fangSize = 0;                   // holds the relative size of the bat (original x 180, x 130)
    batRotation = radians(0);       // sets rotation degrees to 0 so that bats will start upright
    newRotation = radians(0);       // initializes variable
    transX = tempx;                 // initializing translated x coordinates with user provided value
    transY = tempy;                 // initializing translated y coordinates with user provided value
 }

  void sizeSet (float tempSize) {  // function that enables the setting of the size of the bat
    fangSize = map(tempSize, 0, 200, 0, 2); 
  }

  void sizeRandom () {
    fangSize = map(random (0,15), 0, 15, 0.5, 1.25);   // holds the relative size of the bat (original x 180, x 130)
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
    if (transX > width - 90*fangSize && xspeed > 0)    {
        xspeed = -xspeed;    
        }
    else if (transX < 90*fangSize && xspeed < 0)       {
        xspeed = - xspeed;    
        }
    if (transY > height - 65*fangSize && yspeed > 0)   {
        yspeed = -yspeed;    
        }
    else if (transY < 65*fangSize && yspeed < 0)       {
        yspeed = -yspeed;    
      }

     // update position variables based on speed
     transX = transX + xspeed;
     transY = transY + yspeed;
  }

//   void sleepMove () {
     
  
  

   void changeDir() {          // function that changes the direction of the bat to a random new direction
      xspeed = random(-6,6); 
      yspeed = random(-6,6);
   }

   void rotateBat() {          // function that rotates the bats
         newRotation = radians(xspeed*3);
   }

   void display() {           // function that displays the bat in the location set by one of the movement functions
    //draw wings
 
    pushMatrix();
    translate(transX, transY);
    if (newRotation != 0){ 
       batRotation = batRotation + newRotation;
       newRotation = radians(0);
       }
    rotate(batRotation);    

    noStroke();
    fill(batColor);
    triangle (40*fangSize-95*fangSize, 0-65*fangSize, 70*fangSize-95*fangSize, 40*fangSize-65*fangSize, 0-95*fangSize, 110*fangSize-65*fangSize);
    triangle (40*fangSize-95*fangSize, 40*fangSize-65*fangSize, 70*fangSize-95*fangSize, 40*fangSize-65*fangSize, 20*fangSize-95*fangSize, 120*fangSize-65*fangSize);
    triangle (30*fangSize-95*fangSize, 40*fangSize-65*fangSize, 100*fangSize-95*fangSize, 40*fangSize-65*fangSize, 60*fangSize-95*fangSize, 120*fangSize-65*fangSize);
    triangle (70*fangSize-95*fangSize, 60*fangSize-65*fangSize, 110*fangSize-95*fangSize, 60*fangSize-65*fangSize, 90*fangSize-95*fangSize, 130*fangSize-65*fangSize);
    triangle (80*fangSize-95*fangSize, 40*fangSize-65*fangSize, 150*fangSize-95*fangSize, 40*fangSize-65*fangSize, 120*fangSize-95*fangSize, 120*fangSize-65*fangSize);
    triangle (110*fangSize-95*fangSize, 40*fangSize-65*fangSize, 140*fangSize-95*fangSize, 40*fangSize-65*fangSize, 160*fangSize-95*fangSize, 120*fangSize-65*fangSize);
    triangle (110*fangSize-95*fangSize, 40*fangSize-65*fangSize, 140*fangSize-95*fangSize, 0-65*fangSize, 180*fangSize-95*fangSize, 110*fangSize-65*fangSize);

    // draw the ears
    fill(batColor);
    triangle (70*fangSize-90*fangSize, 0-65*fangSize, 80*fangSize-90*fangSize, 40*fangSize-65*fangSize, 60*fangSize-90*fangSize, 40*fangSize-65*fangSize);
    triangle (110*fangSize-90*fangSize, 0-65*fangSize, 120*fangSize-90*fangSize, 40*fangSize-65*fangSize, 100*fangSize-90*fangSize, 40*fangSize-65*fangSize);

    // draw head
    fill(batColor);
    ellipseMode (CORNER);
    ellipse (60*fangSize-90*fangSize,15*fangSize-65*fangSize, 60*fangSize, 45*fangSize);

    // draw eyes
    fill (235);
    ellipseMode (CORNER);
    // left eye placement x: 65 - 88, y: 30 - 49
    ellipse (65*fangSize-90*fangSize, 30*fangSize-65*fangSize, 23*fangSize, 19*fangSize);
    // right eye placement x: 92 - 115, y: 30 - 49
    ellipse (92*fangSize-90*fangSize, 30*fangSize-65*fangSize, 23*fangSize, 19*fangSize);

    //LOGIC - calculate pupil location based on location of bat
    pupilx = 70*fangSize - 90*fangSize + map(width-transX, 0, width, 0, 12*fangSize);
    pupily = 39*fangSize - 65*fangSize + map(height-transY, 0, height, 0, 6*fangSize);

//    pupilx = 70*fangSize - 90*fangSize + map(width-xpos-90*fangSize, 0, width, 0, 12*fangSize);
//    pupily = 39*fangSize - 65*fangSize + map(height-ypos-65*fangSize, 0, height, 0, 6*fangSize);

    // draw pupils
    ellipseMode (CENTER);
    fill (0);
    ellipse (pupilx, pupily, 5*fangSize, 5*fangSize);
    ellipse (pupilx + 28*fangSize, pupily, 5*fangSize, 5*fangSize); // add 28 to adjust placement of second eye

    // draw eyebrow
    fill(batColor);
    rectMode (CORNER);
    rect (65*fangSize-90*fangSize,30*fangSize-65*fangSize,50*fangSize,6*fangSize);

    // draw fangs
    fill (235);
    triangle (76*fangSize-90*fangSize, 60*fangSize-65*fangSize, 85*fangSize-90*fangSize, 60*fangSize-65*fangSize, 79*fangSize-90*fangSize, 68*fangSize-65*fangSize);
    triangle (85*fangSize-90*fangSize, 60*fangSize-65*fangSize, 90*fangSize-90*fangSize, 60*fangSize-65*fangSize, 87*fangSize-90*fangSize, 63*fangSize-65*fangSize);
    triangle (90*fangSize-90*fangSize, 60*fangSize-65*fangSize, 95*fangSize-90*fangSize, 60*fangSize-65*fangSize, 93*fangSize-90*fangSize, 63*fangSize-65*fangSize);
    triangle (96*fangSize-90*fangSize, 60*fangSize-65*fangSize, 105*fangSize-90*fangSize, 60*fangSize-65*fangSize, 101*fangSize-90*fangSize, 73*fangSize-65*fangSize);

    // draw legs
    stroke(batColor);
    strokeWeight (1);
    line (30*fangSize-90*fangSize, -5*fangSize-65*fangSize, 35*fangSize-90*fangSize, 0-65*fangSize);
    line (35*fangSize-90*fangSize, -5*fangSize-65*fangSize, 35*fangSize-90*fangSize, 0-65*fangSize);
    line (40*fangSize-90*fangSize, -5*fangSize-65*fangSize, 35*fangSize-90*fangSize, 0-65*fangSize);

    line (130*fangSize-90*fangSize, -5*fangSize-65*fangSize, 135*fangSize-90*fangSize, 0-65*fangSize);
    line (135*fangSize-90*fangSize, -5*fangSize-65*fangSize, 135*fangSize-90*fangSize, 0-65*fangSize);
    line (140*fangSize-90*fangSize, -5*fangSize-65*fangSize, 135*fangSize-90*fangSize, 0-65*fangSize);

popMatrix();

  }  // close display () function

}  // close fangs class




