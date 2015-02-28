
import processing.opengl.*;
import glitchP5.*; // import GlitchP5
import JMyron.*;

JMyron theMov;
int[][] globArray;
int timeCount;
GlitchP5 glitchP5; // declare an instance of GlitchP5. only one is needed
int[] posx = {
  10, 50, 100, 150, 200, 250, 300, 350, 400, 450, 500, 550, 600
};
int[] posy = {
  10, 50, 100, 150, 200, 250, 300, 350, 400
};
int[] sizes = {
  10, 20, 40
};

void setup()
{
  size(1200, 860, OPENGL);
  glitchP5 = new GlitchP5(this); // initiate the glitchP5 instance;

  theMov = new JMyron();
  theMov.start(width, height);
  theMov.findGlobs(1);
  theMov.trackColor(255, 150, 150, 255);
}


void draw()
{
  pushMatrix();
  scale(-1.0, 1.0);
  theMov.update();
  int[] currFrame = theMov.image();
  popMatrix();

  // draw each pixel to the screen
  loadPixels();
  for (int i = 0; i < width*height; i++) {
    colorMode(HSB, 10);
    currFrame[i] = color( hue(currFrame[i]), 15, 10);

    pixels[i] = currFrame[i];
  }

  updatePixels();

  // draw the glob bounding boxes
  globArray = theMov.globBoxes();
  for (int i = 0; i < globArray.length; i++) {
    int[] boxArray = globArray[i];

    // set the fill colour to the average of all colours in the bounding box
    int currColor = theMov.average(
    boxArray[0], 
    boxArray[1], 
    boxArray[0] + boxArray[2], 
    boxArray[1] + boxArray[3]);
    fill(red(currColor), green(currColor), blue(currColor));

    rect(boxArray[0], boxArray[1], boxArray[2], boxArray[3]);
    glitchP5.glitch(boxArray[0], boxArray[1], 0, 0, boxArray[2], boxArray[3], 2, 1.0f, 20, 30);

    fill(200, 100);
    text("framerate: "+frameRate, 10, height-10);

/*    if (timeCount < 100) {
      //glitch();
    } 
    else { 
      timeCount = 0;
    } */
  }


  glitchP5.run(); // this needs to be at the end of draw(). anything after it will not be drawn to the screen
}


/*
void glitch()
{
  // trigger a glitch: glitchP5.glitch(	posX, 			// 
  //                             	posY, 			// position on screen(int)
  //					posJitterX, 		// 
  //					posJitterY, 		// max. position offset(int)
  //					sizeX, 			// 
  //					sizeY, 			// size (int)
  //					numberOfGlitches, 	// number of individual glitches (int)
  //					randomness, 		// this is a jitter for size (float)
  //					attack, 		// max time (in frames) until indiv. glitch appears (int)
  //					sustain			// max time until it dies off after appearing (int)
  //				      );
  glitchP5.glitch(10 + posx[int(random(0, 12))], 10 + posy[int(random(0, 9))], 2, 2, sizes[int(random(0, 2))], sizes[int(random(0, 2))], 10, 2.5f, 50, 1);
}
*/

public void stop() {
  theMov.stop();
  super.stop();
}


