
import ddf.minim.*;

Minim minim;     
AudioPlayer mySound;

void setup()
{
  size(300, 300);
  
  minim = new Minim(this);    
  mySound = minim.loadFile("so happy together.mp3"); 
  mySound.play();
  mySound.mute();
  mySound.loop();
  
  rectMode(CORNERS);
}

void draw()
{
  background(0);
  
 
  float leftLevel = mySound.left.level() * 1000;
  float rightLevel = mySound.right.level() * 1000;
  float mixLevel = mySound.mix.level() *1000;
  
  noStroke();
  fill(rightLevel, 200, 100, leftLevel);
  ellipse(leftLevel, height-leftLevel, leftLevel,leftLevel);
  fill(leftLevel, 100, 200, rightLevel);
  ellipse(rightLevel, rightLevel*2, width - rightLevel,width - rightLevel);
  fill(mixLevel, 0, 200, mixLevel);
  ellipse(mixLevel*3,height - mixLevel,mixLevel,mixLevel);
  fill(225,leftLevel,rightLevel,mixLevel);
  rect(0,20,width- leftLevel,70);
  
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


