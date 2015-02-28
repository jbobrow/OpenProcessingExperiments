
import processing.opengl.*;

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

//audio variables
Minim minim;
AudioPlayer song;
FFT fft;
float currentBand;
final String trackName = "bring_me_to_life.mp3";

//effects
HighPassSP highpass;
LowPassSP lowpass;
float baseHighPassFreq = 1; //Hz
float baseLowPassFreq = 22050; //Hz
GainControl gainController;

//graphical setting
final color backgrnd = color(255);

//Spectrum bar variable
List<SpectrumBar> bars;
color barColor;
color mainBarColor = color(18,64,171,255);
color reflectedBarColor = color(18,64,171,150);

//UI controls
SpringControl[] controls;
color UIControlsBackground = color(255);

void setup() {
  size(600, 480, OPENGL);
  
  //init sound
  minim = new Minim(this);
  song = minim.loadFile(trackName, 1024);
  
  //setup UI controls
  controls = new SpringControl[2];
  controls[0] = new SpringControl( width/4, 50, 0.75, 8.0, 0.5, "Frequencies filter");
  controls[1] = new SpringControl( 3*width/4, 50, 0.75, 8.0, 0.5, "Gain");
  
  //init FFT object
  fft = new FFT(song.bufferSize(), song.sampleRate());
  fft.linAverages(75);
  fft.window(FFT.HAMMING);
  
  //init bast spectrum bars
  bars = new ArrayList<SpectrumBar>();
  
  //init filter
  lowpass = new LowPassSP(baseLowPassFreq, 44100);
  highpass = new HighPassSP(baseHighPassFreq, 44100);
  
  //setup gain coltroller
  gainController = new GainControl();
  
  //add effectr to the song
  song.addEffect(highpass);
  song.addEffect(lowpass);
  song.addEffect(gainController);
  
  //start play
  song.play();
  
}

void draw() {
  background(backgrnd);
  
  //display UI controls
  fill(UIControlsBackground);
  rectMode(CORNER);
  noStroke();
  rect(0,0,width,75);
  for (int i = 0; i < controls.length; i++) { 
    controls[i].update(); 
    controls[i].display(); 
  } 
  
  //compute FFT
  fft.forward(song.mix);
  //...and show each component
  for(int i = 0; i < fft.avgSize(); i++) {
    // get magnitude of fft at band i
    currentBand = fft.getBand(i);
    
    //setup the past bar color
    colorMode(HSB,360);
    int barHue = int(90-min(currentBand*2,90));
    barColor = color(barHue, 360, 360);
    colorMode(RGB);
    
    // Draw a bar for FFT Band i as well as a reflection of the bar
    pushMatrix();
    translate(i*width/fft.avgSize(), height, -width/10);
    stroke(mainBarColor);
    strokeWeight(4);
    line(0, 0, 0, 0, -4*currentBand, 0);
    stroke(reflectedBarColor);
    strokeWeight(4);
    line(0, 0, 0, -2*currentBand, 2*currentBand, currentBand/4);
    popMatrix();
    
    // Make a spot if the magnitude of the band is big enough
    if((currentBand > 1)) {
      bars.add(new SpectrumBar(i*width/fft.avgSize(), height-int(4*currentBand), -width/10, barColor));
    }
  }
  
  // udate the fresh bars and remove the oldest
  for(int i=0; i<bars.size(); i++){
    SpectrumBar bar = bars.get(i);
    if(bar.dead()){
      bars.remove(bar);
    } else {
      bar.update();
    }
  }
  
  // update value of frequency UI control
  updateFrequencyControl();
  //update value of gain
  updateGainControl();
  
}

void stop() {
  song.close();
  minim.stop();
  super.stop();
}

void mousePressed() {
  for (int i = 0; i < controls.length; i++) {
    controls[i].pressed(); 
  }
}

void mouseReleased() {
  for (int i = 0; i < controls.length; i++) {
    controls[i].released(); 
  }  
}

void updateFrequencyControl(){
  if(controls[0].getValue()>0){
    //use a highpass filter and not the lowpass
    highpass.setFreq(baseHighPassFreq+22050.0/100.0*controls[0].getValue());
    lowpass.setFreq(baseLowPassFreq);
  } else {
    //use a lowpass filter and not the highpass
    highpass.setFreq(baseHighPassFreq);
    lowpass.setFreq(baseLowPassFreq+22050.0/100.0*controls[0].getValue());
  }
}

void updateGainControl(){
  float newGain = gainController.gain()+(1/pow(100,2)*controls[1].getValue());
  newGain = constrain(newGain,0,1);
  gainController.setGain(newGain);
}


