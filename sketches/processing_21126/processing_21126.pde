
import ddf.minim.*;
import ddf.minim.signals.*;
 
Minim minim;        
AudioOutput out;    
SineWave sine;      

float freq = 440;
float amp = 0.25;
float samples = 44100;
void setup(){
  size(400,400,P3D);
  background(255);
  noStroke();
  frameRate(5);
  //output sound
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO, 512);
  sine = new SineWave(freq, amp, samples);
  out.addSignal(sine);
  rectMode(CENTER);
}
 
void draw(){
  color Color = get(mouseX, mouseY);
  float freq = map(brightness(Color), 0, 255, 50, 600);
  sine.setFreq(freq);
float amp = map(saturation(Color), 0, 255,0.6, 4.00);
sine.setAmp(amp);
 
  fill(254,255,0,60);
ellipse(random(0,width),random(0,height),60,60);
  
  fill(255,0,166,60);
ellipse(random(0,width),random(0,height),60,60);
  
  fill(24,0,255,60);
ellipse(random(0,width),random(0,height),60,60);
}
 
//mute out
void keyPressed(){
  if ( key == 'm' ){
    if ( out.isMuted() ){
      out.unmute();
    }
    else{
      out.mute();
    }
  }
}
 



