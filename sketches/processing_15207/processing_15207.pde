
//uses an analog sensor to rotate a square

import processing.serial.*;


Serial myPort;  // Create object from Serial class
String string;      // Data received from the serial port
String stringTrimmed;
int val;

void setup() 
{
  size(600, 600);
  
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  
  //necessary for rotate function
  //similar to moving (0,0) or top left corner to center of sketch
  translate(width/2,height/2);
  //pushMatrix saves this 'translation' to be returned to later
  pushMatrix();

 //means the rectangle is drawn in relation to and 
 //positioned by its center point
 rectMode(CENTER);
}

void draw()
{


  if ( myPort.available() > 0) {  // If data is available,
  
    string = myPort.readStringUntil(10); // read it and store it as a string
  
    if(string!=null){ //if data is not null
      
      println("String = " + string);
      stringTrimmed = trim(string); //clear whitespace from string
      val = int(stringTrimmed); //convert string to int
      //map that int to a float, max the width of the screen
      println("int = " + val);
      
   
    }
  
}
  
  //refreshes background each frame to clear previous frame
  background(255);

  //returns us to previous translation
  popMatrix();
  //re-saves translation so we can continue to use it
  pushMatrix();
  //rotate viewpoint, defaults around (0,0)
  //but we have used translate and then popMatrix()
  //to ensure that it happens around the center
  rotate(radians(val));
  //draw rectangle (0,0) is now mapped to center through translate
  //so it is drawn in the center of the window
  rect(0,0,300,300);
  
 
}





