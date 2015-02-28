
// NUMERICAL MUSICALITY
// by Harry Nuss

// SOME SUGGESTED NUMBERS TO INPUT:
// 98612 31549 87658 48487 32110 01198 765...
// a random set of numbers that makes a nice melody
// OR:
// 27182 81828 45904 52353 60287 47135 26624 97757 24709 36995...
// the first 50 digits of 'e', which also make a nice melody

// Import the SoundCipher library
import arb.soundcipher.*;
import arb.soundcipher.constants.*;

// Initialise the input array. All the note sequences and pitches will be
// based off this array. 
int[] inPut = new int[96];

// Initialise variables needed for drawing
int counter = 0;
int songLength = 0;
float pitch = 0;
int xco = 0;
int yco = 0;
char number = '0';

// Set up the SoundCipher instances for the score and for audio feedback
// while inputting numbers
SCScore score = new SCScore();
SoundCipher sc = new SoundCipher(this);

// Sets up the drawing space
void setup() {
  size(960, 300);
  background(#FAECD1);
  smooth();
  fill(#B7B299);

  // Draws vertical lines which show the placement of notes
  for (int i = 0; i < inPut.length; i++) {
    stroke(#E0DCC5);
    line(i * width/inPut.length, 0, i * width/inPut.length, height);
  }
  // Draws horizontal lines which show the pitch of notes
  for (int i = 10; i > 0; i--) {
    stroke(#9B9680);
    line(0, i*height/11, width, i*height/11);
  }

  // Draws lines which blocks out the specific sections in the song
  strokeWeight(2);
  stroke(#E85454);
  line((2*width/3), height/11, (2*width/3), height - height/11);
  stroke(#5484E8);
  line((width/3), height/11, (width/3), height - height/11);
  stroke(#63BC86);
  line((width/6), height/11, (width/6), height - height/11);

  //Sets up the font used to write numbers underneath the notes
  PFont font;
  font = loadFont("Aharoni-Bold-24.vlw");
  textFont(font);
}

// Empty draw function to keep the sketch alive
void draw() {
}

// Simple input scheme that draws a circle at a corresponding height
// depending on the number pressed (0 - 9). 
// A simple counter keeps track of the number of notes inputted
// and inserts that value into the input array.
// Other commands change the fill colour for easy identification and
// assign a number to be written.
void keyReleased() { 
  if (counter < inPut.length - 1) {
    //1
    if (key == 49) {
      inPut[counter] = 1;
      yco = 10*height/11;
      pitch = 60;
      fill(#C590CB);
      number = '1';
    }
    //2
    else if (key == 50) {
      inPut[counter] = 2;
      yco = 9*height/11;
      pitch = 62;
      fill(#AC90CB);
      number = '2';
    }
    //3
    else if (key == 51) {
      inPut[counter] = 3;
      yco = 8*height/11;
      pitch = 64;
      fill(#9092CB);
      number = '3';
    }
    //4
    else if (key == 52) {
      inPut[counter] = 4;
      yco = 7*height/11;
      pitch = 65;
      fill(#90B5CB);
      number = '4';
    }
    //5
    else if (key == 53) {
      inPut[counter] = 5;
      yco = 6*height/11;
      pitch = 67;
      fill(#90CBC0);
      number = '5';
    }
    //6
    else if (key == 54) {
      inPut[counter] = 6;
      yco = 5*height/11;
      pitch = 69;
      fill(#90CBA2);
      number = '6';
    }
    //7
    else if (key == 55) {
      inPut[counter] = 7;
      yco = 4*height/11;
      pitch = 71;
      fill(#A3CB90);
      number = '7';
    }
    //8
    else if (key == 56) {
      inPut[counter] = 8;
      yco = 3*height/11;
      pitch = 72;
      fill(#C4CB90);
      number = '8';
    }
    //9
    else if (key == 57) {
      inPut[counter] = 9;
      yco = 2*height/11;   
      pitch = 74;
      fill(#CBAF90);
      number = '9';
    }
    //0
    else if (key == 48) {
      inPut[counter] = 0;
      yco = 1*height/11;
      pitch = 76;
      fill(#CB9390);
      number = '0';
    }
    // Updates the xcoordinates by one step and draws a circle at the correct
    // y coordinates. Also writes the number just pressed below the note and
    // and plays the note just chosen.
    xco = (counter * width/inPut.length) + width/inPut.length;
    noStroke();
    ellipse(xco, yco, 10, 10); 
    text(number, xco - ((width/inPut.length)/2), height - (height/40));
    sc.playNote(pitch, 100, 0.5);
  }
  // Add one to the counter every time a key is pressed
  counter += 1;
}

// Clicking the mouse once all notes have been entered plays the song
void mouseClicked() {
  if (counter >= inPut.length - 1) {
    score.stop();
    playSong();
  }
}


