
import ddf.minim.*;
import ddf.minim.signals.*;
Minim minim;
AudioPlayer mySound;

void setup(){
  size(400, 400,P3D);
  noStroke();
  rectMode(CENTER);
  minim = new Minim(this);
  mySound = minim.loadFile("UrBeautiful.mp3");
  mySound.play();
}
int n=0;
void draw(){
  background(10,180,155);
  translate(width/2,height/2);
  for(int i = 0; i < mySound.bufferSize() - 1; i++)  {
    rotateX(n*-PI/3*0.05);
    //rotateY(n*-PI/3*0.05);
    fill(255,150);
    float leftLevel = mySound.left.level() * 100; 
    ellipse(i,i,leftLevel,leftLevel);
    rotateZ(n*-PI/3*0.05);
    fill(0,150);
    float rightLevel = mySound.right.level() * 100; 
    rect(i,i,rightLevel,rightLevel);
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

