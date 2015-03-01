
import org.firmata.*;
import cc.arduino.*;

import processing.serial.*;


Arduino arduino;
int ledPin = 13;
int button1Pin = 2;
//int lightLevel;
//int lightPin = 0;
boolean on=true;
void setup()
{
  size(600,600);
  //println(Arduino.list());
  arduino = new Arduino(this, Arduino.list()[2], 57600);
  arduino.pinMode(ledPin, Arduino.OUTPUT);
  arduino.pinMode(button1Pin, Arduino.INPUT);
}

void draw()
{
  // lightLevel = arduino.analogRead(lightPin);  
   
   
   int button1State;
    button1State = arduino.digitalRead(button1Pin);
  background(255,0,0);
  if (button1State == Arduino.LOW){
    on=true;
  }
  else {
    on=false;
  };
  
  if (on){
  arduino.digitalWrite(ledPin, Arduino.HIGH);
  line(0,0,width,height);
  }
  else {
    arduino.digitalWrite(ledPin, Arduino.LOW);
  }
  delay(200);
 
  
}
