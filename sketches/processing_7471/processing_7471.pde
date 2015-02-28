
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;


Minim minim;
AudioOutput out;
SineWave sine;
PImage img; 


void setup(){
  size(500,332);
  img=loadImage("pic.jpg");

  minim = new Minim(this);
  out = minim.getLineOut(Minim.MONO, 1024);
 sine = new SineWave(440, 0.5, 44100);
  out.addSignal(sine);


  
}

void draw(){
   color c = img.get(mouseX, mouseY); 
// float f = c/-20000; 
// println(f); 
// sine.setFreq(f); 
  float b = brightness(c);
  float m = map (b, 0,255,50,600);
  image(img,0,0);
  stroke(255);
  sine.setFreq(m); 
         for(int i = 0; i < out.bufferSize() - 1; i++)
  {
    float x1 = map(i, 0, out.bufferSize(), 0, width);
    float x2 = map(i+1, 0, out.bufferSize(), 0, width);
    line(x1, 50 + out.left.get(i)*50, x2, 50 + out.left.get(i+1)*50);
    line(x1, 150 + out.right.get(i)*50, x2, 150 + out.right.get(i+1)*50);
  }
 } 

void stop()
{
  out.close();
  minim.stop();
  super.stop();
}

