
//uses analog sensor to resize a square

import processing.serial.*;

Serial myPort;  // Create object from Serial class
String string;      // Data received from the serial port
String stringTrimmed; //string to store pure number string
int val;            //number to convert string to
float valMapped;



void setup() 
{
  size(600, 600);
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  
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
    println("int = " + val);
    //map val from original values (0-1023) to 
    //more usable values (0-width)
    valMapped = map(val, 0, 1023, 0, width);
    }
  }
  
  //set background colour each frame
  //resets screen - prevents weird layering
  background(255);  
  //draw rectangle (xPosition, yPosition, width, height)
  rect(width/2,height/2,valMapped, valMapped);
  
 
}





