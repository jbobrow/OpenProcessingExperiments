
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;
SineWave sine1;
SineWave sine2;

void setup()
{
  size(800,600);
  background(255);
  smooth();
  strokeWeight(0.5);
  minim = new Minim(this); 
  out = minim.getLineOut(Minim.STEREO);
  sine1 = new SineWave(120,20, out.sampleRate());
  sine2 = new SineWave(120,10, out.sampleRate());
  sine1.portamento(10);
  sine2.portamento(10);
  out.addSignal(sine1);
  out.addSignal(sine2);
}

float beat1 = random(60,160);
float beat2 = random(60,160);
float time = 0;
float x = 0;
float y = 0;

int freq1 = 30;
int freq2 = 90;

int xInc = 5;
int yInc = 10;

void draw()
{
  stroke(0);
  drawRadar(width*1/3,height/2, x);
  drawRadar(width*2/3,height/2, y);
  sine1.setFreq(freq1);
  sine2.setFreq(freq2);

  x+=xInc;
  y+=yInc;

  freq1+=10;
  freq2+=20;

  noStroke();
  fill(255);
  if (x%360 == 0) 
  {
    freq1 = 30;
    rect(0,0,width/2,height);
  }
  if (y%360 == 0) 
  {
    freq2 = 90;
    rect(width/2,0,width/2,height);
  }
}

void drawRadar(float X, float Y, float I)
{
  pushMatrix();
  translate(X,Y);
  rotate(2*PI*(I/360));
  rect(0,0,100,0);
  popMatrix();
}

void mouseClicked()
{
  xInc++;
}

