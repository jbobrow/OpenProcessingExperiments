
//**************************************
//********* by Willem Thiart ***********
//**************************************

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.effects.*;

int MAX_LINES = 20;
int MAX_TONES = 10;
 
AudioOutput out;
SquareWave squares[] = new SquareWave[MAX_TONES];

int ticks = 0;
int lastPlayTime = 0;

int linesX[] = new int[MAX_LINES];
int linesY[] = new int[MAX_LINES];
boolean linesInuse[] = new boolean[MAX_LINES];


Minim m;

void setup()
{
  size(500, 500);
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
        __playSound(linesY[ii]);
      } 
    }
  } 
}

void __playSound(int lineHeight)
{
  int squarewave = int(float(lineHeight) * MAX_TONES/height);
  lastPlayTime = ticks + 10;
  out.addSignal(squares[squarewave]);
}

void __drawLines()
{
  stroke(255,255,255);
  for (int ii = 0; ii<MAX_LINES; ii++)
  {
    if (linesInuse[ii])
    {
      line(linesX[ii], linesY[ii], linesX[ii], height);
    }
  } 
}

void __drawReaderLine(int reader_position)
{
  stroke(255,0,0);
  if (lastPlayTime > ticks)
  {
    strokeWeight(30);
  }
  line(reader_position, 0, reader_position, height); 
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
  __drawReaderLine(readerPos);
  
  ticks = ticks + 1;
}

void mouseReleased()
{
  int lineIndex = int(float(mouseX) * MAX_LINES/width);
  
  if (mouseButton == LEFT)
  {
    linesX[lineIndex] = mouseX;  
    linesY[lineIndex] = mouseY;
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

