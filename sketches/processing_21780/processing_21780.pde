
// RESAMPLED Records, visualization for releases.
// RJ Foley IV
// 25 Feb 2011


//// Load all the right parts.

//  Sound feed.
import ddf.minim.*;
import ddf.minim.signals.*;
Minim minim;
AudioPlayer mysound;

//  Video feed.
import processing.video.*;      
Capture myCapture;              


//// Set it up.

void setup() 
{
  size(640, 480, P2D);
  minim = new Minim(this);
  mysound = minim.loadFile("Disambiguation.mp3"); // Disambiguation by Tiago off DFA Records.
  mysound.loop();
  smooth();
  noStroke();
  myCapture = new Capture(this, width, height, 60); // set width, height and frame rate here
}


//// Draw it up.

void draw() {

// Basic commands first.
  smooth();
  noStroke();

// Check to see if capture is available.
  if (myCapture.available()) {
    // If so, read it.
   myCapture.read();
  }
  
// If it is, load the pixel data.
  myCapture.loadPixels();
  int xpos = int(0);       
  int ypos = int(0);     
  int loc = xpos + ypos*myCapture.width; 
  
// Specifically, the r, g, b, (color) data.
  float r = red(myCapture.pixels[loc]);
  float g = green(myCapture.pixels[loc]);
  float b = blue(myCapture.pixels[loc]);

// Now, here's where things get fun, incorporate this newfound RGB pixel data, and put it into whatever gets "filled".
// The mysound command gauges the gain of the audio track which takes control of the alpha(or opacity, or transparency if you prefer).
// This is pretty much the key ingredient to all this.
  fill(r,g,b, mysound.right.level()*100); 

// This fill commmand needs something on the stage for it to be present, so lets do this:
// Make a pattern based on the for command that goes left and right, top to bottom.
// The triangle(); command in there is what will be filled.
  for (int i = 50; i < 700; i += 50) {
     for (int a = 50; a < 600; a += 50) {
       
          triangle(xpos, ypos, xpos, ypos + 50, xpos + 50, ypos); 
          // Shape (or form) that will carry out all the data. It's the star of the show!
          
          if (xpos > width) {
            xpos = 0;
            ypos += 50;
          } else {
           xpos += 50;
          }  // End of the if else argument.
      }  // End of the internal for command.
  }  // End of the for command is here.

}  // End of the draw command is here.


// Wrap it up.

void stop() {
  mysound.close();
  minim.stop();
  super.stop();
}

// That's it, seriously. Enjoy and play around with different lighting!! Have fun!!! 
//Try putting things up in front of your camera that have different colors, I tried using multi-color post-its.

