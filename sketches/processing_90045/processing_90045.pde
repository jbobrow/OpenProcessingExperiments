
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer jingle;
FFT fft;

void setup()
{
  size(960, 540, P3D);
  textMode(SCREEN);
  
  minim = new Minim(this);
  
  jingle = minim.loadFile("HappyBirthdayPatrick.mp3", 2048);
  jingle.loop();
  
  // create an FFT object that has a time-domain buffer 
  // the same size as jingle's sample buffer
  // note that this needs to be a power of two 
  // and that it means the size of the spectrum
  // will be 512. see the online tutorial for more info.
  fft = new FFT(jingle.bufferSize(), jingle.sampleRate());
}

float cx, cy;

//How many points?
int points = 10;

//Light or dark theme
color[] dark = {0, 30, 60};
color[] light = {120, 210, 240};
color[] palette1 = light;
color[] palette2 = dark;

void draw()
{
  frameRate(30);
  //background(0);
  stroke(255, 50);
  // perform a forward FFT on the samples in jingle's left buffer
  // note that if jingle were a MONO file, 
  // this would be the same as using jingle.right or jingle.left
  fft.forward(jingle.mix);
  
  for(int i = 0; i < fft.specSize(); i++)
  {
    // draw the line for frequency band i, scaling it by 4 so we can see it a bit better
    line(i*2, height/3, i*3, height - fft.getBand(i)*40);
    line(i*3, height*2/3, i*2, 0 + fft.getBand(i)*20);
  }

  //Draw points
  for(int j = 0; j < points; j = j + 1){
    //Circle center
    cx = random(1920);
    cy = random(1080);
    noStroke();
    fill(palette1[0], 35);
    
    for(int i = 0; i < fft.specSize(); i++)
    {
      // draw the ellipse for frequency band i
      ellipse(cx, cy, fft.getBand(i)*3, fft.getBand(i)*2);
    }
    
  }
  
}
void stop()
{
  // always close Minim audio classes when you finish with them
  jingle.close();
  minim.stop();
  
  super.stop();
}


