
/**
 * Loop. 
 * 
 * Shows how to load and play a QuickTime movie file.  
 *
 */

import processing.video.*;


Capture cam;
Movie movie;

//thresshold
color white = color(169,252,248);
color black = color(209,76,201);
int numPixels;
Capture video;

//timedisplacement
int signal = 0;
//the buffer for storing video frames
ArrayList frames = new ArrayList();







//KIEZER
int kiezer = 0;
int kiezertwee = 2;

void setup() {

  size(640, 480);
  background(0);
  
  //threshhold
    strokeWeight(5);
  
  // Load and play the video in a loop
  movie = new Movie(this, "transit.mov");
  movie.loop();
  
  String[] cameras = Capture.list();

  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } 
  else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }

   cam = new Capture(this, 640, 480, "FaceTime-HD-camera (ingebouwd)", 30);
    
    // Start capturing the images from the camera
    cam.start();
    
  }
  
  
  //threshhold
   video = new Capture(this, width, height);
  
  // Start capturing the images from the camera
  video.start(); 
  
  numPixels = video.width * video.height;
  noCursor();
  smooth();
  
  
  
  }

void movieEvent(Movie m) {
  m.read();
}

//timedisplacement

void captureEvent(Capture camera) {
  camera.read();
  
  // Copy the current video frame into an image, so it can be stored in the buffer
  PImage img = createImage(width, height, RGB);
  video.loadPixels();
  arrayCopy(video.pixels, img.pixels);
  
  frames.add(img);
  
  // Once there are enough frames, remove the oldest one when adding a new one
  if (frames.size() > height/4) {
    frames.remove(0);
  }
}

  

//VOID DRAW
void draw() {

  if (cam.available() == true) {
    cam.read();
  }
  


//NORMAAL
if (kiezer == 0){
  //CAMERA
  set(0, 0, cam);
}


//THRESHHOLD
else if (kiezer ==1){

    video.read();
    video.loadPixels();
    int threshold = 127; // Set the threshold value
    float pixelBrightness; // Declare variable to store a pixel's color
    // Turn each pixel in the video frame black or white depending on its brightness
    loadPixels();
    for (int i = 0; i < numPixels; i++) {
      pixelBrightness = brightness(video.pixels[i]);
      if (pixelBrightness > threshold) { // If the pixel is brighter than the
        pixels[i] = white; // threshold value, make it white
      } 
      else { // Otherwise,
        pixels[i] = black; // make it black
      }
    }
    updatePixels();
    // Test a location to see where it is contained. Fetch the pixel at the test
    // location (the cursor), and compute its brightness
    int testValue = get(mouseX, mouseY);
    float testBrightness = brightness(testValue);
    if (testBrightness > threshold) { // If the test location is brighter than
      fill(black); // the threshold set the fill to black
    } 

   
  }
  
  //Time displacement
else if (kiezer == 2){
   // Set the image counter to 0
 int currentImage = 0;
 
 loadPixels();
  
  // Begin a loop for displaying pixel rows of 4 pixels height
  for (int y = 0; y < video.height; y+=4) {
    // Go through the frame buffer and pick an image, starting with the oldest one
    if (currentImage < frames.size()) {
      PImage img = (PImage)frames.get(currentImage);
      
      if (img != null) {
        img.loadPixels();
        
        // Put 4 rows of pixels on the screen
        for (int x = 0; x < video.width; x++) {
          pixels[x + y * width] = img.pixels[x + y * video.width];
          pixels[x + (y + 1) * width] = img.pixels[x + (y + 1) * video.width];
          pixels[x + (y + 2) * width] = img.pixels[x + (y + 2) * video.width];
          pixels[x + (y + 3) * width] = img.pixels[x + (y + 3) * video.width];
        }  
      }
      
      // Increase the image counter
      currentImage++;
       
    } else {
      break;
    }
  }
  
  updatePixels();
  
  // For recording an image sequence
  //saveFrame("frame-####.jpg"); +
  
}



 
 //FILMPJE
 
 if (kiezertwee==1){
 
blendMode(ADD);
  

  image(movie, 0, 0, width, height);
  

  blendMode(NORMAL);
  
 }
  
  if(kiezertwee==2){
    
  image(movie, 0, 0, width, height);
  }



}


void keyPressed(){
  

if(keyCode==UP){


 kiezer = kiezer+1; 
 if(kiezer ==3){kiezer=0;}

}
else if(keyCode==DOWN){

 kiezer =kiezer-1;}
 if(kiezer==-1){kiezer=2;}



if(keyCode==RIGHT){
kiezertwee=kiezertwee+1;
if(kiezertwee==3){
  kiezertwee = 0;

}
}



if(keyCode==LEFT){
kiezertwee=kiezertwee-1;
if(kiezertwee==-1){
  kiezertwee = 2;

}


}


}

