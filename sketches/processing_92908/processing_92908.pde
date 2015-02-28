
import arb.soundcipher.*;
import arb.soundcipher.constants.*;

SoundCipher mySample = new SoundCipher(this);

int rectX, rectY, rectW, rectH;
int yPos = 0;
int c = 0;
int r,g,b;
int note, velocity;
float duration;
int [] noteArray = {80,40,30,90,60};
int i;

void setup()
{
  size(200,200);
  rectX=0;
  rectY=height/2;
  rectW=width;
  rectH=20;
  velocity=100;
  duration=2.0;
  frameRate(60);
}

void draw()
{
  background(255,255,0);
  fill(r,g,b);
  rect(rectX,rectY,rectW,rectH);
  fill(255);
  rect(width/2,yPos,10,10);
  yPos++;
  if(yPos>height)
  {
   yPos=0;
  }
  
  if(yPos==100) 
  {
    r=(int)random(255);
    g=(int)random(255);
    b=(int)random(255);
    fill(r,g,b);
    rect(rectX,rectY,rectW,rectH);
  }
  if(frameCount0==0)
  {
    mySample.playNote(noteArray[i],velocity,duration);
    if(frameCount60==0)
    {
      i++;
      if(i>noteArray.length-1) i=0;
    }
  }
  
}
