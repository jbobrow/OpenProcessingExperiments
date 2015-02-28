
import ddf.minim.*;
import ddf.minim.signals.*;
 
 
AudioOutput out;    // create an output object
//SineWave sine;      // create a sine wave object
 
//******************************//
//** PLAY WITH THESE SETTINGS **//
import ddf.minim.*;  //  FIRST you need to import this library to play sound
 
Minim minim;         //  THEN create a new instance of Minum in memory
AudioPlayer mySound; //  and make a place in memory for your sound
 
int freq = 23440;
float amp = 0.5;
int samples = 44100;
 
//******************************//
 
 
void setup(){
  size(600,600);
 
  minim = new Minim(this);
 minim = new Minim(this);                      //  load Minum
  mySound = minim.loadFile("keithurbangoodmorningbeautiful.mp3");   //  load your sound into Minum
  mySound.play();
    mySound.loop();
}
 
 
 
void draw()
{
   
  background(158,250,226); //animating, so we need a background
  noStroke();
  //bufferSize = the number of samples we're displaying at once
  for(int i = 0; i < mySound.bufferSize() - 1; i++) 
  {
     fill(255,255,5,60);
    ellipse(150,350, 100 + mySound.right.get(i+1)*300, 100 + mySound.right.get(i+1)*300);
     fill(114,196,65,60);
    rect(i,500+ mySound.left.get(i)*350, i+1, mySound.left.get(i+1)*100);
         
  }
}
 
// here we provide a way to mute out
void keyPressed()
{
  if ( key == 'm' )
  {
    if ( mySound.isMuted() )
    {
      mySound.unmute();
    }
    else
    {
      mySound.mute();
    }
  }
}
 
void stop()
{
 mySound.close();
  minim.stop();
 
  super.stop();
}


