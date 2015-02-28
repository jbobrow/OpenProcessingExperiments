
import ddf.minim.*;
import ddf.minim.signals.*;
Minim minim;
AudioPlayer mySound;
 
void setup(){
  size(400, 400,P3D);
  noStroke();
  rectMode(CENTER);
  minim = new Minim(this);
  mySound = minim.loadFile("Scalliwag.wav");
  mySound.loop();
}
int n=0;
void draw(){
  background(0);
  translate(width/3,height/3);
  for(int i = 0; i < mySound.bufferSize() - 1; i++)  {
    rotateX(n*-PI/3*0.5);
    //rotateY(n*-PI/3*0.2);
    fill(233,50,39,150);
    float leftLevel = mySound.left.level() * 100;
    ellipse(0,10*leftLevel,30,60);
    ellipse(0,10*leftLevel,10,20);
    rotateZ(n*-PI/3*0.2);
    fill(255,150);
    float rightLevel = mySound.right.level() * 100;
    ellipse(0,10*rightLevel,20,40);
    ellipse(0,10*rightLevel,10,20);
  }
  n++;
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
 
void stop(){
  mySound.close();
  minim.stop();
  super.stop();
}


