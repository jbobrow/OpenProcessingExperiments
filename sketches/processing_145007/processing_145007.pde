
/*This code creates a spiral in the center of the screen once the user presses a button. However,
every time a new button is pressed, a tone is played and the color of the spiral changes. The user can
experiment with different rhythms to create different colored spirals.
References:
Getting Started with Processing: Example 7-15: Spirals
Minim library example: TriggerASample
Link to controlP5 library: http://www.sojamo.de/libraries/controlP5/
Sounds taken from freesound.org from user menegass and from GarageBand
*/

import controlP5.*; //here I am importing the library for the slider that I am using
import ddf.minim.*; //here I am importing the minim library for playing sound files

ControlP5 cp5;
Minim minim;
//the two statements above call the libraries that I just imported
//The following lines of code create audio samples that I can trigger later in the program
//The samples include a snare and notes from the 0 to 5 octaves.
AudioSample snare;
AudioSample A0sharp;
AudioSample A0;
AudioSample A1sharp;
AudioSample A1;
AudioSample B0;
AudioSample B1;
AudioSample C0sharp;
AudioSample C0;
AudioSample C1sharp;
AudioSample C1;
AudioSample D0sharp;
AudioSample D0;
AudioSample D1sharp;
AudioSample E1;
AudioSample F0;
AudioSample F0sharp;
AudioSample F1sharp;
AudioSample F1;
AudioSample G0sharp;
AudioSample G0;
AudioSample G1sharp;
AudioSample G1;
AudioSample A2;
AudioSample B2;
AudioSample C2;
AudioSample D2;
AudioSample E2;
AudioSample F2;
AudioSample G2;
AudioSample A3;
AudioSample B3;
AudioSample C3;
AudioSample D3;
AudioSample E3;
AudioSample F3;
AudioSample G3;
AudioSample A4;
AudioSample B4;
AudioSample C4;
AudioSample D4;
AudioSample E4;
AudioSample F4;
AudioSample G4;
AudioSample A5;
AudioSample B5;
AudioSample C5;
AudioSample D5;
AudioSample E5;
AudioSample F5;
AudioSample G5;

//Below I am setting up variables for the spiral program--this section I borrowed from the spiral
//example code that I found in the packets that we were given in class
float angle = 0.0;
float scalar = 1;
float speed = 0.1;

//Creates a starting variable for the slider
int octave = 0;

