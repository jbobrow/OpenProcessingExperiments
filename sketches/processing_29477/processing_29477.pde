
/*
*  >>>"Webcam Theremin"<<<
*  - Simulation of world's 1st electronic musical instrument: Theremin
*  - Made up of 2 parts
*
*  By Ronald Chua
*
*  [Part 01: "Simple Fingers Tracker"]
*  - General motion tracker, but configured only to detect agile motion (like fingers)
*  - Note: There's an ideal distance to camera depending on background/environment
*  
*  Object tracker with the following processing sequence:
*  (1)-> Capture image 
*  (2)-> Frame differencing
*  (3)-> Thresholding frame difference to binary image
*  (4)-> Erode binary image to remove background motions
*  (5)-> Dilate binary image to enhance blob scanning
*  (6)-> Blob scanning
*  
*  For the purpose of theremin simulation this part returns 2 integer values:
*  - Per-frame one highest Y-axis value of all detected blobs from LEFT-half of image
*  - Per-frame one highest Y-axis value of all detected blobs from RIGHT-half of image
*
*  [Part 02: "Sound Synthesizer"]
*  - Receives per-frame LEFT and RIGHT side highest Y-axis value from Part 01
*  - Produces sound of a range of frequency (pitch) and amplitude (volume)
*  - Pitch control: RIGHT Y-axis value 
*  - Volume control: LEft Y-axis value
*
*/

/* 
* required libraries 
*/
import codeanticode.gsvideo.*;
import Blobscanner.*;
import ddf.minim.*;
import ddf.minim.signals.*;

/* 
* variables 
*/
//video, etc.
Detector bd;
GSCapture frame;
PImage flippedFrame;
PImage binaryFrame;
PImage controlZone;
int totalPixels;
int movementSum;
int minimumMovementSum;
int minimumBlobWeight;
int thresholdValue;
float currentControlVolumeOutput;
float currentControlPitchOutput;
float previousControlVolumeOutput;
float previousControlPitchOutput;
int[] previousFramePix;
int[] differenceFramePix;
PVector currentMaxLeft;
PVector currentMaxRight;
PVector previousMaxLeft;
PVector previousMaxRight;
PFont frequencyFont;
//sound
Minim minim;
AudioOutput soundOutput;
SineWave soundSineWave;
float frequency;
float amplitude;


/* 
* run once on program start 
*/
void setup(){
  /* video, etc. */
  //create 320x240 window
  size(320, 240, P2D);
  //initiate capture frame variable
  frame = new GSCapture(this, width, height, 24);
  frame.play(); //so code can run in Processing windows
  //initiate the flipped-frame image object
  flippedFrame = createImage(frame.width, frame.height, RGB);
  //initiate the binary-frame image object
  binaryFrame = createImage(frame.width, frame.height, RGB);
  //initiate the control-zone frame image object
  controlZone = createImage(frame.width, frame.height, RGB);
  //initiate blob detector object
  bd = new Detector(this, 0, 0, frame.width, frame.height, 255);
  //calculate total pixels in a frame
  totalPixels = frame.width * frame.height;
  //calculate minimum movement sum threshold percentage
  minimumMovementSum = 0;//int(0.01*totalPixels*255); //set to 0 to detect even smallest movement
  //set minimum blob weight that is to be highlighted
  minimumBlobWeight = 100; //set to 0 to draw all blobs
  //set thresholding border value
  thresholdValue = int(255 * 0.05); //5% single color max value
  //initiate array to store preceding frame pixels array
  previousFramePix = new int[totalPixels];
  //initiate array to store differed frame pixels array
  differenceFramePix = new int[totalPixels];
  //initiate storage vector to store max-Y coordinates
  currentMaxLeft = new PVector(0, 0);
  currentMaxRight = new PVector(0, 0);
  previousMaxLeft = new PVector(0, 0);
  previousMaxRight = new PVector(0, 0);
  //frequency text font
  frequencyFont = loadFont("Monospaced.plain-20.vlw");
  /* sound */
  //initiate the sound control object
  minim = new Minim(this);
  // get a line out from Minim, default bufferSize is 1024, default sample rate is 44100, bit depth is 16
  soundOutput = minim.getLineOut(Minim.STEREO);
  // create a sine wave Oscillator, set to 440 Hz, at 0.5 amplitude, sample rate from line out
  soundSineWave = new SineWave(440, 0.5, soundOutput.sampleRate());
  // set the portamento speed on the oscillator to 200 milliseconds
  soundSineWave.portamento(100);
  // add the oscillator to the line out
  soundOutput.addSignal(soundSineWave);
  // initiate sound variables
  frequency = 0.0;
  amplitude = 0.0;
}


