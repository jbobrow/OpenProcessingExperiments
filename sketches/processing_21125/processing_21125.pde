
import ddf.minim.*;
import ddf.minim.signals.*;

PImage myPic;

Minim minim;         
AudioOutput out;   
SineWave sine; 

int freq=500;
float amp = 0.6;
int samples=44100;

void setup(){
  size(400,400);
  myPic = loadImage("p_large_A5DP_436b0000e8d05c43.jpg");
  noStroke();
  smooth();
  rectMode(CORNER);
  minim = new Minim(this);
out = minim.getLineOut(Minim.STEREO, 512);
sine = new SineWave(freq, amp, samples);
out.addSignal(sine);
}

int cellSize = 40;

void draw(){

background(0);
  for(int y=0; y <= width; y+=cellSize){
    for(int x=0; x <= height; x+=cellSize){
      int a = floor(random(0,myPic.width));    
      int b = floor(random(0,myPic.height));   
      color myColor = myPic.get(a,b);        
      fill(myColor);       
      rect(x,y,random(0,2*cellSize),random(0,2*cellSize));     
    }
  }
 noLoop();
}
void mouseMoved(){
color myColor=get(mouseX,mouseY);
int freq = int(4*(brightness(myColor)));
 sine.setFreq(freq);
 //fill(myColor);
 //rect(mouseX,mouseY,3*cellSize,3*cellSize);

}
void keyPressed()
{
  if ( key == 'm' )
  {
    if ( out.isMuted() )
    {
      out.unmute();
    }
    else
    {
      out.mute();
    }
  }
}

void stop()
{
  out.close();
  minim.stop();

  super.stop();
}





