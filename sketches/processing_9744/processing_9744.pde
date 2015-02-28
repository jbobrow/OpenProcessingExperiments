

import ddf.minim.*;
import ddf.minim.signals.*;

AudioPlayer player;
Minim minim;
float      lastAmp = 0;
Myface[] face = new Myface[150];

void setup() {
  size(400, 400);
  smooth();
  minim = new Minim(this);
  
  for(int i=0; i<face.length; i++){
      face[i] = new Myface(random(width), random(height), 35, 35, 10);
  }

   player = minim.loadFile("20100419.mp3", 2048);
  
   
   
}


  
void draw() {
  background(255);
  float amp = player.left.level()*5;
  if (amp > lastAmp) lastAmp = amp;


  for(int i=0; i<face.length;i++) {
    face[i].display(lastAmp);
  
    face[i].jiggle();
  }
     lastAmp *= 0.95;
}


void stop() {
  player.close();
  minim.stop();
  super.stop();
}


void keyPressed() {
    
   if (key == 's')
     player.play();
   
    


}

class Myface {
  float x,y,w,h,eye;
 
  
   Myface(float tempX, float tempY, float tempW, float tempH, float eyesize){
     x = tempX;
     y = tempY;
     w = tempW;
     h = tempH;
     eye = eyesize;
    }
   
  
   void jiggle(){
     x= x+random(-0.5,0.5);
     y= y+random(-0.5,0.5);
     
     x = constrain(x,0,width);
     y = constrain(y,0, height);
   }
   
void display(float lastAmp) {
  ellipseMode(CENTER);
  
  
  
  stroke(0);
  fill(255);
  
  ellipse(x, y-h, w, h);
  fill(0);
  ellipse(x-w/3, y-h,eye*lastAmp+0.4, eye*lastAmp);
  ellipse(x+w/3, y-h,eye*lastAmp+0.4, eye*lastAmp);
  line(x-5,y-25,x+5,y-25);
   

}



}

