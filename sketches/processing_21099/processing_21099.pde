
//Adam Oaks

import ddf.minim.*;
import ddf.minim.signals.*;

PImage myPic;

Minim minim;         
AudioOutput out;    // create an output object
SineWave sine;      // create an sine wave object

void setup() {
  size(600,450);
  myPic = loadImage("singapore.jpg");
  noStroke();
  smooth();


  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO, 512);

  // start the sine wave with this default tone
  sine = new SineWave(440, 0.5, out.sampleRate());

  // add the wave to the output object so we can hear it
  out.addSignal(sine);                              

  // mute the sound by default 
  out.mute();
}

int cell = 20;

void draw() {

  background(0);


  for(int y=cell; y <= 449; y+=cell) {    
    for(int x=cell; x <= 599; x+=cell) {

      color myColor = myPic.get(x,y);
      fill(myColor);
      float radius = cell * (brightness(myPic.pixels[x + (y * 600)]) / 255);
      ellipse(x,y,radius,radius);
    }
  }
  int myCell = get(mouseX, mouseY);
  float freq = map(int(floor(brightness(myCell))), 0, 255, 0,600);
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


