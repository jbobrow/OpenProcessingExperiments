
/*
title:ozgun_eylul_iscen_project_1
 description:a representation of time passing by
 created:September,2012
 by:Ozgun Eylul Iscen
 email:oiscen@sfu.ca
 */

//This project is based on one of the signifiant aspect (futural dimension) of Deleuzian understanding of time that values difference in repetition, actualization/emergence of new, multiplicity and openness. 
//In stead of focusing on a representation of time, I focus on its 'passing by' where a lot unfoldings and actualizations take place in Deleuzian terms
//and I create a dynamic net in constant process of territorialization and deterritorialization - but not a concrete structure - (from the scratch by every minute) full of possibilities/openness for the viewer. 
//Even though they are all calculated (including the conditions of randomness and user interactivity) and so they are not able to reach to the complexity of life, the novelty of future and the density of time, 
//I tried to increase the possibility of different ways of emergences and connections as much as possible by integrating various use of randomness, interactivity, conditional statements and time functions.


//declare global variables
int points =60; //create a variable of integer type and initialize it 60 - # of circles (since there will be 60 points (0-59) in total as one point emerges every second in the loop)
float [] xSpeed =new float [points]; //declare an array of float for the speed values of x and y and initialize them with 60 which is assigned as the # of circles (so the array length is set to 60)
float [] ySpeed =new float [points]; 
float []x=new float [points]; //declare an array of float for the values of x and y coordinates of the each circle and initialize them with 60
float []y=new float [points]; 
float [][] pointdist = new float[60][60];  //declare a bi-dimensional array of float for the values of distances between two different circles
int pSec;  //declare a variable of integer for the value of previous second
int col=255; // declare a variable of integer and initialize it with 255 for the value of color (white)
int h=hour()%12; // declare a variable of integer and assign it the value of the current hour (out of 12 by using modulo fucntion)
int m=minute(); //declare a variable of integer and assign it the value of the current minute 

void setup () { // set up initial 
  size (500, 500); //set the size of the sketch window
  background (255); //and background
  frameRate (60); //set the framerate (60 frames per second)

  for (int i=0; i<points; i++) { //create a for loop and initialize i (index for the position in the array) with 0
    // for i is smaller than 60 (# of circles), with each cycle i will be incremented by 1 between 0 and 59
    x[i]=(int) random (500); // assign random values to x and y coordinates within the whole sketch (500,500) for the each value indexed in the array from 0 to 59 
    y[i]=(int) random (500); 
    xSpeed[i] = random(-5, 5); // assign random values between -1 and 1 to xspeed and yspeed for the each index of the array from 0 to 59
    ySpeed[i] = random(-5, 5);
  }
  calcDists();  //call the calsDists function
} //end set up 

void draw ()  //set up what will be executed each draw cycle call
{ 
  background (col); //update the background colour to white (as col is initialized with 255 above)
  int sec = (millis()/1000)%60; //use millisecond that is counting since the beginning of the program and convert its value into seconds by using division
  // and make sure it always starts from zero using modulo 60.

  //the number of points displayed at a time equals the number of seconds elapsed in a minute.
  for (int i=0; i<sec; i++) {  //create a for loop and initialize i (index for the position in the array) with 0
    // for i is smaller than 60 (# of circles), with each cycle i will be incremented by 1 between 0 and 59
    fill (0);  //fill the ellipse black
    x[i]+= xSpeed [i]; //modify the speed of the point in x and y directions 
    y[i]+= ySpeed [i];
    ellipse (x[i], y[i], h+5, h+5);  //render an ellipse at coordinates x,y with radius determined by the current hour (out of 12) 

    //bounce from the left and right walls 
    if (x [i]>=width-h/2 || x[i]<=h/2) { //if the coordinate of the ellipse center is at the 
      //left edge or at the right edge of the window
      xSpeed[i] = xSpeed[i]*-1; //inverse the horizontal speed of the ellipse
    } //end if

    //bounce from the top and the bottom of the window
    if ( y[i]>=height-h/2 || y[i]<=h/2) {  //if the coordinate of the ellipse center is at the
      //top edge or at the bottom edge of the window
      ySpeed[i] = ySpeed[i]*-1; ////inverse the vertical speed of the ellipse
    } //end if 

    //construct an if statement for the mouse interaction 
    if (mousePressed) {  // if mouse is pressed 
      xSpeed[i] = random(-2, 2);  //change the speed value of x (accessed from the array xSpeed) randomly between values -2 and 2
      ySpeed[i] = random(-2, 2); //change the speed value of y (accessed from the array ySpeed) randomly between values -2 and 2
    } // end if 

    calcDists(); //call the calcDists() function

    // create another for loop (nested with the first for loop above)
    for (int j=i; j<sec; j++) { // for every point currently displayed check if it is close to another point (as j is the index for another point (second dimension of the array pointDists))
      if (i != j) //discard the fact that a point is close to itself
      {
        if  (pointdist[i][j]<100) { //if the distance between 2 points is less than 100 pixels
          line (x[i], y[i], x[j], y[j]); // draw a line between them
        } 
        if  (pointdist[i][j]<20) { //if the distance between 2 points is less than 20 pixels,
          fill(255, 0, 0, 100); // fill the ellipse with red and decrease its transparency by lowering its value on alpha channel
          ellipse((x[i] + x[j])/2, (y[i] + y[j])/2, m/2, m/2); //render an ellipse in the middle of two points with the radius that is assigned the half of the current minute (by using the midpoint formula [(x_1 + x_2)/2 , (y_1 + y_2)/2])
        } //end if
      } //end the second for loop
    } //end the first for loop
  } //end draw 

  //construct an if statement in order to make the background colour darker by every minute (60 seconds) until it gets too dark
  if (pSec != sec && sec == 0) //do not update col more than once within a second and only update it every 60 seconds.
  {
    col = col - 30 ; //to decrease the value of color by 30 and so make the background darker on a greyscale by every minute/60 seconds
  }
  if (col <= 105) // if the value of color (the level on the greyscale) is lower than (255-150) - after 5 minutes as it is lowered by 30 per minute
  {
    col = 255; //reassign it the value of 255  - so it will become white again
  }
  pSec = sec; //assign the varible pSec the value of current second
}

//calculate the distances of each point with every other point and write them in a 2-d array called pointdist.
void calcDists() //create a new method type of void indetified as calcDists
{
  for (int i=0; i<60; i++) { //create the outer loop of a nested loop and reinitialize i with 0 
    // for i is smaller than 60, with each cycle loop i will be incremented by 1
    for (int j=i; j<60; j++) { //create the inner loop and initialize j with 0
      // for j is smaller than 60, with each cycle of loop j will be incremented by 1
      pointdist[i][j] = dist (x[i], y[i], x[j], y[j]); //create a 2-d array to hold the calculated values of distances between two different points (use distance function)
    } //end the inner for loop
  } //end the outer for loop
} // end calcDists



