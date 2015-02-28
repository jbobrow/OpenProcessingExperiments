
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/29512*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
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
import processing.video.*;
import Blobscanner.*;
//import ddf.minim.*;
//import ddf.minim.signals.*;

/* 
* variables 
*/
//video, etc.
Detector bd;
Capture captureFrame;
PImage frame;
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
PImage img;
PImage kanban;

PImage myimg;
int loc;
int ereserWidth = 100;
int ereserHeight = 100;


/* 
* run once on program start 
*/
void setup(){
  img = loadImage("window.png");
  kanban = loadImage("kanban.png");
  /* video, etc. */
  //create 320x240 window
  size(400, 300);
  //initiate capture frame variable
  captureFrame = new Capture(this, 640, 480, 24);
  //initiate the captured-frame image object
  frame = createImage(width, height, RGB);
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
    myimg = createImage(400, 300, ARGB);
  for(int i=0; i < myimg.pixels.length; i++) {
    myimg.pixels[i] = color(255, 255, 255, 255); 
  }
 
}


/* 
* this section loops 
*/

void reset() {
 
 myimg = createImage(400, 300, ARGB);
  for(int i=0; i < myimg.pixels.length; i++) {
    myimg.pixels[i] = color(255, 255, 255, 255); 
  }
//for(int j=0; j<ereserHeight; j++){
//    for(int i=0; i<ereserWidth; i++){
//      
//      //add pixel ereserWidth/2 and  ereserHeight/2
//      loc = constrain(int(currentMaxLeft.x)-ereserWidth/2+i,0,myimg.width-1) + constrain(int(currentMaxLeft.y)-ereserHeight/2+j,0,myimg.height-1)*img.width;
//      //pixel color
//      myimg.pixels[loc] = color(255, 255, 255, 0);
//    }
//  }
  //
//  for(int i=0){
//   if(alpha.myimg.pixels[i] < 10){
//    counter = counter+1; 
//   }
//  }
//  
//  counter/12000;
//  
//  myimg.updatePixels();
  
// position of image  
//  image(myimg, 0, 0);
//  
//  //right hand
//   for(int j=0; j<ereserHeight; j++){
//    for(int i=0; i<ereserWidth; i++){
      
      //add pixel ereserWidth/2 and  ereserHeight/2
      //loc = constrain(int(currentMaxRight.x)-ereserWidth/2+i,0,myimg.width-1) + constrain(int(currentMaxRight.y)-ereserHeight/2+j,0,myimg.height-1)*img.width;
      //pixel color
      //myimg.pixels[loc] = color(255, 255, 255, 0);
   // }
  //}
  
  
  //myimg.updatePixels();
  
// position of image  
  image(myimg, 0, 0);

  }

void draw(){
 

  
  //do when cam is streaming
  if (captureFrame.available()) {
    
    captureFrame.read();//read a new frame from the camera
    captureFrame.loadPixels();//make referred pixels[] array available
    
    //copy captured frame into a resized frame
    //this fix problem with webcam that can't capture at 320x240
    frame.copy(captureFrame, 0, 0, 640, 480, 0, 0, width, height);
    frame.loadPixels();
    
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
    int startCenterZone = int(width/2);
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
      
      //draw image to window
      image(flippedFrame, 0, 0, width, height);
      
  //transparent blue fill
      noStroke(); //no stroke/border
      //rectangles, count from left
      
      //lefthand
      myimg.loadPixels();
  
  //spread pixel by using for loop
  for(int j=0; j<ereserHeight; j++){
    for(int i=0; i<ereserWidth; i++){
      
      //add pixel ereserWidth/2 and  ereserHeight/2
      loc = constrain(int(currentMaxLeft.x)-ereserWidth/2+i,0,myimg.width-1) + constrain(int(currentMaxLeft.y)-ereserHeight/2+j,0,myimg.height-1)*img.width;
      //pixel color
      myimg.pixels[loc] = color(255, 255, 255, 0);
    }
  }
  //
//  for(int i=0){
//   if(alpha.myimg.pixels[i] < 10){
//    counter = counter+1; 
//   }
//  }
//  
//  counter/12000;
//  
//  myimg.updatePixels();
  
// position of image  
  image(myimg, 0, 0);
  
  //right hand
   for(int j=0; j<ereserHeight; j++){
    for(int i=0; i<ereserWidth; i++){
      
      //add pixel ereserWidth/2 and  ereserHeight/2
      loc = constrain(int(currentMaxRight.x)-ereserWidth/2+i,0,myimg.width-1) + constrain(int(currentMaxRight.y)-ereserHeight/2+j,0,myimg.height-1)*img.width;
      //pixel color
      myimg.pixels[loc] = color(255, 255, 255, 0);
    }
  }
  
  
  myimg.updatePixels();
  
// position of image  
  image(myimg, 0, 0);
    
      
      //draw control-zone level indicators
     
      ellipseMode(CENTER);
      noStroke();
     
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

   
  

 image(img,0,0);
 image(kanban,0,200);
 
 if(mousePressed){
 reset();
 }
 }
 
  //pitch control for Control Rectangle 3
  

  //volume control
 
  
  //display current frequency
  

/* 
Clean up when the program exits 
*/
void stop() {

}

