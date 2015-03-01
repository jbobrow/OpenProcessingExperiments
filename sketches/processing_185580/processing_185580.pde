
import org.firmata.*;
import cc.arduino.*;

import processing.serial.*;


Arduino arduino;
int ledPin = 13;
int button1Pin = 2;
float amountofRed;
//int lightLevel;
//int lightPin = 0;
int temperaturePin = 0;
float voltage;
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
   
   voltage=arduino.analogRead(temperaturePin) * 0.004882814;
   amountofRed=map(voltage,.2,.6,255,0);
   println(voltage);
   int button1State;
    button1State = arduino.digitalRead(button1Pin);
  background(amountofRed,0,0);
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
