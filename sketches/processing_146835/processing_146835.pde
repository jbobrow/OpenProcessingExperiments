
PImage[] wave = new PImage[23]; 
int counter;  
int lastTime; // When the current image was first displayed  
import ddf.minim.analysis.*;
import ddf.minim.*;
FFT fft;
Minim minim;
AudioInput in;

void setup() 
{ 
  size(1024, 400);
  //size(912, 501); 
  background(255);

  for (int i = 0; i < wave.length; i++) 
  { 
    wave[i] = loadImage("img" + i + ".png");
  } 
  lastTime = millis();

  minim = new Minim(this);
  
  // use the getLineIn method of the Minim object to get an AudioInput
  in = minim.getLineIn();
  
  // uncomment this line to *hear* what is being monitored, in addition to seeing it
  //in.enableMonitoring();
  
  fft = new FFT( in.bufferSize(), in.sampleRate() );
}   

void draw() {
  stroke(255);
  // draw the waveforms so we can see what we are monitoring
  fft.forward( in.mix );
  for (int i = 0; i < fft.specSize(); i++)
  {
    // draw the line for frequency band i, scaling it up a bit so we can see it
    strokeWeight(1.5);
    strokeCap(ROUND);
    line( i*4, height/2, i*4, height/2 - fft.getBand(i)*50 );
    line( i*4, height/2, i*4, height/2 + fft.getBand(i)*50 );
  }
  
  tint(0, 0, 0, 30);
  //scale(1);
  image(wave[counter], 60, -51.2);
  float DISPLAY_TIME = 150;
  if (millis() - lastTime >= DISPLAY_TIME) 
  {  
    counter = ++counter % wave.length; 
    lastTime = millis();
  } 
  
  restart();
}

void restart() {
  int a = frameCount;
  if (a >= 100 ) {  
    setup();

    frameCount=0;
    //scale(0.5);
    draw();
  }
}


