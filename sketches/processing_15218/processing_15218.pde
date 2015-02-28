
import processing.video.*;

import processing.serial.*;

Serial myPort;  // Create object from Serial class
String string;      // Data received from the serial port
String stringTrimmed;
int val;
float valMapped;

Capture capture;

void setup(){
  
  size(320,240);
  
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  
  //prints out available video devices we can
  println(Capture.list());
  
  //Capture(in this sketch,video width, video height, frame rate)
  capture = new Capture(this, width, height,/*"***",*/ 30);
  
  //if that doesn't work, uncomment and replace "***" with one of the names from the 
  //printed list
  

  
}

// this function called whenever a new frame is available
//reads the data for the frame
void captureEvent(Capture capture){
  capture.read();
}

void draw(){
  
  if ( myPort.available() > 0) {  // If data is available,
    string = myPort.readStringUntil(10); // read it and store it as a string
   
    if(string!=null){ //if data is not null
      
    println("String = " + string);
    stringTrimmed = trim(string); //clear whitespace from string
    val = int(stringTrimmed); //convert string to int
    //map that int to a float, max the width of the screen
    println("int = " + val);
    valMapped = map(val, 0, 1023, 0,1);
    }
  }
  
  //display current frame
  image(capture,0,0);
  
  // apply threshold to video
  // set threshold value by arduino reading
  
  filter(THRESHOLD, valMapped);

  
}

