
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;         
AudioPlayer mySound; 

void setup(){
  size(600,600,P3D);

  minim = new Minim(this);
   mySound = minim.loadFile("07 Wake Up.mp3");
 mySound.play();                          
smooth();
 background(255); 
 colorMode(RGB, 50);
}

void draw()
{
 
  lights();
  camera(-200, 200,500,width/2+50,height/2+50,0,0,1,0);

  translate(width/2 + random(1,200), height/2 + random(1,200), -50);
 
  for(int i = 0; i < 1; i++)  
  { 
     fill((mySound.mix.get(i)*200),(mySound.left.get(i)*150),(mySound.right.get(i)*50),10);
    noStroke();
 
 box( mySound.mix.get(i)*300, mySound.left.get(i)*400, mySound.right.get(i)*500);

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


