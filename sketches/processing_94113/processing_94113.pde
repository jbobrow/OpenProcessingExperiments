
import arb.soundcipher.*;
import arb.soundcipher.constants.*;

float [] pitches = {30, 50, 80, 90, 70};
SoundCipher mySample = new SoundCipher(this);

int pitch = 0;
int x = 0;

void setup()
{
 size(200, 200);
}

void draw()
{
 background(255);
 if(frameCount % 60 == 0 || frameCount == 1)
  {
    mySample.tempo(60);
    mySample.playNote(pitches[pitch], 100, 1.0);
  }
  rect(width/2 - 10, height/2 - 10, 20, 20);
  
  rect(x, height/2 - 5, 10, 10);
  x++;
  if(x > width)
   x = 0;
}
