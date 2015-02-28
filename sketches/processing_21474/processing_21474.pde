
// makeLevels
// This is a basic program to visualize the left and right levels
// Code and music for this demo are cribbed from: 
// http://code.compartmental.net/minim/examples/AudioBuffer/level/ 

import ddf.minim.*; 

Minim minim;     
AudioPlayer mySound;

void setup()
{
  size(600, 600);
 background(134);
  minim = new Minim(this);    
  mySound = minim.loadFile("Flosstradamus Podcast.mp3"); 
  mySound.loop();


  
  rectMode(CENTER); // <---- NOTICE THIS
}
 
void draw()
{

  // background(134);
  // my code to make the left levels draw
  

  float leftLevel = mySound.left.level() * 1000;  // <--- this is just a fudge to make the bars high enough
    fill(255,leftLevel,0,20);
    stroke(leftLevel);
    
  rect(leftLevel, leftLevel, leftLevel, leftLevel);

  // ADD THE RIGHT CHANNEL LEVEL HERE: 
  float rightLevel = mySound.right.level()*1000;
  fill(rightLevel,0,255,15);
  stroke(rightLevel);
 
 ellipse(360,375,rightLevel,rightLevel);
  fill(0);
  ellipse(rightLevel,leftLevel,25,25);
   float mixLevel = mySound.mix.level()*1000;

  stroke(0);
  strokeWeight(5);
  line(0,0,rightLevel,leftLevel);
  noStroke();


}
 
  
  
  // *********************************



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




