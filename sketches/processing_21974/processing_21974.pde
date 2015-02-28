

import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioPlayer mySound;
void setup(){
  size(400, 400,P3D);
  noStroke();
  camera(250,150,400,200,200,-100,0,-1,0);
  minim = new Minim(this);
  mySound = minim.loadFile("man enough2.mp3");
  mySound.loop();
}
int n=0;
void draw(){
  background(0);

    translate(width/2,height/2);
    for(float i = 0; i < mySound.bufferSize() - 1; i+=0.6)  {
    
    float leftLevel = mySound.left.level() * 100;
    float rightLevel = mySound.right.level() * 100;
    float mixLevel = mySound.mix.level() * 100;
    rotateX(n*-PI/3*0.5);
    fill(153,190,239,random(100,200));
    ellipse(5*leftLevel,5*leftLevel,4*leftLevel,4*leftLevel);

    rotateZ(n*-PI/3*0.1);
    translate(width/10,height/10);
    fill(255,random(100,200));
    ellipse(5*rightLevel,5*rightLevel,4*rightLevel,4*rightLevel);

    rotateZ(n*-PI/3*0.1);
    translate(width/10,height/10);
    fill(233,50,39,random(100,200));
    ellipse(5*mixLevel,5*mixLevel,4*mixLevel,4*mixLevel);
  }
  n++;
}
 
void stop(){
  mySound.close();
  minim.stop();
  super.stop();
}
 
//mute out
void keyPressed(){
  if ( key == 'm'|| key == 'M' ){
    if ( mySound.isMuted() ){
      mySound.unmute();
    }
else{
    mySound.mute();
  }

  }
}


