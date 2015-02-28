
import arb.soundcipher.*;
import arb.soundcipher.constants.*;

SoundCipher mySample = new SoundCipher(this);

int []noteArray={80,40,30,90,60};
int rectX,rectY,rectW,rectH;
int yPos=0;
int c=0;
int instrument;
int i=0;
void setup()
{
  size(200,200);
  rectX=0;
  rectY=height/2;
  rectW=width;
  rectH=20;
  frameRate(60);
}
void draw()
{
  background(255,255,0);
  if(yPos+10==rectY)c=(int)random(255);
  fill(c);
  rect(rectX,rectY,rectW,rectH);
  fill(255);
  rect(width/2,yPos,10,10);
  yPos++;
  if(frameCount%(60*6)==0||frameCount==1)
  {
    instrument=(int)random(127);
    mySample.instrument(instrument);
  }
  int note=noteArray[i];
  if(frameCount%(60*4)==0||frameCount==1)
  {
    mySample.playNote(note,100,2);
    i++;
    i=i%noteArray.length;
  }
  if(yPos>height)
  yPos=0;
}
