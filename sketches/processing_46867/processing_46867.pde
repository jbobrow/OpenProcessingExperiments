

import ddf.minim.*;

// Declare audio
Minim minim;

// Audioplayer named player
AudioSample[] player = new AudioSample[5];

void setup() {
  size(800, 800); //changed the size of the sketch

  // Create a new player object for audio playback
  minim = new Minim (this);
  
  player[0] = minim.loadSample ("1.mp3");
  player[1] = minim.loadSample ("2.mp3");
  player[2] = minim.loadSample ("3.mp3");
  player[3] = minim.loadSample ("4.mp3");
  player[4] = minim.loadSample ("5.mp3");
}

void draw() {

  background(255, 255, 255);


}

// Add actions to keyboard input
void keyPressed() {



  if ( key == '1' ) player[0].trigger (); 
  else if ( key == '2' ) player[1].trigger (); 
  else if ( key == '3' ) player[2].trigger (); 
  else if ( key == '4' ) player[3].trigger (); 
  else if ( key == '5' ) player[4].trigger ();
}

void stop(){

  minim.stop();
  
 super.stop(); 
}


