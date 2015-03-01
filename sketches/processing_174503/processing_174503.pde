




//Import 'Minim' libraty files
import ddf.minim.*;

//Declare global variables
Minim minim;
AudioSample sound;

//Load audio file from HDD
void setup ()  {
  minim = new Minim(this);
  sound = minim.loadSample("chacha.wav");
}

//Draw code block (anything goes)
void draw () {
  background (0);
}

//Create a key trigger
void keyPressed () {
 if ( key == 'b' ) sound.trigger(); 
 if ( key == 'b' ) println("sample trigger");
}

