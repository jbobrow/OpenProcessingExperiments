
// ############################################################## //
//                                                                //                                                                       
// ---------  |\    |        Universidad Industrial de Santander  // 
//     |      | \   |              Ing. Electrónica               //
//     |      |  \  |         Autor: Jesús D. Bonilla Neira       // 
//     |      |   \ |            17 - 08 - 2014 ( 1.0 )           //
// ____|    . |    \|.                leds in Arduino             // 
//                                                                //
// ############################################################## //

import processing.serial.*;

import cc.arduino.*;

Arduino arduino;

color off = color(4, 79, 111);
color on = color(84, 145, 158);

int[] values = { Arduino.LOW, Arduino.LOW, Arduino.LOW, Arduino.LOW,
 Arduino.LOW, Arduino.LOW, Arduino.LOW, Arduino.LOW, Arduino.LOW,
 Arduino.LOW, Arduino.LOW, Arduino.LOW, Arduino.LOW, Arduino.LOW };

void setup() {
  size(470, 200);
  
  // Prints out the available serial ports.
  println(Arduino.list());
  
  // Modify this line, by changing the "0" to the index of the serial
  // port corresponding to your Arduino board (as it appears in the list
  // printed by the line above).
  arduino = new Arduino(this, Arduino.list()[0], 57600);
  
  // Alternatively, use the name of the serial port corresponding to your
  // Arduino (in double-quotes), as in the following line.
  //arduino = new Arduino(this, "/dev/tty.usbmodem621", 57600);
  
  // Set the Arduino digital pins as outputs.
  for (int i = 2; i <= 7; i++)
    arduino.pinMode(i, Arduino.OUTPUT);
}

void draw() {
  background(off);
  stroke(on);
  
  for (int i = 2; i <= 7; i++) {
    if (values[i] == Arduino.HIGH)
      fill(on);
    else
      fill(off);
      
    rect(420 - i * 30, 30, 20, 20);
  }
  

textSize(16);
textAlign(CENTER);
fill (255);
text("CUADROS ", 50, 30);
text("PARA ", 70, 50);
text("LOS ", 80, 70);
text("LEDS ", 95, 100);


}


void mousePressed()
{
  int pin = (450 - mouseX) / 30;
  
  // Toggle the pin corresponding to the clicked square.
  if (values[pin] == Arduino.LOW) {
    arduino.digitalWrite(pin, Arduino.HIGH);
    values[pin] = Arduino.HIGH;
  } else {
    arduino.digitalWrite(pin, Arduino.LOW);
    values[pin] = Arduino.LOW;
  }
}


