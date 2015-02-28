
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;         
AudioOutput out;    // create an output object
SineWave sine;      // create a sine wave object

//******************************//
//** PLAY WITH THESE SETTINGS **//

float freq = 440;
float amp = 0.25;
float samples = 44100;

//******************************//


void setup(){
  size(300,299);
  
   PImage Space;
  Space = loadImage("Space.jpg");
  background(Space);
  fill(255,70);
  rect(0,0,width,height);

  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO, 512);    // make an output object, set the buffer to 512 samples
  sine = new SineWave(freq, amp, samples);  	// start the sine wave with this default tone
  out.addSignal(sine);                          // add the wave to the output object so we can hear it

}



void draw(){
  
  color myColor = get(mouseX, mouseY);
 
  float freq = map(int(floor(brightness(myColor))), 0, 255, 100, 1000);
  sine.setFreq(freq);
  float amp = map(int(floor(saturation(myColor))), 0, 255, .15, 2.00);
  sine.setAmp(amp);

}

// here we provide a way to mute out
void keyPressed(){
  if ( key == 'm' ){
    if ( out.isMuted() ){
      out.unmute();
    } else {
      out.mute();
    }
  }
}

void stop(){
  out.close();
  minim.stop();

  super.stop();
}


