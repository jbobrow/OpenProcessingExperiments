
/*
   Use 1-8 on your keyboard to play tones in the C major scale
*/

import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;
SineWave sine;
SineWave nullSine;

float freq = 0;
int keysPressed = 0;
int port   = 40;
static final float MAXAMP = 1.0;
float amp  = MAXAMP;

int octave = 5;

String printScale;

//c5-c6 major scale in hz
float[] tones = {32.70, 36.71, 41.20, 43.65, 49.00, 55.00, 61.74, 65.41};

char keys[] =    {'1','2','3','4','5','6','7','8'};
String notes[] = {"C","D","E","F","G","A","B","C"};
boolean keyStates[];

PFont font;

void setup()
{
  size(512, 120, P2D);
  keyStates = new boolean[keys.length];
  minim = new Minim(this);
 
  out = minim.getLineOut(Minim.STEREO);
  nullSine= new SineWave(0, 0, out.sampleRate());
  sine = new SineWave(0, amp, out.sampleRate());
  sine.portamento(port);
  
  font = loadFont("defaultFont.vlw");
  textFont(font, 12);
  
}

//determine which keys have been pressed
void keyPressed()
{
  keysPressed=0;
  out.clearSignals();
  for(int i=0;i<keys.length;i++)
  {
    if(key == keys[i])
    {
      keyStates[i] = true;
    }
    if(keyStates[i])
    {
      keysPressed++;
    }
  }
  
  if(keysPressed == 0) amp = MAXAMP;
  else amp=MAXAMP/keysPressed;
  
  addWaves();
  
  if(keyCode == UP && octave < 8) octave ++;
  if(keyCode == DOWN && octave > 1) octave --;
}

//determine which keys have been released
void keyReleased()
{
  keysPressed = 0;
  out.clearSignals();
  for(int i=0;i<keys.length;i++)
  {
    if(key == keys[i])
    {
      keyStates[i] = false;
    }
    if(keyStates[i])
    {
      keysPressed++;
    }
  }
  
  if(keysPressed == 0) amp = MAXAMP;
  else amp=MAXAMP/keysPressed;
  
  addWaves();
  
}

void draw()
{  
  background(100);
  stroke(255);
  
  
  //draw wave
  for(int i = 0; i < out.bufferSize() - 1; i++)
  {
    float x1 = map(i, 0, out.bufferSize(), 0, width);
    float x2 = map(i+1, 0, out.bufferSize(), 0, width);
    line(x1, 50 + out.left.get(i)*50, x2, 50 + out.left.get(i+1)*50);
  }
  stroke(120);
  line(0, 100, 512, 100);
  line(0, 0, 512, 0);
  fill(0);
  text("amplitude: "+amp*100+"%", 10, 115);
  text("octave: "+octave, 400, 115);
  
  int x = 150;
  for(int i=0;i<keys.length;i++)
  {
    if(keyStates[i])
    { 
      fill(255);
      text(notes[i], x+(i*10), 115);
    } else {
      fill(0);
      text(notes[i], x+(i*10), 115);
    }
  }
}

void addWaves()
{
  for(int i=0;i<keys.length;i++)
  {
    if(keyStates[i])
    {
      println(pow(2,octave)*tones[i]);
      sine = new SineWave(pow(2,octave)*tones[i], amp, out.sampleRate());
      sine.portamento(port);
      out.addSignal(sine);
    }
  } 
}

void stop()
{
  // always close Minim audio classes when you are finished with them
  out.close();
  minim.stop();
 
  super.stop();
}

