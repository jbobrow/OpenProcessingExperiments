
// written @ bauhaus weimar by Lisa Naumann and Tobi Ziegler 
// sketch uses the distance from the serial port
// and connects the distance to the  volume of a looped soundfile
// here we defined something like a corridor 
// used with a parralax ping))) sensor on arduino duemilanove
// Based on the sketches of luckylarry.co.uk 
// and the example sketch from Ess


import processing.serial.*;   
import krister.Ess.*;

Serial myPort;
AudioChannel myChannel;


void setup() {
  
  Ess.start(this);                              // start up Ess

  myChannel=new AudioChannel("F13.mp3");        // load "F13.mp3" into a new AudioChannel

  myChannel.play(Ess.FOREVER);                  // start the sound looping forever
  
  myChannel.volume(0);
 
  println(Serial.list());                      // List serial ports, saves us trying to figure out which COM we're using.
  myPort = new Serial(this, Serial.list()[0], 9600);    // Open the active port - providing you've only got one sending serial data (which you should)
  myPort.bufferUntil('\n');                    // don’t read the serial buffer until we see a new line - this is genius and simple compared with my last efforts
}


void draw() {
}


void serialEvent (Serial myPort) {
  String bufferString = myPort.readStringUntil('\n');    // get the string from the serial buffer - gets all chars until the next line break...
 
  if (bufferString != null) {                  
    bufferString = trim(bufferString);         // get rid of any whitespace - sometimes the serial buffer can have blanks etc.. in the string
    float inByte = float(bufferString);        // convert the value to an int - we're only sending numbers over the serial port so parsing it to an int shouldn't ever be an issue.
    float pulse = float(bufferString);         // declare a variable to hold our value.

      if (pulse >= 60 && pulse < 100){
      float newVolume=(pulse-60)/40;                            // set the pulse-value to a volume value
      if (!myChannel.fading) myChannel.fadeTo(newVolume,500, Ess.FAST);
      println ("Close: " + newVolume);
 
      }
      
      else if (pulse >= 100 && pulse <= 140) {
      float newVolume=(pulse-140)/(-40);                           // set the pulse-value to a volume value
      if (!myChannel.fading) myChannel.fadeTo(newVolume,500, Ess.FAST);
      println ("Back: " + newVolume);
      }
     
      else if (pulse < 60 || pulse > 140) {                   // Silence in the ranges not defined (prevents clipping or loud sounds)
      float newVolume=0;                                      // set the pulse-value to zero
      if (!myChannel.fading) myChannel.fadeTo(newVolume,2000, Ess.FAST);
      println ("Silence:" + newVolume);
      }
  }                                                           // end if there's a value in the serial bufferstring
}

public void stop() {                                          // clean up Ess before exiting
  Ess.stop();
  super.stop();
}

