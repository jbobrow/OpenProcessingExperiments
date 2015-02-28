
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.effects.*;
   
int maxdots = 20;
int maxtones = 5;
 
int checks = 0;
int lastPlayTime = 0;
   
int dotsX[] = new int[maxdots];
int dotsY[] = new int[maxdots];
boolean dotsInuse[] = new boolean[maxdots];
 
int x = 0;
int y = 0;
int rectWidth = 500;
int rectHeight = 500;
 
float a = 0.0;
float inc = TWO_PI/25.0;
  
AudioOutput out;
SineWave bleep[] = new SineWave[maxtones];
   
Minim m;
Minim sounds; // declare Minim variable
AudioOutput Aout; // define audio out as a variable Aout
SineWave mousemove; // define a sine wave called mousemove
 
 
 
   
void setup()
{
  size(500, 500, P3D);
   
  m = new Minim(this);
     
  out = m.getLineOut(Minim.STEREO);
  for (int ii = 0; ii<maxtones; ii = ii +1)
  {
    bleep[ii] = new SineWave(100 - ii*10, 0.1, 5000);
  }
 
    
    sounds = new Minim(this);
  Aout = sounds.getLineOut(Minim.STEREO); // send audio out from Minim, default 1024 samples at 44100 Hz, 16 bit
  mousemove = new SineWave(50, 0.05, Aout.sampleRate()); // create a sine wave at 100 Hz, 0.1 amp, sample rate from audio out
  Aout.addSignal(mousemove); // send the oscillator to the audio out
}
   
void __checkAndClearSound()
{
  if (lastPlayTime < checks) {
    out.clearSignals();
  }
}

void __checkAndPlaySound(int reader_position)
{
  for (int ii = 0; ii<maxdots; ii++)
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
  int sinewave = int(float(dotHeight) * maxtones/height);
  lastPlayTime = checks + 20;
  out.addSignal(bleep[sinewave]);
}
 void __drawReaderLine(int reader_position)
{
  
  fill(255);
  stroke(255,0,0);
  if (lastPlayTime > checks)
  {
    strokeWeight(30);
  }
  ellipse(reader_position,250,1,1);
}
  
void __drawLines()
{
   
  
   
  for (int ii = 0; ii<maxdots; ii++)
  {
    if (dotsInuse[ii])
    {
  float rotationx = mouseX * (0.0015);
  float rotationy = mouseY * (0.0015);
  float rotationz = mouseY * mouseX * (0.00005);
   
      
  pushMatrix();
  translate(dotsX[ii], dotsY[ii], -100);
      
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
        strokeWeight(1);
        point(dotsY[ii]*i*0.005,dotsX[ii]+sin(a));
        a = a + inc;
      }
    }
    popMatrix();
        
  }
      
  popMatrix();
  stroke(255,0,0);
  strokeWeight(2);
    point(dotsX[ii], dotsY[ii]);   
}
    
    }
  }
  
   
void draw()
{
  background(0);
   
  
  int readerPos = checks % width;
     
  strokeWeight(1);
  __drawLines();
  __checkAndPlaySound(readerPos);
  __checkAndClearSound();
  __drawReaderLine(readerPos);

     
  checks = checks + 1;
    
    mousemove.portamento(200);
   
  println(mouseX + " " + mouseY + " ");
  if ((x < mouseX) && (mouseX < (x + rectWidth)) && (y < mouseY) && (mouseY < (y+rectHeight))) {
    if ((x < pmouseX) && (pmouseX < (x + rectWidth)) && (y < pmouseY) && (pmouseY < (y+rectHeight))) {
      if(mousePressed == true) {
        Aout.setGain(-80);
      }
      else {
      float freq = map(mouseX, x, (x+rectWidth), 500, 100);
        mousemove.setFreq(freq);
        float vol = map(((y+rectHeight)-mouseY), y, (y+rectHeight), 2, 0);
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
  int dotIndex = int(float(mouseX) * maxdots/width);
     
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


