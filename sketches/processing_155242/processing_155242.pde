
//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies

/*
This doesn't use any trigonometry (no sin, cos or tan stuff, and no PI), 
but has a very similar affect.
 It uses a value I've called 'time' to keep things moving round. Have a play with it. 
*/

/* Adapted by Adriana Rodarte
    includes GifAnimation library http://extrapixel.github.io/gif-animation/ 
    Libraries non supported in openprocessing.org
    press any key for exporting sketch as GIF Animation
*/

//import gifAnimation.*;
//GifMaker gifExport;

float increaseTime = 0.008; 
float time = 0; /* This is going to function as a clock. We'll update it with a value every time a frame gets drawn*/
static int   FRAME_RATE = 20;
 
void setup() {
size(400,400);/* setup the size */
frameRate(FRAME_RATE);/* This sets the current frameRate */

  //gifExport = new GifMaker(this, "export.gif");
  
  // make it a looping animation
  //gifExport.setRepeat(0); 
  //gifExport.setTransparent(255, 255, 255); 
}
 
void draw() {/* this does the drawing once per frame */
  background(0); /* clear the screen with black*/
  translate(width/2,height/2); /* translate all the drawing to the middle of the screen */
  noFill(); /*stop the computer filling in shapes*/
  time=time+increaseTime; /* update the value in the variable 'time'. 
  This means that we add 1 to 'time' every frame */
  for (int i = 0;i < 20; i++) { /* this for loop organises the drawing. It will do the drawing 20 times (between 0 and 19)  */
  rotate(time); /* rotate the coordinate system a bit */
 
  stroke(0,0,i*12); /* Stroke color: Blue value starts at 0 up to 19*12 =228 */
  /* Stroke color starts at 0,0,0 Black Ends at 0,0,228*/
  strokeWeight(1+i); 
  rect(i,i,i*5,i*5); /* this is the actual drawing.
  This says 'Draw a line, starting from i,i (x and y location), and being of size i*5 in both width and depth
  because it's in a for loop, it gets 'called' (used) 20 times, with a different value for 'i' each time */

  }
  //gifExport.setDelay(1000/FRAME_RATE);
  //gifExport.addFrame();
}
/*
void keyPressed() {
  gifExport.finish();
  println("gif exported");
}
*/

