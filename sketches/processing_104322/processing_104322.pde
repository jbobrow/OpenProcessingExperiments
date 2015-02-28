
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.effects.*;
  
int MAX_DOTS = 20;
int MAX_TONES = 10;
  
float a = 0.0;
float inc = TWO_PI/25.0;

AudioOutput out;
SquareWave squares[] = new SquareWave[MAX_TONES];
  
int ticks = 0;
int lastPlayTime = 0;
  
int dotsX[] = new int[MAX_DOTS];
int dotsY[] = new int[MAX_DOTS];
boolean dotsInuse[] = new boolean[MAX_DOTS];
  
  
Minim m;

Minim sounds; // declare Minim variable
AudioOutput Aout; // define audio out as a variable Aout
SineWave squiggly; // define a sine wave called squiggly
int r = 24;
int x = 0;
int y = 0;
int rectWidth = 500;
int rectHeight = 500;
  
void setup()
{
  size(500, 500, P3D);
  m = new Minim(this);
    
  out = m.getLineOut(Minim.STEREO, 1024);
  for (int ii = 0; ii<MAX_TONES; ii = ii +1)
  {
    squares[ii] = new SquareWave(500 - ii*50, 1, 44100);
  }
  LowPassSP lowpass = new LowPassSP(2000, 44100);
  HighPassSP highpass = new HighPassSP(100, 44100);
  out.addEffect(lowpass);
  out.addEffect(highpass);
  
    sounds = new Minim(this);
  Aout = sounds.getLineOut(Minim.STEREO); // send audio out from Minim, default 1024 samples at 44100 Hz, 16 bit
  squiggly = new SineWave(900, 0.1, Aout.sampleRate()); // create a sine wave at 440 Hz, 0.5 amp, sample rate from audio out
  Aout.addSignal(squiggly); // send the oscillator to the audio out
}
  
void __checkAndClearSound()
{
  if (lastPlayTime < ticks) {
    out.clearSignals();
  }
}
  
void __checkAndPlaySound(int reader_position)
{
  for (int ii = 0; ii<MAX_DOTS; ii++)
  {
    if (dotsInuse[ii])
    {
      if (dotsX[ii] == reader_position)
      {
        __playSound(dotsY[ii]);
      }
    }
  }
}
  
void __playSound(int dotHeight)
{
  int squarewave = int(float(dotHeight) * MAX_TONES/height);
  lastPlayTime = ticks + 10;
  out.addSignal(squares[squarewave]);
}
  
void __drawLines()
{
  stroke(random(0,255),random(0,255),random(0,255),random(0,255));
  for (int ii = 0; ii<MAX_DOTS; ii++)
  {
    if (dotsInuse[ii])
    {
  float rotationx = mouseX * (0.0015);
  float rotationy = mouseY * (0.0015);
  float rotationz = mouseY * mouseX * (0.00005);
  
    
  pushMatrix();
  translate(250, 250, -100);
    
  for(int instance = 1; instance <= 200; instance=instance+4)
  {
      
    rotateY(rotationy);
    rotateZ(rotationz);
      
    pushMatrix();
    for(int i=0; i<200; i=i+4) {
    {
      rotateX(rotationx);
        stroke(255);
        translate(0, 0, -10);
        point(dotsY[ii]*i*0.005,dotsX[ii]+sin(a));
  a = a + inc;
      }
    }
    popMatrix();
      
  }
    
  popMatrix();
      
}
  
    }
  }

  
void draw()
{
  background(0);
  

  int readerPos = ticks % width;
    
  strokeWeight(1);
  __drawLines();
  __checkAndPlaySound(readerPos);
  __checkAndClearSound();
    
  ticks = ticks + 1;
  
    squiggly.portamento(200);
  
  println(mouseX + " " + mouseY + " ");
  if ((x < mouseX) && (mouseX < (x + rectWidth)) && (y < mouseY) && (mouseY < (y+rectHeight))) {
    if ((x < pmouseX) && (pmouseX < (x + rectWidth)) && (y < pmouseY) && (pmouseY < (y+rectHeight))) {
      if(mousePressed == true) {
        Aout.setGain(-80);
      }
      else {
      float freq = map(mouseX, x, (x+rectWidth), 100, 1000);
        squiggly.setFreq(freq);
        float vol = map(((y+rectHeight)-mouseY), y, (y+rectHeight), 5, 0);
        Aout.setGain(vol);
        
      }
    }
  }
  else {
    Aout.setGain(-80);
  }
}
  
void mouseReleased()
{
  int dotIndex = int(float(mouseX) * MAX_DOTS/width);
    
  if (mouseButton == LEFT)
  {
    dotsX[dotIndex] = mouseX;
    dotsY[dotIndex] = mouseY;
    dotsInuse[dotIndex] = true;
  }
  else
  {
    dotsInuse[dotIndex] = false;
  }
}
  
void stop()
{
  super.stop();
}
