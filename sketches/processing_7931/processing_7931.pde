
// Chained Circle Lightning

// Variables (on The Wall)

float dstart = 80; // declare a variable to set the diameter origin circle
int numcircles = 50; // declare a variable to set the number of circles in a chain (ie chain length)

// Setup

void setup(){
  size(800,600); // set window size to 800x600 pixels
  background(0); // set background colour to black
  frameRate(20); // set frame rate to 20fps (defult is 10fps)
}

// Draw

void draw(){
  fill(0,20); // set fill as black with a high transparency (low alpha value 0-255) on rectangle below
  rect(0,0,width,height); // draw a rectangle the same size as the window with fill and transparency as above to give a fade effect to the previous draw (draw loops infinitely)

  fill(random(255),random(255),random(255),100); // change fill setting to random colour and mid transparency (alpha 100/255) for circles below 
  noStroke(); // turn off stroke for circles below

  float xstart = mouseX; // declare variable for x coordinate of origin circle centre point and set value to x coordinate of mouse position 
  float ystart = mouseY; // declare variable for y coordinate of origin circle centre point and set value to y coordinate of mouse position 

    for (int j=0; j<3; j++){ // create a for loop to draw multiple (3x) chains of circles

    // origin

    ellipse(xstart,ystart,dstart,dstart); // draw a (origin) circle at mouse position with diameter as set above

    // chain

    float xcurrent = xstart; // declare a variable for x coordinate of the centre point of the circle just drawn to be used below, and set/reset it to initially equal the centre point of the origin circle every loop (after the chain below has finished drawing) so that each of the 3 chains has the same origin
    float ycurrent = ystart; // declare a variable for x coordinate of the centre point of the circle just drawn to be used below, and set/reset it to initially equal the centre point of the origin circle every loop (after the chain below has finished drawing) so that each of the 3 chains has the same origin
    float d = dstart; // declare a variable for diameter to be used below and set/reset to it to initially equal the diameter of the origin circle every loop (after the chain below has finished drawing)
   

    for (int i=0; i<numcircles; i++){ // create a for loop to draw multiple circles a chain (number of circles is set above)
      float dnext = d*0.9; // declare a variable for diameter of the next circle and set it to be 10% smaller than the diameter of the circle just drawn
      float a=random(6.28); // declare a variable for angle of displacement - angle of line between the centre points of the next circle and the circle just drawn (angle is radians 0-2PI)
      ellipse(xcurrent-(cos(a)*d/2)-(cos(a)*dnext/2),ycurrent-(sin(a)*d/2)-(sin(a)*dnext/2),dnext,dnext); // draw the next circle with its boundary touching the boundary of the circle just drawn, and its diamater and angle of displacement set above
      stroke(255); // turn on stroke for line below and set colour to white
      line(xcurrent,ycurrent,xcurrent-(cos(a)*d/2)-(cos(a)*dnext/2),ycurrent-(sin(a)*d/2)-(sin(a)*dnext/2)); // draw a line between the centre points of the circle just drawn and circle drawn immediately prior
      noStroke(); // turn off stroke for next circle in loop

      xcurrent=xcurrent-(cos(a)*d/2)-(cos(a)*dnext/2); // update current x position so that the next circle in loop continues to be displaced such that its boundary touches the boundary of the circle just drawn
      ycurrent=ycurrent-(sin(a)*d/2)-(sin(a)*dnext/2); // update current y position so that the next circle in loop continues to be displaced such that its boundary touches the boundary of the circle just drawn
      d=dnext; // update current diameter so that the diameter for the next circle in loop continues to get smaller

    }

    }

}

void mousePressed(){
  redraw();
}



