
//**************************************
//********* by Willem Thiart ***********
//**************************************

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

AudioOutput out;
SquareWave square;
Minim m;


int MAX_LINES = 20;

int ticks = 0;
int lastPlayTime = 0;

int linesX[] = new int[MAX_LINES];
boolean linesInuse[] = new boolean[MAX_LINES];


void setup()
{
  size(500, 500);
  m = new Minim(this);
  
  out = m.getLineOut(Minim.STEREO, 1024);
  square = new SquareWave(440, 2, 44100);
  LowPassSP lowpass = new LowPassSP(2000, 44100);
  HighPassSP highpass = new HighPassSP(100, 44100);
  out.addEffect(lowpass);
  out.addEffect(highpass);
}

void __checkAndClearSound()
{
  if (lastPlayTime < ticks) {
    out.clearSignals();
  }
}

void __checkAndPlaySound(int reader_position)
{
  for (int ii = 0; ii<MAX_LINES; ii++)
  {
    if (linesInuse[ii])
    {
      if (linesX[ii] == reader_position)
      {
        __playSound();
      } 
    }
  } 
}

void __playSound()
{
  lastPlayTime = ticks + 10;
  out.addSignal(square);
}

void __drawLines()
{
  stroke(255,255,255);
  for (int ii = 0; ii<MAX_LINES; ii++)
  {
    if (linesInuse[ii])
    {
      line(linesX[ii], 0, linesX[ii], height);
    }
  } 
}

void draw()
{
  background(0);

  // I want to snap the value of ticks between 0 and width:
  int readerPos = ticks % width;
  
  strokeWeight(10);
  __drawLines();
  __checkAndPlaySound(readerPos);
  __checkAndClearSound();
  
  stroke(255,0,0);
  if (lastPlayTime > ticks)
  {
    strokeWeight(30);
  }
  line(readerPos, 0, readerPos, height);
  
  ticks = ticks + 1;
}

void mouseReleased()
{
  int lineIndex = int(float(mouseX) * MAX_LINES/width);
  
  if (mouseButton == LEFT)
  {
    linesX[lineIndex] = mouseX;  
    linesInuse[lineIndex] = true;
  }
  else
  {
    linesInuse[lineIndex] = false;
  }
}

void stop()
{
  super.stop();
}

