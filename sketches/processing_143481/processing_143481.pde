
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: CHOI Seung-hwan
// ID: 201420112

import ddf.minim.*;
 
Minim minim;
AudioInput in;
float volume = 0;
float volumeF = 0;
 
void setupAudio(){
minim = new Minim(this);
in = minim.getLineIn(Minim.MONO, 512);
}
 
void getVolume(){
volumeF = in.right.level()*150;
volume = 0.8*volume + 0.8*volumeF;
}
 
void stop(){
in.close();
minim.stop();
super.stop();
}

float P = 0;

void setup() {

  size(600,600);
  setupAudio();
  smooth();
  frameRate(50);
  }

void draw() {
  background(0);
  
  translate(width/2,height/2);
  
  getVolume();    
  float X = map(volume, 0, 0.01, 0.3, 0.45);
  
  for(float i=0; i<TWO_PI; i+=0.3) {
    strokeWeight(2);
    stroke(255);
    pushMatrix();
    rotate(P+i);
    line(0,0,X+150,0);
    
    for(float j=0; j<TWO_PI; j+=X+0.2) {
      pushMatrix();
      translate(X+150,0);
      rotate(P-j);
      line(0,0,X+120,0);
      
      popMatrix();
    }
    
    popMatrix();
  }
  
  P+=0.038;
  }

void keyPressed() {
  noLoop();
}
void keyReleased() {
  loop();
}

