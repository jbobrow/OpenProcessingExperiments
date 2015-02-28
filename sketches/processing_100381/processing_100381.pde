
// modified Physical Pixel which is in the public domain
// http://arduino.cc/en/Tutorial/PhysicalPixel

const int redPin = 13; // the pin that the LED is attached to
int incomingByte;      // a variable to read incoming serial data into

void setup() {
  // initialize serial communication:
  Serial.begin(9600);
  // initialize the LED pin as an output:
  pinMode(redPin, OUTPUT);
}

void loop() {
  // see if there's incoming serial data:
  if (Serial.available() > 0) {

    // Processing just did something like:
    // port.write('R');
    // kind of like a digitalWrite in Arduino       
    // see Processing code contained in the 
    // Physical Pixel Arduino code

    // read the oldest byte in the serial buffer:
    incomingByte = Serial.read();
    
    // turn red light on/off based on incoming byte
    if (incomingByte == 'R') {
      // red on
      digitalWrite(redPin, HIGH);
    } 
    // turn off the LED
    if (incomingByte == 'r') {
      digitalWrite(redPin, LOW);
    }
  }
}



