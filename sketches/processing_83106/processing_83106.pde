

import ddf.minim.signals.*;
import ddf.minim.*;
Minim minim;
AudioOutput out;
SineWave sine;

void setup(){
  
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
  sine = new SineWave(440,0.5, out.sampleRate());
  sine.portamento(20);
  out.addSignal(sine);
  size(400,300);
  colorMode(RGB,255);
  background(255);
 smooth();
 strokeWeight(0.3);
 stroke(255,0,120);



}

void draw(){
 
}


void mouseMoved(){
for(int i = 0; i<300; i++){
  rect(mouseX+i,mouseY*i,0.1,0.1);
  rect(mouseX*i,mouseY+i,0.1,0.1);


  float freq =map(mouseY,0,height,1500,60);
  sine.setFreq(freq);
  float pan =map(mouseX, 0, width, -1,1);
  sine.setPan(pan);
  color(255,0,120);
}
}
void mousePressed(){
  background(255);
}

void stop() {
  out.close();
  minim.stop();
  
  super.stop();
}






