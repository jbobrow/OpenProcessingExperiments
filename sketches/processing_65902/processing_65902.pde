
//special thanks to Andrew R. Brown, who created the SoundCipher MIDI library and accompanying
//tutorials.  This script borrows from tutorial #4: 'unlimited art' 

// import the soundCipher MIDI library
import arb.soundcipher.*;

//create an instance called 'sound1'
SoundCipher sound1 = new SoundCipher(this);

//create an array of the notes to play, 60=C, these notes are a C major pentatonic scale
float[] notes = {
  57, 60, 60, 62, 64, 67, 69, 72, 72, 74, 76
};

//create an array of musical instruments, represented by numbers in MIDI, to select randomly from
// wikipedia has a list of the MIDI instruments here: http://en.wikipedia.org/wiki/General_MIDI
float[] inst = {
  112, 113, 114, 115, 116, 117, 118, 119
};

// by adding the same number to every note in the array, you can change the key
float root = 0;

void setup() {
  size(400, 500);
  frameRate(8);
  colorMode(HSB, 100);
  //randomly selects the first instrument to play from the array
  sound1.instrument(inst[(int)random(inst.length)]);
}

void draw() {
//changes to a new instrument every time the program loops (8 times per second--see framerate above
  sound1.instrument(inst[(int)random(inst.length)]);
  if (random(2) < 1) {
    //plays a random note from the array, the duration and loudness are also random
    sound1.playNote(notes[(int)random(notes.length)/4] + root, random(50, 100), random(2, 8));
  }
}

