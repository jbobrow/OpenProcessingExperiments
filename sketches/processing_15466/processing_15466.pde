
//This program makes fractal images based on sound

import ddf.minim.*; // import the minim sound library in Processing
import ddf.minim.analysis.*;
FFT fft;
int highest=0;

Minim bob; // declare Minim variable called bob
AudioPlayer sue; // declare AudioPlayer called sue
int buffer = 1024; // buffer size in samples for file playback
float volume = 0;

void setup() {
  size(800,800);
  background(0);
  smooth();
  bob = new Minim(this); // create a Minim object
  sue = bob.loadFile("Song2.mp3", buffer); // load a file to buffer
  fft = new FFT(sue.left.size(), 44100);
}


void form(float x,float y, float a, float c) {
  float nx=x+volume*cos(a);
  float ny=y+volume*sin(a);
  stroke((255-(2*fft.getBand(highest))),2*fft.getBand(highest),fft.getBand(highest), random(50,75));
  line(x,y,nx,ny);
  if (c>0) {
//    println("on");
    form(nx,ny,a+mouseX,c-1);
    form(nx,ny,a+mouseY,c-1);
  }
}

void draw() {
   fft.forward(sue.left);
 highest=0;
 for(int n = 0; n < fft.specSize(); n++) {
   // draw the line for frequency band n, scaling it by 4 so we can see it a bit better
   line(n, height, n, height - fft.getBand(n)*4);
   
   //find frequency with highest amplitude
   if (fft.getBand(n)>fft.getBand(highest))
     highest=n;
 }
  sue.play();
  //background(0);
  volume = (sue.left.get(1) + sue.right.get(1)); // get vol. for both channels
  volume = ((volume+2)*50);
  form(mouseX,mouseY,-HALF_PI,6);
  //frameRate(10);
}

void mousePressed() {
  background(0);
  form(mouseX,mouseY,-HALF_PI,6);
}

void stop()
{
  sue.close(); // close audio I/O
  bob.stop(); // stop the Minim object 
  super.stop();
}

