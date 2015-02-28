
import arb.soundcipher.*;
import arb.soundcipher.constants.*;

float [] pitches = {30, 50, 80, 90, 70};
float [] velocities = new float[5];
float [] durations = {1.0, 0.25, 0.5, 2.0, 1.5};
SoundCipher mySample = new SoundCipher(this);


int x = 0;
float totalDuration = 0;
int index = 0;

void setup()
{
 size(200, 200);
 for(int i = 0; i < velocities.length; i++)
  {
    velocities[i] = pitches[i] * 1.2;
    totalDuration += durations[i];
  }
 
}

void draw()
{
 background(255);
 
  rect(width/2 - 10, height/2 - 10, 20, 20);
  
  rect(x, height/2 - 5, 10, 10);
  x++;
  if(x == (width/2 - 10) || x == (width/2 + 10))
  {
     
     mySample.playNote(pitches[index], velocities[index], durations[index]);
     index += 2;
     if(index >= pitches.length)
     index = 0;
  }
  if(x > width)
   x = 0;
}
