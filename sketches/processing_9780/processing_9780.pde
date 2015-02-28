
/*
 Visualized Frequencies
 NOTE: move mouse up and down to alter the amplitude of the waveforms
 
 Final Project for INTERACTIVE SYSTEMS
 by Roland Obedin-Schwartz
 April-May, 2010.
 */

import ddf.minim.analysis.*;
import ddf.minim.*;

AudioInput song;
Minim minim;
FFT fft;


void setup ()
{
  size (1000, 700,P2D);
  minim = new Minim(this);
  song = minim.getLineIn(Minim.STEREO, 1024);//buffer size is 1024
  stroke(255, 255, 0, 24);
  strokeWeight(5);
  background (0);
  fft = new FFT(song.bufferSize(), song.sampleRate());//sample rate is 44100
}


void draw ()
{
  float n = (mouseY/3);//n determines the amplitude
  fill (0x0, 30);
  rect (0-20,0-20,width+50,height+50);
  stroke (0);
  noFill();
  fft.forward(song.mix);
  for (int i = 0; i < song.bufferSize(); i++)
  {
    stroke(i,i/3,1*3);//top line (ORANGE), frequency 1200
    ellipse (i, 100 + (fft.getBand(int(((1200)*(song.bufferSize()))/(song.sampleRate())))*n)*(song.left.get(i)),5,10);

    stroke (i/200,i/200,i*5);//second line (BLUE), frequency 1000
    ellipse (i*6, 200 + (fft.getBand(int(((1000)*(song.bufferSize()))/(song.sampleRate())))*n)*(song.left.get(i)),7,5);
    
    stroke(i,i/2000,i);//third line (PURPLE), frequency 800
    ellipse (i*3, 300 + (fft.getBand(int(((800)*(song.bufferSize()))/(song.sampleRate())))*n)*(song.left.get(i)),50,10);

    stroke(i,i,i);//fourth line (WHITE), frequency 600
    fill (random(255),random(255),random(255));//rainbow effect
    ellipse (i, 400 + (fft.getBand(int(((600)*(song.bufferSize()))/(song.sampleRate())))*n)*(song.left.get(i)), 10, 10);

    stroke (0,i,0); // fifth line (GREEN), frequency 400
    rect (i, 500 + (fft.getBand(int(((400)*(song.bufferSize()))/(song.sampleRate())))*n)*(song.left.get(i)),5,5);

    stroke (i,0,0);//sixth line (RED), frequency 200
    fill (random(255),random(255),random(255));//rainbow effect
    ellipse (i*2, 600 + (fft.getBand(int(((200)*(song.bufferSize()))/(song.sampleRate())))*n)*(song.left.get(i)),50,1);

    filter (ERODE*i);
  } 
}







