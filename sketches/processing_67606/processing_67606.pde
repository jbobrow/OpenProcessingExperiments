
/**
 * Marco Basaldella - "Sistemi Multimediali" - Project 1
 *
 * Bouncing balls over the music of Daft's Punk "Technologic". 
 *
 * Balls are pushed with a force which if proportional to the current
 * song intensity.
 * 
 * Press 'f' to switch between High Pass filter, Low Pass Filter and 
 * Band Pass filter. In High and Low Pass the cutoff frequency is set
 * by the mouse horizontal position; in Band Pass fiter the center of the
 * band is set by the horiziontal position of the mouse and the width is
 * set by the vertical position.
 *
 * Press 'b' to switch background effect (smoke, trail or nothing).
 */
 
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer song;
FFT fft;
HighPassSP hipass;
LowPassSP lowpass;
BandPass bandpass;

int back = 2 ;
int effect = 0;

float freqs[] = {20,40,100,125,160,200,250,400,630,800,1000,2000,4000,8000,10000,20000};

Ball balls[] = new Ball[100];

void setup()
{
  size(800,480);
  smooth();  
  colorMode(HSB,360,360,360);
  
  minim = new Minim(this);
  
  song = minim.loadFile("technologic.mp3");
  fft = new FFT(song.bufferSize(),song.sampleRate());
  fft.logAverages(8,2);
  fft.window(FFT.HAMMING);
  
  for (int i = 0; i < balls.length; i++) {
    balls[i] = new Ball(random(25,50),new PVector((int)random(0,width),(int)random(0,height)),
                          new PVector(random(0,2)-1,random(0,2)-1),0.05,(int)random(0,359));    
  }
  background(0);
  song.play();
  
  hipass = new HighPassSP(440,song.sampleRate());
  lowpass = new LowPassSP(440,song.sampleRate());
  bandpass = new BandPass(440,20,song.sampleRate());
  
  song.addEffect(hipass);
}

void draw()
{
  switch (back)
  {
    case 0:
      //smoke effect
      if(frameCount % 2 == 0 ) image(g,0,0, width+1, height+1);
      // get smokey
      blend(g, 1, 1, width-1, height-1, 0, 0, width, height, REPLACE);
      break;
    case 1:
      stroke(0);
      fill(0,20);
      rect(0,0,width,height);
      break;
    default:
      background(0);
      break;
  }
  
  fft.forward(song.mix);
  float push = 0;  
  for (int i = 0; i < freqs.length; i++) {
    push+=fft.getBand(fft.freqToIndex(freqs[i]));
  } 
  
  for (int i = 0; i < balls.length; i++) 
  {
    balls[i].draw();
    balls[i].update();
    for (int j = i; j < balls.length; j++)
      checkForCollision(balls[i],balls[j]);    
      
    balls[i].push(push/100,new PVector(random(0,2)-1,random(0,2)-1));
  }
}

void mouseMoved() 
{
  switch (effect) {
      case 0:
        hipass.setFreq(map(mouseX,0,width,20,4000));
        break;      
      case 1:
        lowpass.setFreq(map(mouseX,0,width,20,4000));
        break;      
      case 2:
        float freq = map(mouseX, 0, width, 50, 2000);
        bandpass.setFreq(freq);
        float band = map(mouseY, 0, height, 50, 1000);
        bandpass.setBandWidth(band);
        break;      
      default:
        break;     
    }
}

void keyReleased()
{
  if (key=='b') 
  {
    back++;
    back%= 3;
  }
  if (key=='f')
  {
    effect++;
    effect%=4;
    song.noEffects();
    switch (effect) {
      case 0:
        song.addEffect(hipass);
        break;      
      case 1:
        song.addEffect(lowpass);
        break;      
      case 2:
        song.addEffect(bandpass);
        break;
      case 3:
        // no effect
        break;      
      default:
        break;     
    }
  }
}
  

