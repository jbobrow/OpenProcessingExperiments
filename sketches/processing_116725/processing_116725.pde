
//Importing video library for processing
import processing.video.*;

//Declaring a variable of type Capture
Capture source;

//Setup
void setup(){
  size(400,400);
  
  //Initializing the source variable
  source = new Capture(this,640,480);
  
  //Calling the method start to start capturing the camera feed
  source.start();
}

//Unless captureEvent() method is called and the Capture object is read, 
//the video will not be visible
void captureEvent(Capture video){
  video.read();
}

//Draw method
void draw(){
    // Loop to spray 20 dots on each draw()
    for (int i = 0; i < 100; i++) {
      // added two random variables to get only two unique values for all the 20 dots
      int r1 = int(random(width));
      int r2 = int(random(height));
      int size = int(random(10));
      noStroke();
      
      // getting color value from random mouse locations 
      color c = source.get(r1,r2);
      fill(c);
      
      // drawing ellipses at the same location from where we got the color values
      ellipse(r1+size,r2+size,size, size);
    }
}


