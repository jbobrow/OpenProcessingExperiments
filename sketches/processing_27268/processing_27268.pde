
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

float WMD = 0;
float Nacho = 100;


float r = 100.0;
float angle = 0.0;
float speed = Nacho/350;

PImage Crystal;
PImage Swirl;
PImage Swirl2;
PImage Button;

Minim minim;
AudioOutput out;
SineWave sine;
  


Minim m;
AudioSample high;


void setup()
{
 smooth();
  size(500,500);
  
  imageMode(CENTER);


minim = new Minim(this);
  // get a line out from Minim, default bufferSize is 1024, default sample rate is 44100, bit depth is 16
  out = minim.getLineOut(Minim.STEREO);
  // create a sine wave Oscillator, set to 240 Hz, at 0.1 amplitude, sample rate from line out
  sine = new SineWave(240, 0.1, out.sampleRate());
  // set the portamento speed on the oscillator to 200 milliseconds
  sine.portamento(200);
  // add the oscillator to the line out
  out.addSignal(sine);
  
m = new Minim(this);
high = m.loadSample("1.mp3");

  
 

  
}

void draw()
{
  
  background(255);
  
  pushMatrix();
  translate(width/2, height/2);
   WMD = WMD+(Nacho/90);
    rotate(radians(WMD));
    
  Swirl = loadImage("Swirl.gif");
image(Swirl,0,0);



if (mousePressed == true) {Nacho=(mouseY/2.5);}

popMatrix();

pushMatrix();
  translate(width/2, height/2);
   WMD = WMD+(Nacho/90);
    rotate(radians(-WMD/2));
    
  Swirl2 = loadImage("Swirl2.png");
image(Swirl2,0,0);


popMatrix();

 angle += speed;
  float sinval = sin(angle);
  float hover = sinval * r;
Crystal = loadImage("crystal.png");
image(Crystal, 250, 250, 135+(hover/8)+Nacho, 135+(hover/8)+Nacho);


pushMatrix();



Button = loadImage("button.png");

 translate(width/2, height/2);

rotate(radians(-WMD)); 
image(Button,150,150, 70+(hover/8),70+(hover/8));




popMatrix();

  // with portamento on the frequency will change smoothly
  float freq = (hover*Nacho)/5;
  sine.setFreq(freq);
  // pan always changes smoothly to avoid crackles getting into the signal
  // note that we could call setPan on out, instead of on sine
  // this would sound the same, but the waveforms in out would not reflect the panning
  float pan = Nacho/hover;
  sine.setPan(pan);

//if(1>(100*sinval)>1){high.trigger();}

}




void stop()
{
 // high.close();
 // m.stop();
 
 out.close();
  minim.stop(); 
 
  super.stop();
}

 
 

