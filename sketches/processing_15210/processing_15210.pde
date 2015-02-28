
//uses analog sensor to lengthen two bars, one with the raw
//value, one with the value mapped to the screen width

import processing.serial.*;

Serial myPort;  // Create object from Serial class
String string;      // Data received from the serial port
String stringTrimmed;
int val;
float valMapped;

void setup() 
{
  size(600, 600);
  
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  
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
      valMapped = map(val, 0,1023, 0,width-40); 
   
    }
  
}
  
  
  background(0);
  
  //text - positioned by top left - like rectangle
  text("Actual Value: " + val, 20, height*0.2);
  rect(20, height*0.3, val, 50);
  
  //text - positioned by top left - like rectangle
  text("Mapped Value: " + valMapped, 20, height*0.5);
  rect(20, height*0.6, valMapped, 50);
 
}





