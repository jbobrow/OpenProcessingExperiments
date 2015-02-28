
///////////////////////////////////////////////////////////////////////////////
////////////////////////////// PAS - TASK 1 ///////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
/* ATTRACTOR POINT SKETCH
 This processing sketch will vary the size
 and vertical position of a grid of 2D shapes
 (see the processing reference for ideas
 for shapes to draw) based on their proximity 
 to the mouse. 
 
 I have added extra functionality and effects:
 firstly, I have changed the ellipses to boxes,
 secondly, I have changed the background to white and the boxes to colour,
 thirdly, I have made the box colour automatically rotate colours,
 fourthly, I have made the boxes more transparent the closer they are to the cursor,
 fifthly, I have made the boxes increase and decrease in size to create a pulsing motion,
 sixthly, I have included left-click functionality to stop and start the pulse,
 and lastly, I have included right-click functionality to adjust the colour saturation.
 by Viet*/

///////////////////////////////////////////////////////////////////////////////////
////////////////////////////// GLOBAL VARIABLES ///////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////
  /* I define some colours here, so I can simply use their name rather
     than their RGB values later on. I end up not using lightblue or light red*/
color white = color(255);                  
color lightblue = color(23, 162, 234);
color lightred = color(240, 40, 150);

  /* These colourRotaters are used by the colourRotate effect and are needed 
     to keep track of the Red, Green, and Blue values of the boxes. They have 
     these starting values, so that the boxes start off bluish*/
int colourRotaterBLUE = 255;
int colourRotaterRED = 200;
int colourRotaterGREEN = 100;

  /* These variables are specified by Gwyll's psuedocode. diameterx is the 
     basic diameter of the box, before any additions. I note that
     shapetransparency is not even used in his psuedocode, nor within this
     applet*/
int shapetransparency = 80;                
int maxDistance = 250;
float diameterx;

  /* These variables are used as a clock. They update each frame. Count is the
     global counter and will never stop, while diametercount is specially used
     by the pulse effect and will stop and start.*/
int count = 0;
int diametercount = 0;

  /* I define the window dimensions here.*/
int windowX = 900;
int windowY = 450;

  /* - colourSwitch is used by the colourRotater effect; when it is off (0), the 
     blue value increases. When it is on (1), the blue value decreases. The 
     switch is triggered when the Blue value hits 255 or 0 respectively.
     - diameterpulseswitch is used by the pulse effect in a similar fashion; when
     it is off (1), the box diameter increases. When it is on (-1), the box
     diameter decreases. The switch is triggered at a set time interval defined by
     diameterpulsespeed, which can be changed.
     - diametermouseswitch is used by the pulse effect also; when it is off (1), the
     diametercount clock is allowed to tick away, and the boxes can pulse. When it 
     is on (-1), the diametercount clock is stopped, and the boxes stop pulsing.*/
int colourSwitch = 0;
int diameterpulseswitch = 1;
int diametermouseswitch = 1;

  /* diameterpulse is used by the pulse effect and is the extra size that is added to 
     the box diameter. It increases and decreases in value, and respectively increases
     and decreases the box diameter, creating the pulse effect.*/
int diameterpulse = 0;

  /* diameterpulsespeed is used by the pulse effect and sets the frequency of the pulse*/
int diameterpulsespeed = 40;

  /* This scalar is just used to adjust the diameter of the boxes, since they were too 
     big at first. Changing this value creates interesting effects.*/
float scalar = .5;

////////////////////////////////////////////////////////////////////////////
////////////////////////////// SETUP ///////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
  /* Commands in here only occur once, at the beginning.*/
void setup() { 
  //size(windowX, windowY, P3D);             //window size and engine
  size(900, 450, P3D);                       //enable this one to export; processing can't read variable window dimensions
  frameRate(60);                             //make the framerate constant
}

////////////////////////////////////////////////////////////////////////////
////////////////////////////// DRAW LOOP ///////////////////////////////////
////////////////////////////////////////////////////////////////////////////
  /* The bulk of the code goes here. Commands in here are processed every frame*/
