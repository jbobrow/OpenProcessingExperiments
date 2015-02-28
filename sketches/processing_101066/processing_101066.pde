

import processing.serial.*;

Serial comPort;


void setup() {
  comPort = new Serial(this, Serial.list()[4], 9600);
  comPort.bufferUntil('\n');
  background(255);
  size(1270,724);

}

// Buffer a string until a linefeed is encountered then send it to the serial port.
void keyPressed() {
  comPort.write("1");
  }
  




