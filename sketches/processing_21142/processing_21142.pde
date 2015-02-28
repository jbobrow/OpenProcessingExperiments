
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;        
AudioOutput out;    // create an output source
SineWave sine;      // create a sine wave source


PImage headPhones;

void setup(){
size(350,500);
headPhones=loadImage("headphones.jpg");
noStroke();
smooth();

minim = new Minim(this);
out = minim.getLineOut(Minim.STEREO, 460);

// start the sine wave with this default tone
  sine = new SineWave(440, 0.5, out.sampleRate());
 
  // add the wave to the output object so we can hear it
  out.addSignal(sine);                             
 
  // mute the sound by default
  out.mute();

}

int cell = 17;

void draw() {
  
  background(0);
  
  for(int y=cell; y<=499; y+=cell) {
    for(int x=cell; x <= 499; x+=cell) {
      

color myColor = headPhones.get(x,y);
fill(myColor);

rect(x,y,height,height);
    }
  }
  
  int myCell = get(mouseX, mouseY);
  float freq = map(int(floor(brightness(myCell))), 0, 200, 0,250);
  sine.setFreq(freq);
}

// here we provide a way to mute out
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

 


    