void draw() {
  background(white);                          //background colour
  //smooth();                                 //antialias - turned off, as it required far too much power and slowed the app down.
  //noFill();                                 //prevent shape fill - specified in psuedocode, but turned off because I colour my boxes.
  //stroke(white);                            //set stroke colour - specified in psuedocode, but turned off because I don't use strokes.
  strokeWeight(0);                            //set stroke weight to 0 - I don't use stroke.
  
  //// COLOURROTATER EFFECT --------------------------------------------------------//
    /* The boxes rotate colours by increasing the Blue value. When the blue value   //
       hits the max (255), the colourSwitch is turned on, and then the blue value   //
       decreases. When it hits 0, the switch is turned off again and the blue goes  //
       up once more. The rate at which blue increases is determined by the count    //
       clock - count is divided by 2, and if the result is a whole number, the      //
       blue value will update (count % 2 == 0)*/                                    //
  if(count % 2 == 0 && colourRotaterBLUE < 255 && colourSwitch == 0) {              //
    colourRotaterBLUE = colourRotaterBLUE + 11;                                     //
  } else if(count % 2 == 0 && colourRotaterBLUE >= 255 && colourSwitch == 0) {      //
    colourRotaterBLUE = colourRotaterBLUE - 11;                                     //
    colourSwitch = 1;                                                               //
  } else if(count % 2 == 0 && colourRotaterBLUE > 0 && colourSwitch == 1) {         //
    colourRotaterBLUE = colourRotaterBLUE - 11;                                     //
  } else if(count % 2 == 0 && colourRotaterBLUE <= 0 && colourSwitch == 1) {        //
    colourRotaterBLUE = colourRotaterBLUE + 11;                                     //
    colourSwitch = 0;                                                               //
  }                                                                                 //
  //// -----------------------------------------------------------------------------//
  
  //// BOX PULSE EFFECT ------------------------------------------------------------//
    /* The box pulse effect is simple; a variable diameterpulse that increases and  // 
       decreases in value is added to the box diameter. The if statement checks to  //
       to see if the box should be increasing or decreasing (diameterpulseswitch),  //
       and whether it should be increasing or decreasing at all (diametermouse      //
       -switch). diametermouseswitch is set to on or off by the click of a mouse,   //
       the code of which is at the end. The frequency of pulse, aka how long it is  //
       before diameterpulse changes to decreasing from increasing, or vice-versa, is//
       determined by diameterpulsespeed, and its own clock, diametercount. The      //
       diametercount clock can stop and start with the click of a mouse*/           //
  if (diameterpulseswitch == 1 && diametermouseswitch == 1) {                       //
    diameterpulse = diameterpulse + 1;                                              //
    diametercount++;                                                                // 
  }                                                                                 //
  if (diameterpulseswitch == -1 && diametermouseswitch == 1) {                      //
    diameterpulse = diameterpulse - 1;                                              //
    diametercount++;                                                                //  
  }                                                                                 //
  if (diametercount % diameterpulsespeed == 0) {                                    //
    diameterpulseswitch = -1*diameterpulseswitch;                                   //
  }                                                                                 //
  //// -----------------------------------------------------------------------------//
  
    /* Here the basic code is written. The grid is created with the nested for loops,
       the basic box diameter is set to be smallest closest to the cursor and largest
       furthest from the cursor*/
  for (int gridY = 0; gridY < windowY; gridY = gridY + 25) {    // The columns of the grid
    for (int gridX = 0; gridX < windowX; gridX = gridX + 25) {  // The rows of the grid
     PVector mousePos = new PVector(mouseX, mouseY, 0);         // The position of the cursor is mousePos
     PVector shapePos = new PVector(gridX, gridY, 0);           // The position of the box is shapePos
     float pdist = PVector.dist(mousePos, shapePos);            /* pdist is the variable, defined as the distance 
                                                                   between the box's position and the cursor. I used
                                                                   just normal dist() which didn't work, but Fira 
                                                                   showed me to use PVector.dist() which worked.*/
     
     diameterx = pdist/maxDistance*40 + diameterpulse;          /* The code that specifies that the closer the box
                                                                   is to the cursor, the small its diameter. diameterpulse
                                                                   is also added here, creating the pulse effect*/
     diameterx = diameterx*scalar;                              /* I found the boxes too big at first, so I decreased it
                                                                   with a scalar.*/
     
     
     pushMatrix();                                              // The 3d stuff happens here. I don't 100% understand this.
     translate(gridX, gridY, diameterx*5);                      /* The boxes are pushed further closer to the screen the 
                                                                   larger its diameter. */
     fill(colourRotaterRED, colourRotaterGREEN, colourRotaterBLUE, pdist);  /* The boxes are coloured with this line. Of course
                                                                               the colour changes according to the colourRotater 
                                                                               effect. The boxes are also made more transparent
                                                                               the closer they are to the cursor.*/
     box(diameterx, diameterx, diameterx);                      // The actual box is drawn! This idea was courtesy Fira.
     popMatrix();                                               // Important 3D stuff.
    }
  }
 
  //// CLOCK -----------------------------------------------------------------------//
    /* The count clock is updated here. Also, additional code is included to display//
       the clock in the bottom right corner. It is made to deliberately bleed off   //
       the screen.*/                                                                //
  count++;                   // <<<<<<<< The clock is update each frame             //
  fill(255);                                                                        //
  textMode(SCREEN);                                                                 //
  textAlign(RIGHT, BOTTOM);                                                         //
  textSize(250);                                                                    //  
  text(count, windowX+50, windowY+100);                                             //
  //// -----------------------------------------------------------------------------//

}



////////////////////////////////////////////////////////////////////////////
////////////////////////////// MOUSE RELEASE ///////////////////////////////
////////////////////////////////////////////////////////////////////////////
void mouseReleased() {
    /* This is for the colourRotater effect. It adjusts the box colour slightly.
       If the right mouse button is released, it will check to see if the Red
       and Green values are lower than 200; if so, then they will be incremented
       by 25, if not, then they will be reset to 28. */
  if (mouseButton == RIGHT && colourRotaterRED < 200) {
    colourRotaterRED = colourRotaterRED + 25;
  } else if (mouseButton == RIGHT && colourRotaterRED >= 200) {
    colourRotaterRED = 28;
  } 
  if (mouseButton == RIGHT && colourRotaterGREEN < 200) {
    colourRotaterGREEN = colourRotaterGREEN + 25;
  } else if (mouseButton == RIGHT && colourRotaterGREEN >= 200) {
    colourRotaterGREEN = 28;
  } 

    /* This is to start and stop the box pulse. Upon releasing the left mouse
       button, the switch is turned on or off.*/
  if (mouseButton == LEFT) {
    diametermouseswitch = diametermouseswitch*-1;
  }
}

// By Viet Hoang, with help from Fira and Yin, for the Melbourne University
// Performative Architecture Studio in the Master of Architecture, 2011.
////////////////////////////////////////////////////////////////////////////
////////////////////////////// THE END /////////////////////////////////////
////////////////////////////////////////////////////////////////////////////

