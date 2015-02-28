
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;         
AudioPlayer mySound; //  and make a place in memory for your sound

//******************************//
//** PLAY WITH THESE SETTINGS **//

int freq = 220;
float amp = 0.2;
int samples = 20000;

//******************************//


void setup(){
  size(300,300);
  smooth();

  minim = new Minim(this);
   mySound = minim.loadFile("Untitled 2.mp3");   //  load your sound into Minum
  mySound.play();
}



void draw()
{
  background(0); //animating, so we need a background
  
  //bufferSize = the number of samples we're displaying at once
  for(int i = 0; i < mySound.bufferSize() - 1; i++)  
  {
      fill (0,random (0,255), random (0,255));
      noStroke();
    //pull the samples from the mix channel, multiply by 50 to make them visible
    rect(120+mySound.mix.get(i)*100, i, 75 + mySound.mix.get(i+1)*100, i+5);//left buffer
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


