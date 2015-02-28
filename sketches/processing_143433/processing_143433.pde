
// Konkuk University  
// Department of Dynamic Media  
// SOS iDesign  
// Name: KIM Youngji  
// ID: 201420069 

import ddf.minim.*;

Minim minim;
AudioInput in;
float volume = 0;
float volumeF = 0;

//-------------------------------------
void setupAudio() {
  minim = new Minim(this);
  in = minim.getLineIn(Minim.MONO, 512);
}
//-------------------------------------
void getVolume() {
  volumeF = in.right.level()*1000;
  volume = 0.8*volume + 0.8*volumeF;
}
//-------------------------------------
void stop() {
  in.close();
  minim.stop();
  super.stop();
}

float angle;  
void setup() {  
  setupAudio();
  size (600, 600);  
  smooth();
}  

void draw() { 
  getVolume(); 
  float X = map(volume, 0, 1, 0, 1);
  noStroke(); 
  fill(0, 30); 
  rect(0, 0, width, height); 
  angle = 0.01*X;
  translate(width/2, height/2); 
  rotate(angle); 
  strokeWeight(10); 
  fill(255, 0, 0); 
  triangle(0, 0, 0, -250, 100, -125);  
  triangle(0, 0, 250, 0, 125, 100);   
  triangle(0, 0, 0, 250, -100, 125);  
  triangle(0, 0, -250, 0, -125, -100);
}  


