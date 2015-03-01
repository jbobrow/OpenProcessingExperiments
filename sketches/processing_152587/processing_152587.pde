
//Jeremy Bader
//Midterm Project
//Interactive 3D Keyboard Model
//Used http://www.openprocessing.org/sketch/9732 as a starting point

//To play the first octave, press Q W E R with your left fingers and T Y U I with your right fingers
//To play the sharps in the first octave, press 2 3 with your left fingers and 5 6 7 with your right fingers
//To play the second octave, press Z X C V with your left fingers and B N M , with your right fingers
//To play the sharps in the second octave, press S D with your left fingers and G H J with your right fingers
//You can press multiple keys at the same time to create chords

import ddf.minim.*;
import ddf.minim.signals.*;
 
Minim minim;
AudioOutput out;
SineWave sine;
SineWave nullSine;
Wave wave = new Wave(sine);
 
int keysPressed = 0;
float MAXAMP = .5; 
float amp  = MAXAMP;
  
float[] tones = { //Here are the tones of C4-C6 (4th octave C to 6th octave C) in hertz
  261.63, 277.18, 293.66, 311.13, 329.63, 349.23, 369.99, 392.00, 415.30, 440.00, 466.16, 493.88, 523.25,
  523.25, 554.37, 587.33, 622.25, 659.26, 698.46, 739.99, 783.99, 830.61, 880.00, 932.33, 987.77, 1046.50};
 
char keys[] = { //Here are the correlating keys on a computer keyboard
  'q','2','w','3','e','r','5','t','6','y','7','u','i','z','s','x','d','c','v','g','b','h','n','j','m',','};
 
String notes[] = { //The note names

  "C","C#"," D","D#"," E","     F","    F#","     G","    G#","     A","    A#","     B","        C","    C",
  "    C#","     D","    D#","     E","         F", "        F#","         G","        G#","         A","        A#",
  "         B","            C"};
 
boolean keyStates[];

int whiteKeys[] = {0, 2, 4, 5, 7, 9, 11, 12, 13, 15, 17, 18, 20, 22, 24, 25};
int blackKeys[] = {1, 3, 6, 8, 10, 14, 16, 19, 21, 23};

void setup()
{
  size(800, 500, P3D);
  colorMode(HSB);
  smooth();
 
  keyStates = new boolean[keys.length];
  minim = new Minim(this);
 
  out = minim.getLineOut(Minim.STEREO);
  nullSine= new SineWave(0, 0, out.sampleRate());
  sine = new SineWave(0, amp, out.sampleRate());
  sine.portamento(40);
}
 
void draw() 
{  
  background(#0007B4);
  stroke(0);
  
  drawKeyboard();
  
  wave.drawWaves();
  
  Song song = new Song(keys, keyStates, whiteKeys, blackKeys);

  song.showPlayedKeys();
  song.showNotes();
}

void drawKeyboard() //Draws the keyboard white and black keys
{
  pushMatrix(); //White keys
  strokeWeight(2);
  stroke(0);
  translate(75, height/2, 0);
  rotateX(-PI/6);
  for (int i = 0; i < 15; i++)
  {
    translate(40, 0, 0);
    fill(255);
    box(40, 40, 160);
  }
  popMatrix();
  
  pushMatrix(); //Black keys
  translate(95, height/2 - 30, 0);
  rotateX(-PI/6);
  for (int j = 0; j < 10; j++)
  {
    if ((j==2) || (j==5) || (j==7)){
      translate(40, 0, 0);
    }
    translate(40, 0, 0);
    fill(0);
    box(20, 20, 100);
  }
  popMatrix();
}

void keyPressed() //Determines which keys on the keyboard have been pressed
{
  keysPressed=0;
  out.clearSignals();
  for(int i=0;i<keys.length;i++)
  {
    if(key == keys[i])
    {
      keyStates[i] = true;
    }
    if(keyStates[i])
    {
      keysPressed++;
    }
  }
 
  if(keysPressed == 0)
  {
    amp = MAXAMP;
  }
  else
  {
    amp=MAXAMP/keysPressed;
  }
 
  wave.addWaves();
}
 
void keyReleased() //Determines which keys on the keyboard have been release
{
  keysPressed = 0;
  out.clearSignals();
  for(int i=0;i<keys.length;i++)
  {
    if(key == keys[i])
    {
      keyStates[i] = false;
    }
    if(keyStates[i])
    {
      keysPressed++;
    }
  }
  wave.addWaves();
}

