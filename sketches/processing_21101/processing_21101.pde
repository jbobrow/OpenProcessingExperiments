
//Adam Oaks

import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;         
AudioPlayer mySound;

void setup() {
  size(600,600);
  noFill();
  smooth();

  minim = new Minim(this);
  mySound = minim.loadFile("SL.mp3",2000);
  mySound.play();
}

float x1 = 150;
float x2 = 200;
float x3 = 400;
float x4 = 450;

void draw() {


  background(0);

  for(int i = 0; i < mySound.bufferSize() - 1; i+=25)  
  {
    strokeWeight(1); 
    stroke (255, 235,0);
    ellipse(width/2, height/2, mySound.mix.get(i+1)*600, mySound.mix.get(i+1)*600);
  }

  for(int i = 0; i < mySound.bufferSize() - 1; i+=10)   
  {
    strokeWeight(6);   
    stroke(0, 255, 0);
    line(x1 + mySound.left.get(i)*100, i, x1 + mySound.left.get(i+1)*100,i+1);
    line(x2 + mySound.left.get(i)*100, i, x2 + mySound.left.get(i+1)*100,i+1);
    stroke (255, 0, 0);
    line(x3 + mySound.right.get(i)*100,i, x3 + mySound.right.get(i+1)*100,i+1);
    line(x4 + mySound.right.get(i)*100,i, x4 + mySound.right.get(i+1)*100,i+1);
  }
}


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


