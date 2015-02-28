
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioPlayer mySound;

void setup(){
  size(600,600);
  
   minim = new Minim(this);                      
  mySound = minim.loadFile("baptism part.mp3");  
  mySound.loop();
  
}

void draw(){
  background(0);
  
    for(int i = 0; i < mySound.bufferSize() - 1; i++)  
  {
    noStroke();
    fill(random(255),random(255),random(255),4);
    ellipse(50,20,mySound.mix.get(i)*150,mySound.mix.get(i)*150);
    
    //Draws and Rotates Vizulizer Waves
    translate(150,0);
    rotate(PI/4);
    
     
    stroke(random(255),0,0,75);
    strokeWeight(i/25);
    line(i,-mySound.mix.get(i)*50,i+1,mySound.mix.get(i+1)*50);
    stroke(0,255,0,50);
    line(i,mySound.mix.get(i)*50,i+1,mySound.mix.get(i+1)*50);
    
    rotate(PI/6);
    
    stroke(0,random(255),0,75);
    line(i,-mySound.left.get(i)*50,i+1,mySound.left.get(i+1)*50); 
    stroke(0,0,255,75);
    line(i,mySound.left.get(i)*50,i+1,mySound.left.get(i+1)*50); 
    
    rotate(PI/3);
  
    
    stroke(0,0,random(255),75);
    line(i,-mySound.right.get(i)*50,i+1,mySound.right.get(i+1)*50); 
    stroke(255,0,0,75);
    line(i,mySound.right.get(i)*50,i+1,mySound.right.get(i+1)*50); 
    
   

}
  
}


  
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


