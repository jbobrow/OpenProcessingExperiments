
//Adam Oaks

import ddf.minim.*; 

Minim minim;     
AudioPlayer mySound;

void setup()
{
  size(600, 400, P3D);
    lights();
  noStroke();

 
  minim = new Minim(this);    
  mySound = minim.loadFile("farmer.mp3"); 
  mySound.loop();
  mySound.mute();
  

}
 
void draw()
{
  background(255);
  
 
  fill(mySound.right.level()*1000,200,40,120);

pushMatrix();
  translate(width/2-100,height/2); 
  box(mySound.left.level()*600,mySound.left.level()*600,mySound.left.level()*600);
  popMatrix();
  
  pushMatrix();
  translate(width/2+100,height/2); 
  box(mySound.right.level()*600,mySound.right.level()*600,mySound.right.level()*600);
  popMatrix();
  
  pushMatrix();
  translate(width/2,height/2 + random(-(mySound.mix.level()*150),mySound.mix.level()*150)); 
  box(mySound.mix.level()*600,mySound.mix.level()*600,mySound.mix.level()*600);
popMatrix();
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





