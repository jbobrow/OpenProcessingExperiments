


import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioPlayer mysound;
FFT fft;

PFont font;  
String str1 = "GIRL TALK"; 


void setup()
{
  size(512, 512, P3D);
  //textMode(SCREEN);
  font = loadFont("CenturyGothic-Bold-36.vlw");     // create a font object
  textFont(font);                         

  minim = new Minim(this);

  mysound = minim.loadFile("12 Here's The Thing.mp3", 1024);
  mysound.loop();

  fft = new FFT(mysound.bufferSize(), mysound.sampleRate());
}

void draw()
{
  background(0);
  noStroke();

  // perform a forward FFT on the samples in jingle's left buffer
  // note that if jingle were a MONO file, 
  // this would be the same as using jingle.right or jingle.left

  fft.forward(mysound.mix);

  for(int i = 0; i < fft.specSize(); i++)
  {

    for (float a = 0; a < TWO_PI; a+=0.1) {

      arc(256, 256, fft.getBand(i)*3.5, fft.getBand(i)*3.5, a, a+0.04);
    }

    fill(random(255),random(255),random(255),180);
  }

  fill(#ffff00, 180);
  rect(256,256,112,24);
  rectMode(CENTER);

  fill(random(255),random(255),random(255),240);
  text(str1, 256, 265);
  textSize(22);
  textAlign(CENTER);
}


void stop()
{
  mysound.close();
  minim.stop();

  super.stop();
}


