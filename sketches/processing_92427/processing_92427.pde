
/**
 * CP1919
 * SAY HI TO JOY DIVISION
 *
 * ----------------------------------------------------------------------------
 * "THE BEER-WARE LICENSE" (Revision 42):
 * <xiatwo@gmail.com> wrote this file. As long as you retain this notice you
 * can do whatever you want with this stuff. If we meet some day, and you think
 * this stuff is worth it, you can buy me a beer in return Dongzhi Xia
 * ----------------------------------------------------------------------------
 */

import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioPlayer music;
WaveformRenderer fft;

void setup()
{
  size(800, 650);
  frameRate(30);
  smooth();
  minim = new Minim(this);
  
  music = minim.loadFile("Intro.mp3", 1024); 
  music.loop();
  
  fft = new WaveformRenderer();
  music.addListener(fft);
}

void draw()
{
  background(0); 
  fft.draw();
}

void stop()
{
  // always close Minim audio classes when you are done with them
  music.close();
  // always stop Minim before exiting.
  minim.stop();
  super.stop();
}



