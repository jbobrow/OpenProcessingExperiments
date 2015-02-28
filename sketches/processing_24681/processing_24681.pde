

import ddf.minim.*; 

Minim minim;     
AudioPlayer mySound;

void setup()
{
  size(500,500);
 
  minim = new Minim(this);    
  mySound = minim.loadFile("1.mp3"); 
  mySound.loop();
  
}
  
  void draw(){
    
    float leftLevel = mySound.left.level() * 500;
    float rightLevel = mySound.right.level() * 1000;
    
    noStroke();
    fill(255,50);
    rectMode(CORNERS);
    rect(0,0,width,height);
    
    fill(100,30);
    rectMode(CENTER);
    rect(random(100,400),random(100,400),leftLevel,leftLevel);
    
    stroke(0,0,random(100,255),30);
    strokeWeight(rightLevel);
    line(random(300,400),0,random(300,400),height);

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


