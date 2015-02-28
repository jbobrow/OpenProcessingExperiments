
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

color[] palette = {#FFF300, #E88216, #FF004E, #724BE8, #00D9FF};
Minim minim;
AudioOutput out; //declaring audio output variable
SineWave sine; //deaclaring sine variable
SquareWave square; //declaring square variable

AudioSample recorder1; //declaring audio sampler variables
AudioSample recorder2;
AudioSample recorder3;
AudioSample recorder4;
AudioSample recorder5;
AudioSample recorder6;
AudioSample recorder7;
AudioSample recorder8;

String currentSynth = "sine";
PImage flowerBackground;
PImage flowerGain;
PImage sineW;
PImage squareW;
PImage waveform;
float gain = 0.2; //declaring default gain variable for synths
int dbGain = -15; //declaring decibel gain variable for AudioSample

void setup() {
  size(1280, 720);
  background(0);
  
  //set frame rate to 2 frames per minute
  frameRate(2);
  
  minim = new Minim(this);
  out = minim.getLineOut(); //assigning line out to output variable
  //create a sine wave oscillator
  sine = new SineWave(0, gain, out.sampleRate());
  //set the portamento to 100 ms
  sine.portamento(100);
  //set output of oscillator
  out.addSignal(sine); 
  
  //create a square wave oscillator
  square = new SquareWave(0, gain, out.sampleRate());
  //set the portamento to 100 ms
  square.portamento(100);
  //set ouptut of oscillator
  out.addSignal(square);
  
  //load recorder samples
  recorder1 = minim.loadSample("recorder1.wav");
  recorder2 = minim.loadSample("recorder2.wav");
  recorder3 = minim.loadSample("recorder3.wav");
  recorder4 = minim.loadSample("recorder4.wav");
  recorder5 = minim.loadSample("recorder5.wav");
  recorder6 = minim.loadSample("recorder6.wav");
  recorder7 = minim.loadSample("recorder7.wav");
  recorder8 = minim.loadSample("recorder8.wav");
  
  //load flower images
  flowerBackground = loadImage("flower_background.png");
  flowerGain = loadImage("flower_gain.png");
  sineW = loadImage("sine_wave.png");
  squareW = loadImage("square_wave.png");
  waveform = loadImage("waveform.png");
}

void draw() {
  //set flower photo as background
  image(flowerBackground, 0, 0);
  
  PFont font = loadFont("Andalus-50.vlw");
  textFont(font);
  textSize(60);
  fill(palette[0]);
  textAlign(CENTER);
  text("flowerSynth", width/2, 80);
  
  //add sine and square wave icons
  scale(0.5);
  image(sineW, 100, 200);
  image(squareW, 100, 600);
  image(waveform, 100, 1000);
  fill(palette[2]);
  stroke(palette[2]);
  if (currentSynth == "sine") rect(500, 315, 200, 50);
  if (currentSynth == "square") rect(500, 715, 200, 50);
  if (currentSynth == "none") rect(500, 1115, 200, 50);
  
  //make gain level indicator
  if (gain == 0.1 || gain == 0.10000002) { //sometimes processing does the math incorrectly
    image(flowerGain, 2000, 1100);
  }
  if (gain == 0.2 || gain == 0.20000002) { //sometimes processing does the math incorrectly
    image(flowerGain, 2000, 1100);         
    image(flowerGain, 2000, 900);
  }
  if (gain == 0.3) {
    image(flowerGain, 2000, 1100);
    image(flowerGain, 2000, 900);
    image(flowerGain, 2000, 700);
  }
  if (gain == 0.4) {
    image(flowerGain, 2000, 1100);
    image(flowerGain, 2000, 900);
    image(flowerGain, 2000, 700); 
    image(flowerGain, 2000, 500);
  }
  if (gain == 0.5) {
    image(flowerGain, 2000, 1100);
    image(flowerGain, 2000, 900);
    image(flowerGain, 2000, 700); 
    image(flowerGain, 2000, 500);
    image(flowerGain, 2000, 300);
  }
   if (gain == 0.6) {
    image(flowerGain, 2000, 1100);
    image(flowerGain, 2000, 900);
    image(flowerGain, 2000, 700); 
    image(flowerGain, 2000, 500);
    image(flowerGain, 2000, 300);
    image(flowerGain, 2000, 100);
  }
}

void keyPressed() {
  //press keys s through l to play an octave from C to C on a sine wave oscillator
  if (key == 's' && currentSynth == "sine") sine.setFreq(261.63);
  if (key == 'd' && currentSynth == "sine") sine.setFreq(293.66);
  if (key == 'f' && currentSynth == "sine") sine.setFreq(329.63);
  if (key == 'g' && currentSynth == "sine") sine.setFreq(349.23);
  if (key == 'h' && currentSynth == "sine") sine.setFreq(392);
  if (key == 'j' && currentSynth == "sine") sine.setFreq(440);
  if (key == 'k' && currentSynth == "sine") sine.setFreq(493.88);
  if (key == 'l' && currentSynth == "sine") sine.setFreq(523.25);
  
  //press keys s through l to play an octave from C to C on a sampled recorder
  if (key == 's' && currentSynth == "none") recorder1.trigger();
  if (key == 'd' && currentSynth == "none") recorder2.trigger();
  if (key == 'f' && currentSynth == "none") recorder3.trigger();
  if (key == 'g' && currentSynth == "none") recorder4.trigger();
  if (key == 'h' && currentSynth == "none") recorder5.trigger();
  if (key == 'j' && currentSynth == "none") recorder6.trigger();
  if (key == 'k' && currentSynth == "none") recorder7.trigger();
  if (key == 'l' && currentSynth == "none") recorder8.trigger();
  
  //pressing 1 changes oscillator to sine wave
  //pressing 2 changes oscillator to square wave
  //pressing 3 changes to sample playback
  if (key == '1') currentSynth = "sine";
  if (key == '2') currentSynth = "square";
  if (key == '3') currentSynth = "none";
  
  //pressing the arrow keys adjusts the gain.
  if (key == CODED) {
   if (keyCode == UP) {
     gain += 0.1; 
     dbGain += 5;
     if (gain >= 0.1 && gain <= 0.6 && dbGain >= -15 && dbGain <= 10) { 
      sine.setAmp(gain);
      square.setAmp(gain); 
      recorder1.setGain(dbGain);
      recorder2.setGain(dbGain);
      recorder3.setGain(dbGain);
      recorder4.setGain(dbGain);
      recorder5.setGain(dbGain);
      recorder6.setGain(dbGain);
      recorder7.setGain(dbGain);
      recorder8.setGain(dbGain);
      } else {
        gain = 0.6;
        dbGain = 10;
      }
   }
   if (keyCode == DOWN) {
     gain -= 0.1;
     dbGain -= 5;
     if (gain >= 0.1 && gain <= 0.6 && dbGain >= -15 && dbGain <= 10) {
       sine.setAmp(gain);
       square.setAmp(gain);
       recorder1.setGain(dbGain);
       recorder2.setGain(dbGain);
       recorder3.setGain(dbGain);
       recorder4.setGain(dbGain);
       recorder5.setGain(dbGain);
       recorder6.setGain(dbGain);
       recorder7.setGain(dbGain);
       recorder8.setGain(dbGain);
     } else { 
       gain = 0.1;
       dbGain = -10;
     }
   }
  }
  
  //press keys s through l to play an octave from C to C on a square wave oscillator
  if (key == 's' && currentSynth == "square") square.setFreq(261.63);
  if (key == 'd' && currentSynth == "square") square.setFreq(293.66);
  if (key == 'f' && currentSynth == "square") square.setFreq(329.63);
  if (key == 'g' && currentSynth == "square") square.setFreq(349.23);
  if (key == 'h' && currentSynth == "square") square.setFreq(392);
  if (key == 'j' && currentSynth == "square") square.setFreq(440);
  if (key == 'k' && currentSynth == "square") square.setFreq(493.88);
  if (key == 'l' && currentSynth == "square") square.setFreq(523.25);
}

void keyReleased() {
  sine.setFreq(0);
  square.setFreq(0);
}

//closing all minim threads
void stop() {
  out.close();
  minim.stop();
  super.stop();
}



