
/*
Color Clock P1
 Aaron May, September, 2012
 yodazhalo@gmail.com
 
 Inspiration taken from Jack Hughes' "The Colour Clock" 
 viewable at http://www.thecolourclock.uk
 */

/* General setup sets canvas size, turns on anti-aliasing, sets text
 alignment to center, sets font1's type and size, and assigns font1
 as the default for the text.*/
void setup() {
  size(800, 600);
  smooth();
  font1 = createFont("Arial", height/4, true);
  textAlign(CENTER);
  textFont(font1);
}

//Declare variables.
//These are used to capture the current hour, minute, and second
float rHour, gMinute, bSecond; 

//these are used for translation to color values
float rRed1, gGreen1, bBlue1;

//these are used to round the rRed1, etc. values off to a whole number
int rRedFinal, gGreenFinal, bBlueFinal;

//declaring a new color variable, colorTime
color colorTime;

//declaring a new font, font1
PFont font1;

//these are used to create movement in the rectangular frame
int rectChange=15;
int rectMovement=1;

//these are used for the length of the upper (hour) and lower (minute) lines
float hourLength;
float minuteLength;

//Begin the draw function.  Setting the frameRate
void draw() {
  frameRate(24);

  /*Begin work on the background color.
   Assigning time 
   values to rHour, etc. variables.*/
  rHour=hour();
  gMinute=minute();
  bSecond=second();

  /*Converting the units of time into percentages, and then applying 
   those percentages to the 256 values in a color cycle.  Assigning 
   the new value to rRed1, etc. variables*/
  rRed1= ((rHour/24)*255);
  gGreen1= ((gMinute/60)*255);
  bBlue1= ((bSecond/60)*255);

  /*Rounding the rRed1, etc. variable values to whole numbers, 
   then assigning that value to rRedFinal, etc. variables. */
  rRedFinal= round (rRed1);
  gGreenFinal= round (gGreen1);
  bBlueFinal= round (bBlue1);

  /* Assigning the color composed of rRedFinal, gGreenFinal, and 
   bBlueFinal values to the variable colorTime.  Then, getting 
   that color to display in hexadecimal format. */
  colorTime= color(rRedFinal, gGreenFinal, bBlueFinal);
  hex(colorTime, 6);

  /*Finish work on background color 
   Setting colorTime as the background color */
  background(colorTime);

  /*Begin work on the rectangular frame
   Turning off shape fill, setting the stroke color to a slightly opaque
   white, setting the rectangle mode to CENTER. */
  noFill();
  stroke(255, 200);
  rectMode(CENTER);

  /*Draw a rectangle near the outer edge of the canvas whose 
   size changes by rectMovement each cycle.*/
  rectChange+= rectMovement;
  rect(width/2, height/2, width-rectChange, height-rectChange);

  /*Finish work on the rectangular frame
   The rectangle's growth reverses direction after growing 10px from
   its original size.  Reverses again after reaching original size. */
  if (rectChange>25||rectChange<15) {
    rectMovement*=-1;
  }

  /*Begin work on the visual cue lines
   Determine ending x point of the line by determining the hour and 
   minute's percentage of completion, then multiply that by the maximum
   line length and add the minimum line length.  Assign this value to 
   variables hourLength and minuteLength, respectively*/
  hourLength= ((rHour/24)*(width*0.9)+(width*0.05));
  minuteLength= ((gMinute/60)*(width*0.9)+(width*0.05));

  /*End work on the visual cue lines
   Draw horizontal lines near the top and bottom of the screen. Line length
   signifies the fullness of each value (hours or minutes, respectively).
   For example, a half-full bottom line approximates to 30 minutes. */
  line(width*0.05, height*0.05, hourLength, height*0.05);
  line(width*0.05, height*0.95, minuteLength, height*0.95);

  /*Begin work on left mouse displays.
   Create bracketing lines near the center of the screen.  Set fill color 
   to the slightly opaque white.*/
  if (mousePressed&&(mouseButton==LEFT)) {  
    line(width/5, height*0.28, width*0.8, height*0.28);
    line(width/5, height*0.55, width*0.8, height*0.55);
    fill(255, 200);

    /*End work on left mouse displays
     Display the time in the font1 typeface at the center of the screen */
    text(hour()+":"+minute()+":"+second(), width/2, height/2);
  } 

  /*Begin work on right mouse displays.
   Create bracketing lines near the center of the screen.  Set fill color 
   to the slightly opaque white.*/
  else if (mousePressed&&(mouseButton==RIGHT)) {
    line(width/5, height*0.28, width*0.8, height*0.28);
    line(width/5, height*0.55, width*0.8, height*0.55);
    fill(255, 200);


    /*End work on right mouse displays
     Display the background's hexadecimal color code in the font1 
     typeface at the center of the screen */
    text(hex(colorTime, 6), width/2, height/2);
  }

  //Finish the Draw function
}



