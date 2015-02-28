
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;         
AudioPlayer mySound;

void setup(){
  size(500,500);
  rectMode(CENTER);
  noStroke();
  minim = new Minim(this);                     
  mySound = minim.loadFile("you are my eyes.mp3"); 
  mySound.play();
}
void draw()
{
  background(255); 
  
  for(int i = 0; i < mySound.bufferSize() - 1; i+=5)  
  {
      fill(random(150,255),random(150,255),90,30);
    rect(i,250,25,250 + mySound.right.get(i)*150);
      fill(random(150,255),random(150,255),90,50);
    rect(i,250,15,250 + mySound.right.get(i)*120);
      fill(random(150,255),random(150,255),90);
    rect(i,250,5,150 + mySound.right.get(i)*100);
      fill(random(150,255),random(150,255),90,90);
    ellipse(i*2,random(10,100),mySound.right.get(i)*50,mySound.right.get(i)*50);
    ellipse(i*2,random(400,490),mySound.right.get(i)*50,mySound.right.get(i)*50);
      fill(random(150,255),random(150,255),90,90);
    ellipse(i*2,random(10,100),mySound.right.get(i)*30,mySound.right.get(i)*30);
    ellipse(i*2,random(400,490),mySound.right.get(i)*30,mySound.right.get(i)*30);
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

