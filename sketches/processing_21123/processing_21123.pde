
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioPlayer mySound;
SineWave sine;

void setup(){
  size(300,300);
  
  minim = new Minim(this);
  mySound = minim.loadFile("so happy together.mp3");
  mySound.play();
  
  //mySound = minim.getLineOut(Minim.STEREO, 512);
  
  sine = new SineWave(440, 0.5, mySound.sampleRate());
  //mySound.addSignal(sine); 
  mySound.mute();
  mySound.loop();
}

void draw(){
  background(0);
  
  for(int i=0; i < mySound.bufferSize() - 1; i++){
    //stroke(225,0,0);
    
    //line
   frameRate(3);
   noStroke();
    fill(203,145,18,20);
    ellipse(i, 50 + mySound.left.get(i)*300, i+1, 50 + mySound.mix.get(i+1)*300);
    
    //stroke(0);
    //fill(203,145,18,50);
    ellipse(i, 175 + mySound.right.get(i)*300, i+1, 175 + mySound.mix.get(i+1)*300);
   
   
   stroke(0); 
    fill(0,225,0,90);
    ellipse(i, 150 + mySound.right.get(i)*50, i+1, 150 + mySound.right.get(i+1)*50);
    
    fill(225,0,0,90);
    ellipse(i, 150 + mySound.left.get(i)*150, i+1, 150 + mySound.left.get(i+1)*150);  

   
    
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
  


