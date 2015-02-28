
import ddf.minim.*; 

Minim minim;     
AudioPlayer mySound;

void setup()
{
  size(500, 500);
  noStroke();
  minim = new Minim(this);    
  mySound = minim.loadFile("1.mp3"); 
  mySound.loop();

}
 
void draw()
{
  background(255);
  float leftLevel = mySound.left.level() * 1000; 
    float rightLevel = mySound.right.level() * 1000; 
  for(int countY=0;countY<height/50;countY++){
  for(int countX=0;countX<width/50;countX++){
       fill(random(200,255),random(200,255),100);
  ellipse(random(15,30)+(countX*50),random(20)+(countY*100),leftLevel/5,leftLevel/5);
       fill(100,random(100,255),random(150,200),100);
  ellipse(random(15,30)+(countX*50),random(20)+(countY*100),rightLevel,rightLevel);
   }
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





