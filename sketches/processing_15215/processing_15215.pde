
//uses an analog sensor to change the pitch of a sine wave

import ddf.minim.*;        //import minim(audio) library
import ddf.minim.signals.*;

import processing.serial.*; //import serial library

Serial myPort;  // Create object from Serial class
String string;      // Data received from the serial port
String stringTrimmed;
int val;
float valMapped;

Minim minim;          //minim object
AudioOutput output;   //setup to allow output
SineWave sine;        //create sine wave
//SquareWave square;        //create square wave


void setup() {
  size(800,600);

  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);

  minim = new Minim(this);                  //initialise Minim
  output = minim.getLineOut(Minim.MONO);    //setup output - mono
  sine = new SineWave(440,0.8, output.sampleRate());  //initial sine values

  sine.portamento(200);        //portamento for smooth pitch changing
  output.addSignal(sine);      //add sine to output - constantly plays

  // square = new SquareWave(440, 0.8, output.sampleRate());
  //output.addSignal(square);
}

void draw() {

  if ( myPort.available() > 0) {  // If data is available,
    string = myPort.readStringUntil(10); // read it and store it as a string

    if(string!=null) { //if data is not null

        println("String = " + string);
      stringTrimmed = trim(string); //clear whitespace from string
      val = int(stringTrimmed); //convert string to int
      println("int = " + val);
      //map that int to a float, max the width of the screen
      valMapped = map(val, 0, 1023, 50, 1000);
    }
  }


  sine.setFreq(valMapped);

  //square.setFreq(valMapped);
}


