
// Learning basic interactivity. Sound and image with Minim

import ddf.minim.*;
import ddf.minim.signals.*;
Minim minim;
AudioOutput out;
SineWave sine;
PulseWave pul;
PImage img;

void setup() {
  minim = new Minim(this);
  out = minim.getLineOut(Minim.MONO,2048);
  
  sine = new SineWave(440,0.2,out.sampleRate());
  //sine.portamento(50); // Try to activate it...
  out.addSignal(sine);
  
  pul = new PulseWave(220,0.3,out.sampleRate());
  pul.portamento(200);
  out.addSignal(pul);
  
  cursor(CROSS);
  frameRate(1000);
  img = loadImage("cerezos.jpg");
  background(255);
  smooth();
  size(900,673);
}

void draw() { 
  int x1 = int(random(width));
  int y1 = int(random(height));
  
if (mousePressed == true){
  
  color pix2 = img.get(mouseX,mouseY);
  // "pul" changes with de colors
  pul.setFreq(pix2);
  
  stroke(pix2,100);
  line(x1,y1,mouseX,mouseY);
  
  // "sine" changes with de line length
  float frec = dist(x1,y1,mouseX,mouseY);
  sine.setFreq(frec-200);
}else if(mousePressed == false){
  // The same for "sine" and "pul"
  int x2 = int(random(mouseX-30,mouseX+30));
  int y2 = int(random(mouseY-30,mouseY+30));
  constrain(x2,0,width);
  constrain(y2,0,height);
  color pix2 = img.get(x2,y2);
  pul.setFreq(pix2);
  stroke(pix2,100);
  line(x1,y1,x2,y2);
  float frec = dist(x1,y1,x2,y2);
  sine.setFreq(frec-200);
}
}

void stop(){
  out.close();
  minim.stop();
  super.stop();
}



