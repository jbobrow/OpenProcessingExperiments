
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/3733*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
/**
 * Pixel Array. 
 * 
 * Click and drag the mouse up and down to control the signal and 
 * press and hold any key to see the current pixel being read. 
 * This program sequentially reads the color of every pixel of an image
 * and displays this color to fill the window.  
 */

//libraries
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

//minim instances
Minim minim;
AudioOutput out;
AudioInput input;

//octavas vars
SineWave sine;
PImage a;
int[] aPixels;
int direction = 1;
boolean onetime = true;
float signal;

//2nd sketch vars
float brushSize;
float brushColor;
float brushSaturation;
float xPos;
float yPos;
float inc;


void setup() {
  size(800, 800);
  aPixels = new int[width*height];
  noFill();

  colorMode(HSB, 255, 255, 255);
  frameRate(10);
  background(0);


  minim = new Minim(this);
  input = minim.getLineIn();

  // get a line out from Minim, default bufferSize is 1024, default sample rate is 44100, bit depth is 16
  out = minim.getLineOut(Minim.STEREO);
  // create a sine wave Oscillator, set to 440 Hz, at 0.5 amplitude, sample rate from line out
  sine = new SineWave(440, 0.5, out.sampleRate());
  // set the portamento speed on the oscillator to 200 milliseconds
  sine.portamento(10);
  // add the oscillator to the line out
  out.addSignal(sine);



  brushSize = 5;
  brushColor = 100;
  brushSaturation = 255;
  xPos = 0;
  yPos = 0;
  inc = brushSize;
}

void draw() {
  noStroke();
  brushColor = map(input.left.get(50), 0, 1, 0, 255);  //map the left side
  brushColor = map(input.right.level(), 0, .3, 235, 5);  //map the right side
  fill(brushColor, 255, brushColor) ; // color of the next square
  rect(xPos, yPos, brushSize, brushSize );

  xPos += inc; //move the next color to the right inc pixels

  if (xPos > width) { // if the xpos goes off the screen move add inc to ypos
    xPos = 0; 
    yPos +=inc;
  }
  loadPixels();
  // updatePixels();

  //load an image
  //a = loadImage("RainbowLines/source/signal.tga");

  //loop through image add pixels to aPixels array
  for (int i=0; i<width*height; i++) {
    aPixels[i] = pixels[i];
  }

  //reverse the signal if it goes out of range
  if (signal > width*height-1 || signal < 0) { 
    direction = direction * -1;
  }
  /*
  if(mousePressed) {
   //prevent signal from going out of array
   if(mouseY > height-1) { 
   mouseY = height-1; 
   }
   if(mouseY < 0) { 
   mouseY = 0; 
   }
   
   signal = mouseY*width+mouseX; //signal equals the mouse location
   } else {
   signal += (direction*2);  //signal auto mover
   }
   */

  updatePixels();


  // with portamento on the frequency will change smoothly
  float freq = map(hue(aPixels[int(signal)]), 0, 255, 250, 980);
  //aPixels[int(signal)];
  sine.setFreq(freq);
  // pan always changes smoothly to avoid crackles getting into the signal
  // note that we could call setPan on out, instead of on sine
  // this would sound the same, but the waveforms in out would not reflect the panning
  float pan = map(pixels[int(signal)], 0, width, -1, 1);
  sine.setPan(pan);

  print ("\n Brightness= " + brightness (aPixels[int(signal)]) + "   hue= " + hue (aPixels[int(signal)]) + "  Freq= " + freq);
}

void stop() {
  input.close();
  minim.stop();
  super.stop();
}





