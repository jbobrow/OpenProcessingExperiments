
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
  size (400, 600);        // bat movement will adjust to screen size
  smooth();

  // initiating additional variables
  startx = width/2;      // initiate x coordinate
  starty = height/2;     // initiated y coordinate 
  fangColor1 = #000000;

  // loop to initiate the array of bats by setting color and location
  for (int fangCount = 0; fangCount < myFangs.length; fangCount++) {
    myFangs[fangCount] = new fangs(fangColor1,startx,starty);          // initiates the first bat, which follows the coordinate
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
  myFangs = (fangs[]) append (myFangs, newFangs);                    // append fangs variable to end of myFangs array

}

// randomly change directions of all bats when a key is pressed
void keyPressed() {
  for (int fangCount2 = myFangs.length-1; fangCount2 >= 0; fangCount2--) {      // loop to change the direction of all randomly moving bats
    myFangs[fangCount2].changeDir();                                            // change the direction of each bat using the changeDir function from the fangs object
  }
}


//************************
// SETUP Class Fangs
//************************

class fangs{
  // declaration of variables for fangs class
  color batColor;                                      // holds bat color, which is provided as an argument in the fangs object
  float xpos, ypos, pupilx, pupily;                    // holds the position of the bat and its pupils
  float yspeed, xspeed;                                // holds the speed of the x and y coordinates
  float directionx, directiony;                        // holds the initial direction of the bat (necessary for changeDir function
  float fangSize;                                      // holds random size as a percentage of full size (x 180, y 130)


  fangs(color tempC, float tempx, float tempy) {    //construction of fangs data type (this is essentially the setup section of the object)
    batColor = tempC;
    xspeed = random(0,6);           // generate x speed
    yspeed = random(0,6);           // generate y speed
    directionx = random (0,2);      // generage x direction - 0 = left, 1 or more = right
    directiony = random (0,2);      // generage y direction - 0 = down, 1 or more = up
    fangSize = map(random (0,15), 0, 15, 0.5, 1.25);   // holds the relative size of the bat (original x 180, x 130)
    xpos = tempx - 90*fangSize;     // sets x position to middle of bat (using the size to scale the middle point)
    ypos = tempy - 65*fangSize;     // sets y position to middle of bat (using the size to scale the middle point)
 }

  void mouseFollow(color drawc, float xdraw, float ydraw) {   // function that enables the bat to follow the mouse
    // set position variables (use fangSize to move center of fangs 
    xpos = xdraw - 90*fangSize;    
    ypos = ydraw - 65*fangSize;
    batColor= drawc;
  }
  
  void randomMove() {   // function that enables the bat to randomly move
    // LOGIC that determines when bat has reached edge of window
    // also checks to confirm that original direction, based on speed, aligns with expectations before changing direction
    if (xpos > width - (180*fangSize) && xspeed > 0 || directionx < 1 && xspeed > 0)  {
        xspeed = -xspeed;    }
    else if (xpos < 0 && xspeed < 0 )       {
        xspeed = -xspeed;    }
    if (ypos > height - (130*fangSize) && yspeed > 0 || directiony < 1 && yspeed > 0) {
        yspeed = -yspeed;    }
    else if (ypos < 0 && yspeed <0)       {
        yspeed = -yspeed;    }

     // update position variables based on speed
     xpos = xpos + xspeed;
     ypos = ypos + yspeed;
     directionx = directionx+2;  
     directiony = directiony+2;
  }

