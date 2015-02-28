
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;
final int CAMERA_DISTANCE = 900;

PeasyCam cam;


import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;         
AudioPlayer mySound; 

void setup(){
  size(800,800,P3D);

  minim = new Minim(this);
   mySound = minim.loadFile("Piece of Paper - Amon Tobin.mp3");
 mySound.play();                          
smooth();
 background(29,29,29); 
 colorMode(RGB,50);
 cam= new PeasyCam(this, width-320, height-200 , 500, CAMERA_DISTANCE);


}

void draw()
{
 
  lights();
 
  translate(width/2 + random(1,200), height/2 + random(1,200), -50);
 
  for(int i = 0; i < 1; i++)  
  { 
     fill((mySound.mix.get(i)*200),(mySound.left.get(i)*50),(mySound.right.get(i)*50),10);
    noStroke();
 
 box( mySound.mix.get(i)*300, mySound.left.get(i)*300, mySound.right.get(i)*300);

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


