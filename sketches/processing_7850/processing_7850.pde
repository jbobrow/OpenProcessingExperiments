
import ddf.minim.analysis.*;
import ddf.minim.*;
import processing.video.*;

// Variable for capture device
Capture video;
// Previous Frame
PImage prevFrame;

// How different must a pixel be to be a "motion" pixel
float threshold = 50;

Minim minim;
AudioPlayer jingle;
FFT fft;


void setup() 
{
  size(640, 640);
  strokeWeight(1);
   smooth();
  background(255);
    // Using the default capture device
  //video = new Capture(this, 640, 640, 15);
  // Create an empty image the same size as the video
 // prevFrame = createImage(video.width,video.height,RGB);
  
    minim = new Minim(this);
  
  jingle = minim.loadFile("Money.mp3", 1024);
  jingle.loop();

  fft = new FFT(jingle.bufferSize(), jingle.sampleRate());

  fft.linAverages(128);
  rectMode(CORNERS);
  
}
int r = 0;
int v = 0;
int b = 0;
int l = 100;
void draw() 
{
  
   
  fft.forward(jingle.mix);
  int w = int(fft.specSize()/64);
  for(int i = 0; i < fft.avgSize(); i++)
  {
    stroke(fft.getAvg(i)*50, 0, r, 225);
    ellipse( height - fft.getAvg(w)*50-height/2, height - fft.getAvg(i)*50+64, i, i);
    ellipse( height + fft.getAvg(w)*50-height/2, height - fft.getAvg(i)*50+64, i, i);
    noFill();
    smooth();
    }



}

void stop()
{

}



