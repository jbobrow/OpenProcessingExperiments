
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;         
AudioPlayer mySound; 

void setup(){
  size(600,600,P3D);

  minim = new Minim(this);
   mySound = minim.loadFile("13 We Used To Wait.mp3");
 mySound.play();                          
smooth();
 background(255); 
 colorMode(RGB, 50);
 frameRate(30);
}

void draw()
{
  int x = 0;
  float R = mySound.left.level() * 200;
  float G = mySound.mix.level() * 200;
  float B = mySound.right.level() * 200;
  lights();
  camera(500, 200,500,width/2-75,height/2+50,0,0,1,0);
x++;
  translate(width/2 + R, height/2 + B, -50+(x*10));
 
  for(int i = 0; i < 1; i++)  
  { 
   
    noStroke();
    fill((mySound.left.get(i)*200),(mySound.left.get(i)*250),(mySound.left.get(i)*100),10);
    noStroke();
 
box( B*2, G*2, B*2);

translate(-400,0,0);
fill(50,(mySound.left.get(i)*200),0,10);
box( R*2, G*2, R*2);

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


