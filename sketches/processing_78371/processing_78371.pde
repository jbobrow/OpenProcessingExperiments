
PImage space; 

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer song;
FFT fft;
 
 
 
void setup()
{
  space = loadImage("ble.jpg");
  size(800, 800);
  smooth();
  minim = new Minim(this);
  song = minim.loadFile("01 Helena Beat.mp3", 512);
  song.play();
  fft = new FFT(song.bufferSize(), song.sampleRate());

}
 
void draw()
{
    smooth();
  background(space); 
  stroke(255,15);
  strokeWeight(10);
  noFill();
  for (int i = 0; i < song.bufferSize() - 1; i++)
  {
    ellipse(width/2, height/2, song.left.get(i)*1000, song.left.get(i)*1000);

  }
  
  stroke(77, 77, 255,5);
  strokeWeight(3);
  noFill();
  for (int i = 0; i < song.bufferSize() - 1; i++)
  {
    ellipse(width/2, height/2, song.left.get(i)*1000, song.left.get(i)*400);
  }
  stroke(200, 37, 54,5);
  strokeWeight(1);
  noFill();
  for (int i = 0; i < song.bufferSize() - 2; i++)
  {
    ellipse(width/2, height/2, song.left.get(i)*4000, song.left.get(i)*2000);

  }
}
 
void stop()
{
  song.close();
  minim.stop();
  super.stop();
}