   void changeDir() {    // function that changes the direction of the bat to a random new direction
      xspeed = random(-6,6); 
      yspeed = random(-6,6);
   }
      
      
   void display() { // function that displays the bat in the location set by one of the movement functions
    //draw wings
    noStroke();
    fill(batColor);
    triangle (xpos + 40*fangSize, ypos, xpos + 70*fangSize, ypos + 40*fangSize, xpos, ypos + 110*fangSize);
    triangle (xpos + 40*fangSize, ypos + 40*fangSize, xpos + 70*fangSize, ypos + 40*fangSize, xpos + 20*fangSize, ypos + 120*fangSize);
    triangle (xpos + 30*fangSize, ypos + 40*fangSize, xpos + 100*fangSize, ypos + 40*fangSize, xpos + 60*fangSize, ypos + 120*fangSize);
    triangle (xpos + 70*fangSize, ypos + 60*fangSize, xpos + 110*fangSize, ypos + 60*fangSize, xpos + 90*fangSize, ypos + 130*fangSize);
    triangle (xpos + 80*fangSize, ypos + 40*fangSize, xpos + 150*fangSize, ypos + 40*fangSize, xpos + 120*fangSize, ypos + 120*fangSize);
    triangle (xpos + 110*fangSize, ypos + 40*fangSize, xpos + 140*fangSize, ypos + 40*fangSize, xpos + 160*fangSize, ypos + 120*fangSize);
    triangle (xpos + 110*fangSize, ypos + 40*fangSize, xpos + 140*fangSize, ypos, xpos + 180*fangSize, ypos + 110*fangSize);

    // draw the ears
    fill(batColor);
    triangle (xpos + 70*fangSize, ypos, xpos + 80*fangSize, ypos + 40*fangSize, xpos + 60*fangSize, ypos + 40*fangSize);
    triangle (xpos + 110*fangSize, ypos, xpos + 120*fangSize, ypos + 40*fangSize, xpos + 100*fangSize, ypos + 40*fangSize);

    // draw head
    fill(batColor);
    ellipseMode (CORNER);
    ellipse (xpos + 60*fangSize, ypos + 15*fangSize, 60*fangSize, 45*fangSize);

    // draw eyes
    fill (235);
    ellipseMode (CORNER);
    // left eye placement x: 65 - 88, y: 30 - 49
    ellipse (xpos + 65*fangSize, ypos + 30*fangSize, 23*fangSize, 19*fangSize);
    // right eye placement x: 92 - 115, y: 30 - 49
    ellipse (xpos + 92*fangSize, ypos + 30*fangSize, 23*fangSize, 19*fangSize);

    //LOGIC - calculate pupil location based on location of bat
    pupilx = xpos + 70*fangSize + map(width-xpos-90*fangSize, 0, width, 0, 12*fangSize);
    pupily = ypos + 39*fangSize + map(height-ypos-65*fangSize, 0, height, 0, 6*fangSize);

    // draw pupils
    ellipseMode (CENTER);
    fill (0);
    ellipse (pupilx, pupily, 5*fangSize, 5*fangSize);
    ellipse (pupilx + 28*fangSize, pupily, 5*fangSize, 5*fangSize); // add 28 to adjust placement of second eye

    // draw eyebrow
    fill(batColor);
    rectMode (CORNER);
    rect (xpos + 65*fangSize, ypos + 30*fangSize,50*fangSize,6*fangSize);

    // draw fangs
    fill (235);
    triangle (xpos + 76*fangSize, ypos + 60*fangSize, xpos + 85*fangSize, ypos + 60*fangSize, xpos + 79*fangSize, ypos + 68*fangSize);
    triangle (xpos + 85*fangSize, ypos + 60*fangSize, xpos + 90*fangSize, ypos + 60*fangSize, xpos + 87*fangSize, ypos + 63*fangSize);
    triangle (xpos + 90*fangSize, ypos + 60*fangSize, xpos + 95*fangSize, ypos + 60*fangSize, xpos + 93*fangSize, ypos + 63*fangSize);
    triangle (xpos + 96*fangSize, ypos + 60*fangSize, xpos + 105*fangSize, ypos + 60*fangSize, xpos + 101*fangSize, ypos + 73*fangSize);

    // draw legs
    stroke(batColor);
    strokeWeight (2);
    line (xpos + 35*fangSize, ypos - 5*fangSize, xpos + 40*fangSize, ypos);
    line (xpos + 40*fangSize, ypos - 5*fangSize, xpos + 40*fangSize, ypos);
    line (xpos + 45*fangSize, ypos - 5*fangSize, xpos + 40*fangSize, ypos);

    line (xpos + 135*fangSize, ypos - 5*fangSize, xpos + 140*fangSize, ypos);
    line (xpos + 140*fangSize, ypos - 5*fangSize, xpos + 140*fangSize, ypos);
    line (xpos + 145*fangSize, ypos - 5*fangSize, xpos + 140*fangSize, ypos);
  
  }  // close display () function

}  // close fangs class




