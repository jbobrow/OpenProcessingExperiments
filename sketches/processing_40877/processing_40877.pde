
/*
  Blink
  Turns on an LED on for one second, then off for one second, repeatedly.
 
  This example code is in the public domain.
 */

int ledPin = 7; //35,000
char ledPin = 7; //tis would work
boolean ledPin = 7; //this wouldn't work
float ledPin = 7;//would work
long ledPin = 7; //would   work
byte ledPin = 7; //would wor, ut not ideal

void setup() {                
  // initialize the digital pin as an output.
  // Pin 13 has an LED connected on most Arduino boards:
  pinMode(7, OUTPUT);     
}

void loop() {
  digitalWrite(ledPin, HIGH);   // set the LED on
  delay(200);              // wait for a second
  digitalWrite(ledPin, LOW);    // set the LED off
  delay(200);              // wait for a second
  digitalWrite(ledPin, HIGH);   // set the LED on
  delay(200);              // wait for a second
  digitalWrite(ledPin, LOW);    // set the LED off
  delay(200);              // wait for a second
  
}
