
//uses analog sensor to cycle through colours

import processing.serial.*;

Serial myPort;  // Create object from Serial class
String string;      // Data received from the serial port
String stringTrimmed;
int val;
float valMap;

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
    valMap = round(map(val, 0,1023, 0,100));
    
    }
  }
  
  //for loop - 10 iterations
  for(int i = 0; i<valMap; i++){
    
    line(i*(width/valMap),100, i*(width/valMap),500);

  }
 
}





