
import arb.soundcipher.*;
import arb.soundcipher.constants.*;

SoundCipher aSample=new SoundCipher(this);
float []durations={1.0,0.25,0.5,2.0,1.5};
float []pitches={30,50,80,90,70};
float []velocities=new float[durations.length];
float duration=0;
int pitch=0;
int x=0;

void setup()
{
size(200,200);
background(255);
frameRate(60);
aSample.tempo(60);
for(int i=0;i<velocities.length;i++)
  velocities[i]=1.2*pitches[i];
for(int j=0;j<durations.length;j++)
  duration+=durations[j];
}

void draw(){
background(255);
if(frameCount%(60*duration)==0||frameCount==1)
 aSample.playPhrase(pitches,velocities,durations);
rect(width/2-10,(height/2-10),20,20);
rect(x,height/2-5,10,10);
x++;
if(x>width)x=0;
}