/* 
* this section loops 
*/
void draw(){
  
  //do when cam is streaming
  if (frame.available()) {
    frame.read();//read a new frame from the camera
    frame.loadPixels();//make referred pixels[] array available
    
    /* center Y-axis mirror algorithm */
    //flip the acquired frame on Y-axis
    flippedFrame.loadPixels();
    //begin loop for rows
    for (int y = 0; y < frame.height; y++) {
      //calculate per-row reverse column target array index
      int k = (frame.width + y*frame.width)-1;
      //begin loop for columns
      for (int x = y*frame.width; x < frame.width*(y+1); x++) {
        flippedFrame.pixels[k] = frame.pixels[x];
        k--;        
      }
    }
    
    //display the flipped cam capture
    flippedFrame.updatePixels();
    //image(flippedFrame, 0, 0, frame.width, frame.height);
  
    /* frame differencing algorithm adapted from Golan Levin & Andres Colubri */
    movementSum = 0; //reset movement sum to 0 per frame
    for (int i = 0; i < totalPixels; i++) {
      //store current color
      color currentColor = flippedFrame.pixels[i];
      //load previous color from preceding frame pixels array
      color previousColor = previousFramePix[i];
      //extract RGB from current pixel color value
      int currentR = (currentColor >> 16) & 0xFF;
      int currentG = (currentColor >> 8) & 0xFF;
      int currentB = currentColor & 0xFF;
      //extract RGB from previous pixel
      int previousR = (previousColor >> 16) & 0xFF;
      int previousG = (previousColor >> 8) & 0xFF;
      int previousB = previousColor & 0xFF;
      //calculate pixel RGB difference in absolute value
      int differenceR = abs(currentR - previousR);
      int differenceG = abs(currentG - previousG);
      int differenceB = abs(currentB - previousB);
      //store total difference calculate thus far
      movementSum += (differenceR + differenceG + differenceB)/3;
      //store current pixel as previous pixel
      previousFramePix[i] = flippedFrame.pixels[i];
      //store the differenced frame pix into its own array
      differenceFramePix[i] = color(differenceR, differenceG, differenceB);
    }//end for (frame differencing algorithm)
    /**/
    
    /* thresholding algorithm */
    //convert the differenced frame pix values to black/white
    binaryFrame.loadPixels(); //make available pixels[] array
    for (int i = 0; i < totalPixels; i++) {
      color pixColor = differenceFramePix[i];
      int pixR = (pixColor >> 16) & 0xFF;
      int pixG = (pixColor >> 8) & 0xFF;
      int pixB = pixColor & 0xFF;
      int pixAverage = (pixR + pixG + pixB)/3;
      if (pixAverage > thresholdValue) {
        binaryFrame.pixels[i] = color(255, 255, 255); //white
      } 
      else {
        binaryFrame.pixels[i] = color(0, 0, 0); //black
      }
    }//end for
    /**/
    
    /* for theremin simulation purpose */
    
    //split thresholded frame into LEFT and RIGHT active zone
    //remove all center motion detected
    int startCenterZone = int(width/8);
    int endCenterZone = int(width-(2*width/8 + 30));
    controlZone.loadPixels();
    for (int i = 0; i < totalPixels; i++) {  
      if (i == startCenterZone || i%width == startCenterZone) {
        i += endCenterZone-startCenterZone;
      }//end if
      else {
        controlZone.pixels[i] = binaryFrame.pixels[i];
      }
    }
    
    /**/
    
    //erode the control-zone frame x2 
    //to remove noise from little movements
    controlZone.filter(ERODE);
    controlZone.filter(ERODE);
    controlZone.filter(ERODE);
    
    //dilate the above eroded frame image x2
    //to enable better blob detection
    controlZone.filter(DILATE);
    controlZone.filter(DILATE);
    controlZone.filter(DILATE);
    
    //blur for even more refined blob detectio
    controlZone.filter(BLUR);
    
    //do blob scans only for frame meeting threshold requirement
    if (movementSum > minimumMovementSum) {
      
      //using black/white differenced control-zone frame
      bd.findBlobs(controlZone.pixels, frame.width, frame.height);
      //load blob features found
      bd.loadBlobsFeatures();
 
      /* for theremin simulation purpose */
      
       //calculate top-edge mid-point for each blob bounding box
      PVector[] midAB = new PVector[bd.getBlobsNumber()]; //initiate size to total number of blobs detected
      for (int i = 0; i < bd.getBlobsNumber(); i++) {
        //0 top(a-b), 1 down(c-d) ,2 left(a-c) and 3 right(b-d) side mid point,
        // use the boolean if you want the point to be drawn
        midAB[i] =bd.getCrossPoints(i,0,false); 
      }//end for: calculate top-edge bounding box mid-point
      
      //reset these values at every frame
      //remember in computing, Y-axis value is REVERSED!!
      int currentLeftMinY = height;
      int currentRightMinY = height;
      
      //find lowest Y-axis value for both LEFT and RIGHT control zone
      //remember in computing, Y-axis value is REVERSED!!
      for (int i = 0; i < bd.getBlobsNumber(); i++) {
        
        //get highest LEFT-zone Y value, skip dead zones
        if (midAB[i].x < startCenterZone) { //if it is within left zone
          if (midAB[i].y >= 10 && midAB[i].y <= 210) { //if it is within top-bottom boundary
            if (midAB[i].y < currentLeftMinY) { //if it is smaller than current value
              currentLeftMinY = int(midAB[i].y);  //set it to be the biggest value this far
              currentMaxLeft = midAB[i]; //LEFT indicator draw coordinate
            }//end if
            else {
              currentLeftMinY = currentLeftMinY;
              currentMaxLeft = currentMaxLeft;
            }//end else
          }//end if
        }//end if
        
        //get highest RIGHT-zone Y value, skip dead zones
        if (midAB[i].x > endCenterZone) { //if it is within right zone
          if (midAB[i].y >= 10 && midAB[i].y <= 210) { //if it is within top-bottom boundary
            if (midAB[i].y < currentRightMinY) { //if it is bigger than current value
              currentRightMinY = int(midAB[i].y); //set it to be the biggest falue this far
              currentMaxRight = midAB[i]; //RIGHT indicator draw coordinate
            }//end if
            else {
              currentRightMinY = currentRightMinY;
              currentMaxRight = currentMaxRight;
            }//end else
          }//end if 
        }//end if
          
      }//end for: find highest Y-axis
      
      //draw image on display window
      image(flippedFrame, 0, 0, frame.width, frame.height);
      
      //draw overlay control zones area highlight
      rectMode(CORNER);
      fill(255, 255, 255, 100); //transparent blue fill
      noStroke(); //no stroke/border
      //rectangles, count from left
      rect(0, 0, width/8, height); //rectangle 1 (volume)
      rect(int(width-(2*width/8)-30), 0, width/8, height); //rectangle 2 (pitch)
      rect(width-width/8, 0, width/8, height); //rectangle 3 (pitch) 
      fill(0, 0, 0);
      rect(0, 0, width, 10); //top dead zone (mute)
      rect(0, height-30, width, height-30); //bottom dead zone (mute)
      
      //draw control-zone level indicators
      rectMode(CENTER);
      ellipseMode(CENTER);
      noStroke();
      fill(255, 0, 0); //color: pitch level indicator
      rect(currentMaxLeft.x, currentMaxLeft.y, 30, 2);
      ellipse(currentMaxLeft.x, currentMaxLeft.y, 7, 7);
      fill(0, 0, 255); //color: volume level indicator
      rect(currentMaxRight.x, currentMaxRight.y, 30, 2);
      ellipse(currentMaxRight.x, currentMaxRight.y, 7, 7);
      
      /* pass following values to sound generator */
      //control-zones output, set to maintain previous value (auto-sustain)
      if (currentLeftMinY == height) {
        currentControlVolumeOutput = previousControlVolumeOutput;
        currentMaxLeft = previousMaxLeft;
      } else {
        currentControlVolumeOutput = height-currentMaxLeft.y-30;
        previousControlVolumeOutput = currentControlVolumeOutput;
        previousMaxLeft = currentMaxLeft;
      }//end if-else
      if (currentRightMinY == height) {
        currentControlPitchOutput = previousControlPitchOutput;
        currentMaxRight = previousMaxRight;
      } else {
        currentControlPitchOutput = height-currentMaxRight.y-30;
        previousControlPitchOutput = currentControlPitchOutput;
        previousMaxRight = currentMaxRight;
      }//end if-else
      
    }//end if (movementSum)
    
  }// end if(frame.available)
  
  /* 
  * Sound synthesis 
  */
  
  // with portamento "on" the frequency will change smoothly
  //picth control for Control Rectangle 2
  if (currentMaxRight.x >= width-(2*width/8)-30 && currentMaxRight.x <= width-width/8-30) {
    frequency = map(currentControlPitchOutput, 0, height-30, 130, 510);
    soundSineWave.setFreq(frequency);
  }
  //pitch control for Control Rectangle 3
  if (currentMaxRight.x >= width-width/8) {
    frequency = map(currentControlPitchOutput, 0, height-30, 2030, 510);
    soundSineWave.setFreq(frequency);
  } 

  //volume control
  amplitude = map(currentControlVolumeOutput, 0, height-30, 0, 1);
  soundSineWave.setAmp(amplitude);
  
  //display current frequency
  textFont(frequencyFont);
  fill(0, 255, 0);
  textAlign(RIGHT);
  text(frequency, width/2, height-9);
  textAlign(LEFT);
  text("      Hz", width/2, height-9);
  
}//end draw()

/* 
Clean up when the program exits 
*/
void stop() {
  soundOutput.close();
  minim.stop();
  super.stop();
}

