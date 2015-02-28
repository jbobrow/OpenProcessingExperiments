
import arb.soundcipher.*;
import arb.soundcipher.constants.*;

SoundCipher mySample = new SoundCipher(this);

int rectX, rectY, rectW, rectH;
int yPos = 0;
int c = 0;
int r = 0, g = 0, b = 0;
int randNote;
int randInstrument;

void setup()
{
 size(200, 200);
 rectX = 0;
 rectY = height/2;
 rectW = width;
 rectH = 20;
}

void draw()
{
 background(255, 255, 0);
 fill(r, g, b);
 rect(rectX, rectY, rectW, rectH);
 fill(255);
 rect(width/2, yPos, 10, 10);
 yPos++;
 if((yPos + 10) == rectY)
 {
  r = (int)random(255);
  g = (int)random(255);
  b = (int)random(255);
 }
 if(yPos > height)
  yPos = 0;
  randNote = (int)random(127);
  if(frameCount % (360) == 0 || frameCount == 1)
  {
    randInstrument = (int)random(127);
    mySample.instrument(randInstrument);
  }
 
  if(frameCount % (180) == 0 || frameCount == 1)
  mySample.playNote(randNote, 100, 2.0);
 
}
