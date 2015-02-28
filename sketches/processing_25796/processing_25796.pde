
//**************************************
//********* by Ben Jack ****************
//**************************************

import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

int speed = 20;

AudioOutput[] player;

SquareWave[] waves;

int[] current;
int[] ticks;
boolean[] isPlaying;
int radius = 50;
int[][] positions;
int[] colours;
int lastRoll = -1;
int mainTicks = 0;
int expandSize = 30;

int currentOut = 0;

LowPassSP   lowpass;
HighPassSP   highpass;

Minim m;


void setup()
{
  size(500,500);
  m = new Minim(this);
  positions = new int[9][2];
  colours = new int[9];
  waves = new SquareWave[10];
  current = new int[10];
  player = new AudioOutput[9];
  ticks = new int[9];
  isPlaying = new boolean[9];
  

  int currX = width/6;
  int currY = height/6;

  lowpass = new LowPassSP(950, 44100);
  highpass = new HighPassSP(100, 44100);


  for(int i = 0; i < 10; i++)
  {
    waves[i] = new SquareWave(300*(i+1), 1, 44100);
    current[i] = 9;
  }

  for(int i = 0; i < 9; i++)
  {
    positions[i][0] = currX;
    positions[i][1] = currY;
    isPlaying[i] = false;
    ticks[i] = 0;
    colours[i] = 255;
    player[i] = m.getLineOut(Minim.STEREO, 512);
    player[i].addEffect(lowpass);
    player[i].addEffect(highpass);


    if((i+1)%3 == 0){
      currY = ((currY + (height/3))%height);
      currX = width/6;
    }
    else{
      currX = ((currX + (width/3))%width);
    }  
  } 


  smooth();
}



void draw()
{
  
  background(0);

  drawCircles();
  
  if (mainTicks%speed == 0)
  {
    currentOut = ((currentOut+1)%9);   
    isPlaying[currentOut] = true;
    player[currentOut].addSignal(waves[current[currentOut]]);
  }
  else if(mainTicks%(speed/2) == 0)
  {
    isPlaying[currentOut] = false;
    player[currentOut].clearSignals();
  }
  
  mainTicks++;
}

boolean isNear(int arrayPos)
{
  double distance = Math.sqrt(Math.pow(mouseX-positions[arrayPos][0],2) + Math.pow(mouseY-positions[arrayPos][1],2));
  return distance < radius;
}




void mouseMoved()
{
  boolean wasOver = false; 

  for(int i = 0; i < 9; i++)
  {
    if(isNear(i))
    {
      wasOver = true;
      if(lastRoll != i)
      {
        if(colours[i] > 255/10 && current[i] > 0){
          colours[i] -= 255/10;
          lastRoll = i;
          current[i]--;
        }
      }
    }
  }

  if(!wasOver)
    lastRoll = -1;
}



void drawCircles()
{
    for(int i = 0; i < 9; i++)
  {
    fill(colours[i]);
    
    if(!isPlaying[i])
      ellipse(positions[i][0],positions[i][1],radius*2,radius*2);
    else
      ellipse(positions[i][0],positions[i][1],radius*2+expandSize,radius*2+expandSize);
  }
}

