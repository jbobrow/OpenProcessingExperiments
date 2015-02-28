
import ddf.minim.*;
import ddf.minim.signals.*;
Minim minim;
AudioPlayer mySound;
 
void setup(){
  size(300, 300,P3D);
  noStroke();
  rectMode(CENTER);
  minim = new Minim(this);
  mySound = minim.loadFile("10 Inga.mp3");
  mySound.play();
}
int n=0;
void draw(){
  background(0);
  translate(width/2,height/8);
  for(int i = 0; i < mySound.bufferSize() - 1; i++)  {
    rotateX(n*-PI/6*0.001);
    rotateY(n*-PI/6*0.001);
    rotateZ(n*-PI/6*0.001);
    fill(random(255),random(255),random(255));
    ellipse(i,i,mySound.left.get(i)*50,mySound.left.get(i)*50);
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


