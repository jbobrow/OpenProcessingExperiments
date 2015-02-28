
import processing.serial.*;
int var;

Serial serialPort;  // Create object from Serial class

void setup() 
{
  println(Serial.list());
  serialPort = new Serial(this, Serial.list()[0], 9600);
}

void draw() {
   while (serialPort.available () > 0) {
    //set the variable height equal to the data coming in.
    int var = serialPort.read(); 
    println(var); 
   }
}

