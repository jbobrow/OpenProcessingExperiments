
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;         //  THEN create a new instance of Minum in memory
AudioPlayer mySound; //  and make a place in memory for your sound



void setup(){
  size(500,350);

  minim = new Minim(this);                      //  load Minum
  mySound = minim.loadFile("07 The Nervous Track.mp3");   //  load your sound into Minum
  mySound.play();
}



void draw()
{
  background(0); //animating, so we need a background
  
  //bufferSize = the number of samples we're displaying at once
  for(int i = 0; i < mySound.bufferSize() - 1; i++)  
  

  {
     frameRate(20);
    stroke(0,250,114);
    //pull the samples from the mix channel, multiply by 50 to make them visible
    line(i, 75 + mySound.right.get(i)*150, i+1, 75 + mySound.left.get(i)*150);
    
    stroke(94,195,70);
    //pull the samples from the mix channel, multiply by 50 to make them visible
    ellipse(i, 150 + mySound.right.get(i)*150, i+1, 150 + mySound.left.get(i)*150);
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


