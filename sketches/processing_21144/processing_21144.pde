
import ddf.minim.*;
import ddf.minim.signals.*;

PImage img;

Minim minim;         
AudioOutput out;    
SineWave sine;    


float freq = 440;
float amp = 0.5;
float samples = 20100;


void setup(){
  size(300,300);

// Audio Setup
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO, 512);   
  sine = new SineWave(freq, amp, samples);  	
  out.addSignal(sine);                         

//Image Setup
img = loadImage("Deadmau5 2.jpg");
set(0,0,img);  
}



void draw(){

set(0,0,img);  
  

color myColorX = img.get(mouseX,0);
color myColorY = img.get(0,mouseY);
  
freq = map(myColorX,0,255,0,1200); 
samples = map(myColorY,0,255,0,200000);
sine.setFreq(freq); 
sine.setFreq(samples);
}
  

void mouseDragged(){
  amp ++;
  
  if (amp > 1){
    amp = 0.5;
  }
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


