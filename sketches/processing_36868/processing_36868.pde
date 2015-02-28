
// Digital Piano
// Written by Charles Cave - September 10th 2011
// Photograph of Kawaii Piano by Katie Cave
// Piano samples of Steinway piano.

import ddf.minim.*;
PianoKey[] pianoKeys = new PianoKey[30];
int ctr; // for storing highest index of pianoKeys index

int previousNote = 0;
PFont myFont = createFont("Arial", 14);
PFont myFont2 = createFont("Arial", 12);

PImage keyboard;

Minim minim;
AudioPlayer song;

class PianoKey {
  int n_x1; // top left corner of bounding rectange of key
  int n_y1;
  int n_x2; // bottom right corner of bounding rectangle of key 
  int n_y2;
  int midiNoteNum;  //  MIDI Note number - used to calculate intervals
  String noteName;   // Name of Note,  eg  C,  F#/G& 
  String soundFile;  // name of file to play when this note played
  char letter;     // used for playing notes from the computer keyboard
  
  PianoKey(int x1, int y1, int x2, int y2, int note, String name, String wavefile, char keyletter) {
        n_x1 = x1;
        n_y1 = y1;
        n_x2 = x2;
        n_y2 = y2;
        midiNoteNum = note;
        noteName = name;
        soundFile = wavefile;
        letter = keyletter;
  }
  
  void drawRect() {
   rect(n_x1, n_y1, n_x2 - n_x1, n_y2 - n_y1); 
  }
  
  void playNote() {
    // black out the note name displayed previously
    fill(0);
    noStroke();
    rect(0, 500, width, 30);
    
    // Draw a semi transparent rectange on the note when played
    fill(250,150, 150,90);
    noStroke();
    drawRect();
    
    // play the sound file (MP3 file in the Data sub directory)
    song = minim.loadFile(soundFile);
    song.play();
    
    // Display the note name below the note pressed
    stroke(255);
    fill(250, 222, 5);
    textFont(myFont);
    text(noteName, n_x1, 520);
    
    // display the interval
    if (previousNote == 0) { 
      previousNote = midiNoteNum;  // first time
      return; 
    }
    int interval = midiNoteNum - previousNote;
    String dispInterval = calcInterval(previousNote, midiNoteNum) + "    " + 
             str(abs(midiNoteNum - previousNote)) + " semitones";
    previousNote = midiNoteNum;
    // black out the note name displayed previously
    fill(0);
    noStroke();
    rect(0, 530, width, 30);
    textFont(myFont2);
    fill(55,160,35);  // green
    text(dispInterval, 280, 550);
  }
  
  boolean inside(int mx, int my) {
    // returns true if the point (mx,my) is inside the bounding rectangle of this object
    if ((mx < n_x1) || (mx > n_x2)) {
      return false;
    }
    if ((my > n_y2) || (my < n_y1)) {
      return false;
    }
    return true;
  }
}

String calcInterval(int prevNote, int thisNote) {
  boolean reversed = false;   // true if second note lower than first note
  int semiTones;
  String intName = "Unknown";
  if (thisNote < prevNote) {
     reversed = true;
     semiTones = prevNote - thisNote; 
  } else {
     semiTones = thisNote - prevNote;
  } 
  println("Semitones " + semiTones);
  if (semiTones == 0) { intName = "Unison"; }
  if (semiTones == 1) { intName = "Minor Second - m2"; }
  if (semiTones == 2) { intName = "Major Second - M2"; }
  if (semiTones == 3) { intName = "Minor Third - m3"; }
  if (semiTones == 4) { intName = "Major  Third - M3"; }
  if (semiTones == 5) { intName = "Perfect Fourth - P4"; }
  if (semiTones == 6) { intName = "Augmented 4th / Diminished 5th - Aug 4/Dim 5"; }
  if (semiTones == 7) { intName = "Perfect Fifth - P5"; }
  if (semiTones == 8) { intName = "Minor Sixth - m6"; }
  if (semiTones == 9) { intName = "Major Sixth - M6"; }
  if (semiTones == 10) { intName = "Minor Seventh - m7"; }
  if (semiTones == 11) { intName = "Major Seventh - M7"; }
  if (semiTones == 12) { intName = "Octave"; }
  if (semiTones == 13) { intName = "Minor 9th"; }
  if (semiTones == 14) { intName = "Major 9th"; }
  if (semiTones == 15) { intName = "Minor 10th"; }
  if (semiTones == 16) { intName = "Major 10th"; }
  if (semiTones == 17) { intName = "Perfect 11th"; }
  if (semiTones == 18) { intName = "Augmented 11th - Diminished 12th"; }
  if (semiTones == 19) { intName = "Perfect 12th"; }
  if (semiTones == 20) { intName = "Minor 13th"; }
  if (semiTones == 21) { intName = "Major 13th"; }
  if (semiTones == 22) { intName = "Minor 14th"; }
  if (semiTones == 23) { intName = "Major 14th"; }
              
  if (reversed) {
     return intName + " (descending)";
  } else {
    return intName;
  }
    
}
void mousePressed() {
   // Following line was used to measure coordinates of piano keys to update setup() function
   // println(mouseX + "," + mouseY);
   for (int i = 0; i <= ctr; i++) {
   if (pianoKeys[i].inside(mouseX, mouseY) ) {
     pianoKeys[i].playNote();
   }
 }
}

