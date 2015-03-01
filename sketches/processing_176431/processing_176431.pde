

import ddf.minim.*;


//Final Projest
//Loading image and sound using key press

//Global variables
//I am using the minim lin=brary to store the audio tracks
int m = millis();
Minim minim;
AudioSample fanfare1;
AudioSample fanfare2;
AudioSample fanfare3;
AudioSample fanfare4;
 


//Declare the PImage
//I have four images of a trumpet that fill each quarter of the screen
PImage TopLeftTrumpet;
PImage TopRightTrumpet;
PImage BottomLeftTrumpet;
PImage BottomRightTrumpet;

void setup() {
  size(1280, 720);
  background(#892A04);
  
  //These will call the images into the project
  TopLeftTrumpet = loadImage("TopLeftTrumpet.png");
  TopRightTrumpet = loadImage("TopRightTrumpet.png");
  BottomLeftTrumpet = loadImage("BottomLeftTrumpet.png");
  BottomRightTrumpet = loadImage("BottomRightTrumpet.png");
  
  //These will call the audio files into the project
  minim = new Minim(this);
  fanfare1 = minim.loadSample("Fanfare 1.wav");
  fanfare2 = minim.loadSample("Fanfare 2.wav");
  fanfare3 = minim.loadSample("Fanfare 3.wav");
  fanfare4 = minim.loadSample("Fanfare 4.wav");
    
}

void draw() {
 
}

//Create key trigger
//The keys pressed serve both loading of images and execution of audio files
//Keys 1-4 call up each image aaudio file individually
//Key 5 calls the complete image as well as the full audio
//Key 6 resets the sketch
void keyPressed() {
 if ( key == '1' ) fanfare1.trigger();
 if ( key == '1' ) image(TopLeftTrumpet, 0, 0, 640, 360);
 if ( key == '2' ) fanfare2.trigger();
 if ( key == '2' ) image(TopRightTrumpet, 640, 0, 640, 360);
 if ( key == '3' ) fanfare3.trigger();
 if ( key == '3' ) image(BottomLeftTrumpet, 0, 360, 640, 360);
 if ( key == '4' ) fanfare4.trigger();
 if ( key == '4' ) image(BottomRightTrumpet, 640, 360, 640, 360); 
 if ( key == '5' ) fanfare1.trigger(); 
 if ( key == '5' ) fanfare2.trigger();
 if ( key == '5' ) fanfare3.trigger();
 if ( key == '5' ) fanfare4.trigger();
 if ( key == '5' ) image(TopLeftTrumpet, 0, 0, 640, 360);
 if ( key == '5' ) image(TopRightTrumpet, 640, 0, 640, 360);
 if ( key == '5' ) image(BottomLeftTrumpet, 0, 360, 640, 360);
 if ( key == '5' ) image(BottomRightTrumpet, 640, 360, 640, 360);
 if ( key == '6' ) setup();
 }