//Simple setup that sets the size of the window and the color of the background
void setup() {
  size(800, 800);
  background(100);
  fill(0);
  smooth();
  
//Sets up a slider that I can use
  cp5 = new ControlP5(this);
  
//I modified this part of the code from the example code in the control P5 library dealing with sliders
//This creates a slider controlling the octave, but the slider is not seen because it will not be necessary to move it
  cp5.addSlider("octave")
    .setPosition(-100, -100)
      .setRange(0, 5)
        .setSize(100, 20)
          .setNumberOfTickMarks(6)
            ;

//The following lines of code load the audio files from a folder and creates them as audio samples
//to play in the program. I modified this part off of the TriggerASample example code.
  minim = new Minim(this);
  snare = minim.loadSample( "SD.wav", 512);
  A0sharp = minim.loadSample( "A0sharp.wav", 512);
  A0 = minim.loadSample( "A0.wav", 512);
  A1sharp = minim.loadSample( "A1sharp.wav", 512);
  A1 = minim.loadSample( "A1.wav", 512);
  B0 = minim.loadSample( "B0.wav", 512);
  B1 = minim.loadSample( "B1.wav", 512);
  C0sharp = minim.loadSample( "C0sharp.wav", 512);
  C0 = minim.loadSample( "C0.wav", 512);
  C1sharp = minim.loadSample( "C1sharp.wav", 512);
  C1 = minim.loadSample( "C1.wav", 512);
  D0sharp = minim.loadSample( "D0sharp.wav", 512);
  D0 = minim.loadSample( "D0.wav", 512);
  D1sharp = minim.loadSample( "D1sharp.wav", 512);
  E1 = minim.loadSample( "E1.wav", 512);
  F0 = minim.loadSample( "F0.wav", 512);
  F0sharp = minim.loadSample( "F0sharp.wav", 512);
  F1sharp = minim.loadSample( "F1sharp.wav", 512);
  F1 = minim.loadSample( "F1.wav", 512);
  G0sharp = minim.loadSample( "G0sharp.wav", 512);
  G0 = minim.loadSample( "G0.wav", 512);
  G1sharp = minim.loadSample( "G1sharp.wav", 512);
  G1 = minim.loadSample( "G1.wav", 512);
  A2 = minim.loadSample( "A2.wav", 512);
  A3 = minim.loadSample( "A3.wav", 512);
  A4 = minim.loadSample( "A4.wav", 512);
  A5 = minim.loadSample( "A5.wav", 512);
  B2 = minim.loadSample( "B2.wav", 512);
  B3 = minim.loadSample( "B3.wav", 512);
  B4 = minim.loadSample( "B4.wav", 512);
  C2 = minim.loadSample( "C2.wav", 512);
  C3 = minim.loadSample( "C3.wav", 512);
  C5 = minim.loadSample( "C5.wav", 512);
  D2 = minim.loadSample( "D2.wav", 512);
  D3 = minim.loadSample( "D3.wav", 512);
  D4 = minim.loadSample( "D4.wav", 512);
  D5 = minim.loadSample( "D5.wav", 512);
  E2 = minim.loadSample( "E2.wav", 512);
  E3 = minim.loadSample( "E3.wav", 512);
  E4 = minim.loadSample( "E4.wav", 512);
  E5 = minim.loadSample( "E5.wav", 512);
  F2 = minim.loadSample( "F2.wav", 512);
  F3 = minim.loadSample( "F3.wav", 512);
  F4 = minim.loadSample( "F4.wav", 512);
  F5 = minim.loadSample( "F5.wav", 512);
  G2 = minim.loadSample( "G2.wav", 512);
  G3 = minim.loadSample( "G3.wav", 512);
  G4 = minim.loadSample( "G4.wav", 512);
  G5 = minim.loadSample( "G5.wav", 512);
  B5 = minim.loadSample( "B5.mp3", 512);
  C4 = minim.loadSample( "C4.mp3", 512);
}