void keyPressed() {
   for (int i = 0; i <= ctr; i++) {
   if (pianoKeys[i].letter == key)  {
     pianoKeys[i].playNote();
     image(keyboard, 0, 0); 
   }
 }
}
  
void mouseReleased() {
 image(keyboard, 0, 0); 
}

void draw() {
 // needed to active mouse and key events
}

void setup() {
  keyboard = loadImage("kawaii.jpg");
  size(keyboard.width,keyboard.height + 100);
  background(0);
  image(keyboard, 0, 0); 
  minim = new Minim(this);

 // Octave 3
  pianoKeys[0] = new PianoKey(15, 365, 52, 464, 48, "C", "c48.mp3", 'z');
  pianoKeys[1] = new PianoKey(49, 259, 69, 342, 49, "C# Df", "c#49.mp3", 's');
  pianoKeys[2] = new PianoKey(66, 365, 101, 464, 50, "D", "d50.mp3", 'x');
  pianoKeys[3] = new PianoKey(107, 261, 126, 340, 51, "D# Ef+", "d#51.mp3", 'd');
  pianoKeys[4] = new PianoKey(112, 365, 152, 464, 52, "E", "e52.mp3", 'c');
  pianoKeys[5] = new PianoKey(163, 365, 202, 464, 53, "F", "f53.mp3", 'v');
  pianoKeys[6] = new PianoKey(192, 261, 210, 339, 54, "F# Gf", "f#54.mp3", 'g');  
  pianoKeys[7] = new PianoKey(210, 365, 252, 464, 55, "G", "g55.mp3", 'b');
  pianoKeys[8] = new PianoKey(247, 253, 268, 339, 56, "G# Af", "g#56.mp3", 'h');
  pianoKeys[9] = new PianoKey(262, 365, 302, 464, 57, "A", "a57.mp3", 'n');
  pianoKeys[10] = new PianoKey(303, 265, 323, 339, 58, "A# Bf", "a#58.mp3", 'j');
  pianoKeys[11] = new PianoKey(309, 365, 352, 464, 59, "B", "b59.mp3", 'm');
 
 // Octave 4 - starting at Middle C 
  pianoKeys[12] = new PianoKey(358, 365, 400, 464, 60, "C", "c60.mp3", 'q');
  pianoKeys[13] = new PianoKey(386, 263, 407, 342, 61, "C# Df", "c#61.mp3", '2');
  pianoKeys[14] = new PianoKey(409, 365, 453, 464, 62, "D", "d62.mp3", 'w');
  pianoKeys[15] = new PianoKey(450, 261, 468, 338, 63, "D# Ef+", "d#63.mp3", '3');
  pianoKeys[16] = new PianoKey(460, 369, 501, 463, 64, "E", "e64.mp3", 'e');
  pianoKeys[17] = new PianoKey(507, 366, 552, 465, 65, "F", "f65.mp3", 'r');
  pianoKeys[18] = new PianoKey(531, 242, 554, 339, 66, "F# Gf", "f#66.mp3", '5');
  pianoKeys[19] = new PianoKey(557, 368, 600, 464, 67, "G", "g67.mp3", 't');
  pianoKeys[20] = new PianoKey(589, 251, 613, 341, 68, "G# Af", "g#68.mp3", '6');
  pianoKeys[21] = new PianoKey(606, 368, 651, 463, 69, "A", "a69.mp3", 'y');
  pianoKeys[22] = new PianoKey(645, 247, 671, 340, 70, "A# Bf", "a#70.mp3", '7');
  pianoKeys[23] = new PianoKey(658, 368, 701, 462, 71, "B", "b71.mp3", 'u');
  
  // Octave 5 - rightmost notes in the image
  pianoKeys[24] = new PianoKey(707, 366, 752, 464, 72, "C", "c72.mp3", 'i');
  pianoKeys[25] = new PianoKey(731, 246, 758, 343, 73, "C# Df", "c#73.mp3", '9');
  pianoKeys[26] = new PianoKey(755, 369, 805, 465, 74, "D", "d74.mp3", 'o');
  pianoKeys[27] = new PianoKey(792, 261, 822, 341, 75, "D# Ef+", "d#75.mp3", '0');
  pianoKeys[28] = new PianoKey(803, 366, 859, 464, 76, "E", "e76.mp3", 'p');
  ctr = 28;
  
  frameRate(6);
}


