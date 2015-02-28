
import ddf.minim.analysis.*;
import ddf.minim.*;
 
Minim minim;
AudioPlayer jingle;
FFT fft;

PFont fontA;
 
void setup(){
  
  fontA = loadFont("AlBayan-12.vlw");
  textFont(fontA,10);
 
  minim = new Minim(this);
  jingle = minim.loadFile("Neon.mp3", 1024);
  jingle.play();
  
  fft = new FFT(jingle.bufferSize(), jingle.sampleRate());
  size(550,200);
  noStroke();
  frameRate(200);
  background(255);
  strokeWeight(1);
}
 
void draw(){
  background(0);
  
  
 
  stroke(255);
  fft.forward(jingle.mix);
  fill(255);
  noStroke();
 
 text("MOUSECRICK...STOP",5,15);
  
  translate(0,height/4);
  drawStandardSpectrum();
  drawReversedSpectrum();
  translate(0,height/4);
  
  translate(-width/2,0);
  drawReversedSpectrum();
  translate(width,0);
  drawStandardSpectrum();
  
  translate(-width/2,0);
  translate(0,height/4);
  drawStandardSpectrum();
  drawReversedSpectrum();
  
    

}
 
int getPeak(){
  int maximum=0;
  for(int i = 0; i < fft.specSize(); i++){
    if(fft.getBand(i)>fft.getBand(maximum)) maximum=i;
  }
  return maximum;
}
 
void drawStandardSpectrum(){
  for(int i = 0; i < fft.specSize(); i+=20){
    fill(random(150,255),map(i,0,fft.specSize(),0,255),random(255),150);
    stroke(random(120,255),map(i,0,fft.specSize(),255,120),random(255));{
      ellipse(i,0,fft.getBand(i),fft.getBand(i));
    }
  }
}
 
void drawReversedSpectrum(){
  for(int i = fft.specSize(); i > 0; i-=20){
    fill(random(150,255),map(i,0,fft.specSize(),0,255),random(255),150);
    stroke(random(120,255),map(i,0,fft.specSize(),255,0),random(255));{
      ellipse(width-i,0,fft.getBand(i),fft.getBand(i));
    }
  } 
}
 
void mousePressed(){
  if(jingle.isPlaying()) jingle.pause();
  else jingle.play();
}


void stop(){
  jingle.close();
  minim.stop();
  super.stop();
}