void draw() {
  if (millis() < 20000) { //this statement causes the whole program to only run for 20 seconds
    //All of the spirals I call in the following code begin in the same position: in the center
    //However, they are of different color depending on what note will be played
    if (key == 'a' ) spiral(10, 200, 10, 400, 400);
    if (key == 's' ) spiral(10, 10, 200, 400, 400);
    if (key == 'd' ) spiral(50, 100, 50, 400, 400);
    if (key == 'f' ) spiral(50, 250, 50, 400, 400);
    if (key == 'g' ) spiral(40, 200, 80, 400, 400);
    if (key == 'h' ) spiral(30, 90, 150, 400, 400);
    if (key == 'j' ) spiral(255, 140, 0, 400, 400);
    if (key == 'k' ) spiral(0, 206, 209, 400, 400);
    if (key == 'l' ) spiral(255, 0, 255, 400, 400);
    if (key == 'u' ) spiral(0, 255, 0, 400, 400);
    if (key == 'i' ) spiral(255, 255, 0, 400, 400);
    if (key == 'e' ) spiral(244, 164, 96, 400, 400);
  }
  
  //The following lines of code that deal with millis set times for the octave and the 
  //speed of the spiral to change. The change in the speed of the spiral lets the user
  //know when the octave has changed.
  if(millis() < 4000) {
    octave = 0;
    speed = 0.15;
  }
  if(millis() < 8000 && millis() > 4000) {
    octave = 1;
    speed = 0.2;
  }
  if(millis() < 12000 && millis() > 8000) {
    octave = 2;
    speed = 0.25;
  }
  if(millis() < 16000 && millis() > 12000) {
    octave = 3;
    speed = 0.3;
  }
  if(millis() < 18000 && millis() > 16000) {
    octave = 4;
    speed = 0.35;
  }
  if(millis() > 18000 && millis() < 20000) {
    octave = 5;
    speed = 0.4;
  }
  if (keyPressed == true)
  {
    if (key == 'p')
    {
      saveFrame("newDesign.jpeg"); //This allows the user to save the art that they have created
    }
  }
}
//The keyPressed function that I have created here triggers the different audio files depending
//on the octave that the slider is set to.
void keyPressed() {
  if (octave == 0) {
    if (key == 'a' ) C0.trigger(); 
    if (key == 's' ) C0sharp.trigger();
    if (key == 'd' ) D0.trigger();
    if (key == 'f' ) D0sharp.trigger();
    if (key == 'g' ) F0.trigger();
    if (key == 'h' ) F0sharp.trigger();
    if (key == 'j' ) G0.trigger();
    if (key == 'k' ) G0sharp.trigger();
    if (key == 'l' ) A0.trigger();
    if (key == 'u' ) A0sharp.trigger();
    if (key == 'i' ) B0.trigger();
    if (key == 'e' ) snare.trigger();
  }
  if (octave == 1) {
    if (key == 'a' ) C1.trigger();
    if (key == 's' ) C1sharp.trigger();
    if (key == 'd' ) D1sharp.trigger();
    if (key == 'f' ) F1.trigger();
    if (key == 'g' ) F1sharp.trigger();
    if (key == 'h' ) G1.trigger();
    if (key == 'j' ) G1sharp.trigger();
    if (key == 'k' ) A1.trigger();
    if (key == 'l' ) A1sharp.trigger();
    if (key == 'u' ) B1.trigger();
    if (key == 'e' ) snare.trigger();
  }
  if (octave == 2) { 
    if (key == 'a' ) C2.trigger();
    if (key == 's' ) D2.trigger();
    if (key == 'd' ) E2.trigger();
    if (key == 'f' ) F2.trigger();
    if (key == 'j' ) G2.trigger();
    if (key == 'k' ) A2.trigger();
    if (key == 'l' ) B2.trigger();
    if (key == 'e' ) snare.trigger();
  }
  if (octave == 3) {
    if (key == 'a' ) C3.trigger();
    if (key == 's' ) D3.trigger();
    if (key == 'd' ) E3.trigger();
    if (key == 'f' ) F3.trigger();
    if (key == 'j' ) G3.trigger();
    if (key == 'k' ) A3.trigger();
    if (key == 'l' ) B3.trigger();
    if (key == 'e' ) snare.trigger();
  }
  if (octave == 4) {
    if (key == 'a' ) C4.trigger();
    if (key == 's' ) D4.trigger();
    if (key == 'd' ) E4.trigger();
    if (key == 'f' ) F4.trigger();
    if (key == 'j' ) G4.trigger();
    if (key == 'k' ) A4.trigger();
    if (key == 'l' ) B4.trigger();
    if (key == 'e' ) snare.trigger();
  }
  if (octave == 5) {
    if (key == 'a' ) C5.trigger();
    if (key == 's' ) D5.trigger();
    if (key == 'd' ) E5.trigger();
    if (key == 'f' ) F5.trigger();
    if (key == 'j' ) G5.trigger();
    if (key == 'k' ) A5.trigger();
    if (key == 'l' ) B5.trigger();
    if (key == 'e' ) snare.trigger();
  }
}

//This code I modified from the spiral example again, with the different variables of the spiral
//representing the rgb code for the color and the position of the spiral.
void spiral(float r, float t, float n, int i, int z) {
  float x = i + cos(angle) * scalar;
  float y = z + sin(angle) * scalar;
  fill(r, t, n);
  ellipse(x, y, 10, 10);
  angle += speed;
  scalar += speed;
}

