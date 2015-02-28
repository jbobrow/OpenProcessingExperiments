

import ddf.minim.*; 

Minim minim;     
AudioPlayer mySound;

void setup()
{
  size(400, 400, P3D);
 camera(150,100,100,width/2,height/2,0,0,1,0);
  minim = new Minim(this);    
  mySound = minim.loadFile("groove.mp3"); 
  mySound.loop();
  
  rectMode(CORNERS); 
}
 
void draw()
{
  


  fill (0, 5);
rect (-1000, -1000, 10000, 10000);


  

  noStroke();
  translate(width/2, height/2, 0);
  
  rotateX(frameCount*.05);
  
  fill(255,0,255,20);
  float leftLevel = mySound.left.level() * 1000;  
  box(leftLevel ,leftLevel, leftLevel );
  
   fill(0,0,255,20);
  float rightLevel = mySound.right.level() * 1000;  
  box(rightLevel ,rightLevel, rightLevel );


  
  

}



void stop()
{
  mySound.close(); 
  minim.stop();
  super.stop(); 
}





