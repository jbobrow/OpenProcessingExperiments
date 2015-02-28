
import ddf.minim.*;
import ddf.minim.signals.*;




Minim minim;
AudioPlayer mySound;

void setup(){
  size(600,600,P3D);
  
   minim = new Minim(this);                      
  mySound = minim.loadFile("triple x part.mp3");  
  mySound.loop();
  
  
  colorMode(HSB,100);

  
}

int x = 0;
int y = 0;
int z = 0;

void draw(){
   rectMode(CORNERS);
   fill(0,15);
   rect(0,0,width,height);
   lights();
   noStroke();

  
      float leftLevel = mySound.left.level()*500;
      float rightLevel = mySound.right.level()*500;
    
   translate(width/2,height/2); 
   
   fill(rightLevel/2,100,leftLevel/2,50);
   sphere(leftLevel/2); 
   
      for(int i = 0; i < mySound.bufferSize() - 1; i++)  
  {
    
   rotate(PI/3+i*5);
    
   stroke(100,10);
   strokeWeight(rightLevel);
   line(i,-mySound.left.get(i)*50,i+1,mySound.left.get(i+1)*50);
   noStroke();
  
  }
    
    if (mySound.right.level() > 0.35){
      rotate(PI/5 +rightLevel);
      translate(width/4,height/4);
      
  
        fill(rightLevel/2,100,leftLevel/2,50);
        sphere(rightLevel/4); 
   
}}


  
void keyPressed(){
  
 if ( key =='i'){
  filter(INVERT);
  
 } 
  if ( key == 'm' ){
    if (mySound.isMuted()){
      mySound.unmute();
}
    else{
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


