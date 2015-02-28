
import ddf.minim.*; 

Minim minim;     
AudioPlayer mySound;

void setup(){
  size(500,500);
  background(0);
  smooth();
  
  minim = new Minim(this);    
  mySound = minim.loadFile("a6.2_GoodQuality.mp3"); 
  mySound.loop();
}

void draw(){
  noStroke();
  fill(0,50);
  rect(0,0,width,height);
  
  float R = mySound.left.level() * 250;
  float G = mySound.mix.level() * 250;
  float B = mySound.right.level() * 250;
  fill(255-R,255-G,255-B);
  float side = mySound.left.level() * width/3;
  float up = mySound.right.level() * height/3;
  ellipse(width/2,height/2,side,up);
  
  stroke(255);
  strokeCap(PROJECT);
  translate(width/2,height/2);
  noFill();
  rotate(frameCount*PI/2*.01);
  float leftLevel = mySound.left.level() * 500;
  strokeWeight(leftLevel);
  bezier(width/3,0,width/4,height/4,width/4,height/4,0,height/3);
  float rightLevel = mySound.right.level() * 500;
  strokeWeight(rightLevel);
  bezier(-width/3,0,-width/4,-height/4,-width/4,-height/4,0,-height/3);
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

