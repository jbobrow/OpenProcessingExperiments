
import ddf.minim.*;
import ddf.minim.signals.*;

import processing.dxf.*;	
boolean record = false;	

Minim minim;
AudioPlayer mySound;


PImage img;
int[] brightX;
int[] brightY;


void setup(){
  size(400,400,P3D);
  
  minim = new Minim(this);
  mySound = minim.loadFile("so happy together.mp3");
  mySound.play();
  mySound.mute();
  mySound.loop();
  
  
  img = loadImage("leonid-afremov-amsterdam5.jpg");
  img.loadPixels();
  
  brightX = new int[img.width];
  brightY = new int[img.height];
  
  for(int y=0; y<img.height;y++){
    for(int x=0; x<img.width; x++){
       color col = img.get(x,y);
       brightX[x]= floor(random(brightness(col)));
       brightY[y]= floor(random(brightness(col)));
    }
  }
} 
 

void draw(){
  if(record == true){	
    beginRaw(DXF,"output.dxf");
  }
  
  background(0);
  lights();
  
  //frameRate(3);
  
  camera(width*2, height*2, 2000, width/2, height, -200,0,1,0);
  translate(width/2,height/2,-200);
  rotateX(frameCount* PI/2* 0.005);
  
  float leftLevel = mySound.left.level() * 1000;
  float rightLevel = mySound.right.level() * 1000;
  
  for(int x=0; x < img.width; x++){ 
    for(int y=0; y< img.height; y++){
      color col = img.get(x,y);
      stroke(col);
      
      point(x,y+leftLevel,-brightX[x]+brightY[y]+leftLevel);
      
      rotateY(frameCount* PI/2* 0.005);
      point(x,y+rightLevel,-brightX[x]+brightY[y]+rightLevel);
       
  }
  }

if(record == true){	
  endRaw();	
  record = false;	
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

 if(key=='R'	|| key=='r'){	
      record = true;	
    }	
}



void stop()
{
  mySound.close(); 
  minim.stop();
  super.stop(); 
}

 
	

  	






