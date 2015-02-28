
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
  mySound = minim.loadFile("Flosstradamus Podcast.mp3");   //  load your sound into Minum
  mySound.play();
    mySound.loop();
}



void draw()
{
  
  background(0); //animating, so we need a background
  noStroke();
  //bufferSize = the number of samples we're displaying at once
  for(int i = 0; i < mySound.bufferSize() - 1; i++)  
  {
    fill(0,255,0,30);
    //pull the samples from the mix channel, multiply by 50 to make them visible
    ellipse(i, mySound.left.get(i), i+1, 25 + mySound.left.get(i+1)*50);
   fill(155,mySound.right.get(i+1),178,46);
    ellipse(500, 145, 50 + mySound.right.get(i+1)*50,50 + mySound.right.get(i+1)*70); 
     fill(255,149,36,46);
    rect(i, 350+ mySound.mix.get(i)*350, i+1, 50 + mySound.mix.get(i+1)*50);
     fill(255,149,136,30);
    rect(i, 250+ mySound.mix.get(i)*350, i+1, 50 + mySound.mix.get(i+1)*50);
    fill(155,190,mySound.right.get(i+1),46);
    ellipse(45, 146, 50 + mySound.right.get(i+1)*50,50 + mySound.right.get(i+1)*50); 
        
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


