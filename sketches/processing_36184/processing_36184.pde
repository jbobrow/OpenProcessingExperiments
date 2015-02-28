
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;
SineWave sine;

int[] xpos = new int[50];
int[] ypos = new int[50];

void setup(){
  size(500,500);
  smooth();
  
  for (int i =0; i < xpos.length; i++){
    xpos[i] =0;
    ypos[i] =0;
  }
  
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
  sine = new SineWave(440, 0.5, out.sampleRate());
  sine.portamento(200);
  out.addSignal(sine);
}

void draw(){
  background(0);
  
  for (int i = 0; i< xpos.length-1; i++){
    xpos[i] = xpos[i+1];
    ypos[i] = ypos[i+1];
}
 xpos[xpos.length-1] = mouseX;
 ypos[ypos.length-1] = mouseY;
 
 for (int i=0; i< xpos.length; i++){
   noStroke();
   float r = random(105);
   fill((150 + r),(100 + r),(150 + r-i*5));
   ellipse(xpos[i],ypos[i],i,i);
 }
}

void mouseMoved(){
  float freq = map(mouseY,0,height,1500,60);
  sine.setFreq(freq);
  float pan = map(mouseX,0,height,-1,1);
  sine.setPan(pan);
}

void stop(){
  out.close();
  minim.stop();
  super.stop();
}

