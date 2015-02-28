
/////////////////////////////////////////////////////////////////
/////////////       By Chirs Pitt - 01/05/2011      ///////////// 
/////////////////////////////////////////////////////////////////

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioOutput out;
SineWave sine;

float distanceFrequency;
float distanceRotate;

void setup(){
  frameRate(40);
  noCursor();
  size(500, 500);
  smooth(); 

  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
  sine = new SineWave(440, 0.3, out.sampleRate());
  sine.portamento(200);
  out.addSignal(sine);
}

void renderTriangle(){
  stroke(#C9AB00);
  fill(#C9AB00, 100);
  triangle(0, 0, 15, 75, 120, 152);
}

void draw() {
  noStroke();
  fill(0, 10);
  rect(0, 0, width, height);
  
  float mouseSpeed = dist (pmouseX, pmouseY, mouseX, mouseY)*3;
  float freq = map(500, -200, 600, distanceFrequency, 300);
  sine.setFreq(freq + mouseSpeed);
  float pan = map(mouseX, 0, width, -0.6, 0.6);
  sine.setPan(pan);
  
  while(mouseX==0 && mouseY==0){
    mouseX=width/2;
    mouseY=height/2;
  }
  distanceFrequency = dist(width/2, height/2, mouseX, mouseY) * 2 + 50;
  distanceRotate = dist(width/2, height/2, mouseX, mouseY)/250 + 0.1 + distanceRotate;
  translate(mouseX, mouseY);
  rotate(distanceRotate);
  renderTriangle();
}

void stop()
{
  out.close();
  minim.stop();
  super.stop();
}

