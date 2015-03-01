
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/182493*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
// Based on Daniel Shiffman's Example 5-6: Bouncing Ball Example 
// Devin Spear 2/2/2015

import processing.serial.*;

import cc.arduino.*;

Arduino arduino;

int x = 0;
int speed = 1;

void setup() {
  println (Arduino.list());
  arduino = new Arduino (this, Arduino.list () [5], 57600);
  arduino.pinMode (9, Arduino.SERVO);
  size(500,100);
  smooth();
}

void draw() {
  background (0);
  x = x + speed;
  if ((x > width) || (x < 0)) {
    speed = speed * -1;
  }
  noStroke ();
  ellipse (x, 50, 50, 50);
  
  if (keyPressed == true) {
    //hammer raises to 90 degrees
    arduino.servoWrite (9, 102);
    //ellipse changes to green when pressed
    fill (57,181,74);
  }
  else {
    //hammer lowers to 0 degrees
    arduino.servoWrite (9,12);
    //ellipse changes to red when released
    fill (255,0,0);
  }
}    


