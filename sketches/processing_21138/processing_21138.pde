
import ddf.minim.*;
import ddf.minim.signals.*;
 
Minim minim;        
AudioOutput out;    // create an output object
SineWave sine;     // create a sine wave object

PImage img;

//Audio values
float freq = 440;
float amp = 0.25;
float samples = 44100;

//drawing values
int cell=50;
int n=0;
 
void setup(){
  size(700,524);
  img = loadImage("DSCN3554b.jpg");
  background(255);
  noStroke();
  frameRate(75);
 
  //output sound
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO, 512);
  sine = new SineWave(freq, amp, samples);
  out.addSignal(sine);
}

void draw(){
  
  color myColorA = get(mouseX, mouseY);
  float freq = map(int(floor(hue(myColorA))), 0, 255, 100, 700);
  sine.setFreq(freq);
  float amp = map(int(floor(saturation(myColorA))), 0, 255,0.15, 2.00);
  sine.setAmp(amp);
 
  int x = floor(random(0,img.width));
  int y = floor(random(0,img.height));
    
  color myColorB = img.get(x,y);
  fill(myColorB);
  ellipse(x,y,cell,cell);
}

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
 
void stop()
{
  out.close();
  minim.stop();
   
  super.stop();
}


