
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;         
AudioOutput out;    // create an output object
SineWave sine;      // create a sine wave object
//Audio values
float freq = 440;
float amp = 0.5;
float samples = 44100;
//drawing values
int cell=50;

void setup(){
  size(400,400);
  smooth();
  background(255);
  rectMode(CENTER);
  noStroke();
  frameRate(5);
  //output sound
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO, 512);
  sine = new SineWave(freq, amp, samples);
  out.addSignal(sine);
}

void draw(){
  //color2sound
  color myColor = get(mouseX, mouseY);
  float freq = map(int(floor(brightness(myColor))), 0, 255, 50, 600);
  sine.setFreq(freq);
  float amp = map(int(floor(saturation(myColor))), 0, 255,0.3, 2.00);
  sine.setAmp(amp);
  //visulaize
  for(int y=cell; y <= 399; y+=cell){
   for(int x=cell; x <= 399; x+=cell){
     color myFill = color(random(255),random(255),random(255),100);
     fill(myFill);
     ellipse(x,y,random(cell),random(cell));
    }
  }
}
//mute out
void keyPressed(){
  if ( key == 'm'|| key == 'M' ){
    if ( out.isMuted() ){
      out.unmute();
    }
    else{
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

