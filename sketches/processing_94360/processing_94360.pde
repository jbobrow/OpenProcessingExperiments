
import arb.soundcipher.*;
import arb.soundcipher.constants.*;

import arb.soundcipher.*;
import arb.soundcipher.constants.*;



float [] pitches = {30,0,80,0,70};
float [] durations = {1.0,0.25,0.5,2.0,1.5};
float [] velocities = new float [5];

SoundCipher myPhrase = new SoundCipher(this);

int rectx1,rectx2;
int recty1,recty2;
int pos = 0;
int x = 0;
float r,g,b;


void setup ()
{
  size (200,200);
  myPhrase.tempo(60);
  rectx1 =  width/2 -10;
  rectx2 =  x;
  recty1 = height/2 - 10;
  recty2 = height/2 - 5;
  
  
  
  for(int i=0; i < velocities.length; i++)
  {
    int pitovelo = (int)(pitches[i]*1.2);
    if(pitovelo > 127)
    velocities[i] = 127;
  }
}

void draw()
{
  background(255,255,0);
  r = random(255);  g = random(255);  b = random(255);
  
  if (frameCount % 60== 0 || frameCount == 1)
 
  myPhrase.playNote(pos,100,2.0);
  pos++;
  if( pos >= 4)
  {
    pos =0;
  }
  
  if(rectx2 > rectx1 && rectx2 < rectx1 + 20
     && recty2 > recty1 && recty2 < recty1 + 20)
     {
       myPhrase.playPhrase(pitches,durations,velocities);
     }

  
  fill(255,0,255); 
  rect(rectx1, recty1,20,20);
  fill(r,g,b); 
  rect(rectx2,recty2,10,10); 
  rectx2++;
  
  if ( rectx2 > width)
  {
  rectx2=0;
  }

}
