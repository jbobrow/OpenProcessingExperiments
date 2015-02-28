
import processing.video.*;

Capture capture;

void setup(){
  
  size(320,240);
  //prints out available video devices we can
  println(Capture.list());
  
  //Capture(in this sketch,video width, video height, frame rate)
  capture = new Capture(this, width, height,/*"***",*/ 30);
  
  //if that doesn't work, uncomment and replace "***" with one of the names from the 
  //printed list
  //
  
}

// this function called whenever a new frame is available
//reads the data for the frame
void captureEvent(Capture capture){
  capture.read();
}

void draw(){
  
  //display current frame
  image(capture,0,0);
  
}

