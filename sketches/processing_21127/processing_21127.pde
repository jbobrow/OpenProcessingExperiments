
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;         
AudioPlayer mySound; 

int freq = 440;
float amp = 1.25;
int samples = 44100;
int cellsize=2;

void setup(){
  size(300,300,P3D);
  minim = new Minim(this);                     
  mySound = minim.loadFile("Scalliwag.wav");  
  mySound.loop();
  smooth();
  rectMode(CORNER);
}

void draw(){
  background(random(180,255)); 
  for(int i = 0; i < mySound.bufferSize() -cellsize; i+=cellsize)  {
    noStroke();
    fill(100 + mySound.mix.get(i)*200,0,0,90);
    //rect(i,0, cellsize, 100 + mySound.left.get(i)*100);
    //rect(i,200 + mySound.right.get(i)*100, cellsize,height );
    stroke(100+mySound.left.get(i)*200,50,50);
    strokeWeight(random(5,20));
    line(i,0 + mySound.left.get(i)*100,i+cellsize,0 + mySound.left.get(i+cellsize)*100);
    strokeWeight(random(5,20));
    line(i,20 + mySound.left.get(i)*125,i+cellsize,20 + mySound.left.get(i+cellsize)*125);
    strokeWeight(random(5,20));
    line(i,40 + mySound.left.get(i)*250,i+cellsize,40 + mySound.left.get(i+cellsize)*250);
     strokeWeight(random(5,20));
    line(i,height + mySound.right.get(i)*100,i+cellsize,height + mySound.right.get(i+cellsize)*100);
    line(i,height-20 + mySound.right.get(i)*150,i+cellsize,height-20 + mySound.right.get(i+cellsize)*150);
    line(i,height-40 + mySound.right.get(i)*200,i+cellsize,height -40+ mySound.right.get(i+cellsize)*200);
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


