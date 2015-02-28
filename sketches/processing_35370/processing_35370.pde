

float sca=1;

import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioPlayer jingle;
FFT fft;

int averages=128;

points p[];
int points_m=1000;

void setup()
{
  size(600, 600, P3D);
  //size(screen.width, screen.height, OPENGL);
  mousewheelstart();
  minim = new Minim(this);
  /*
  String file="";
  while(file==null || file.equals("")){
   file=selectInput();
  }
  jingle = minim.loadFile(file, 2048);
  */
  jingle = minim.loadFile("1-23 - Ilia's Theme.mp3", 2048);
  // loop the file
  jingle.loop();
  // create an FFT object that has a time-domain buffer the same size as jingle's sample buffer
  // and a sample rate that is the same as jingle's
  // note that this needs to be a power of two 
  // and that it means the size of the spectrum will be 1024. 
  // see the online tutorial for more info.
  fft = new FFT(jingle.bufferSize(), jingle.sampleRate());
  // use 128 averages.
  // the maximum number of averages we could ask for is half the spectrum size. 
  fft.linAverages(averages);
  fft.window(FFT.HAMMING);
  rectMode(CORNERS);
  
  p=new points[points_m];
  for(int i=0; i<p.length; i++){
    p[i]=new points();
  }
}

void draw()
{
  background(0);
  fill(255);
  // perform a forward FFT on the samples in jingle's mix buffer
  // note that if jingle were a MONO file, this would be the same as using jingle.left or jingle.right
  fft.forward(jingle.mix);
  /*int w = int(width/averages);
  int j=fft.avgSize();
  for(int i = 0; i < fft.avgSize(); i++)
  {
    // draw a rectangle for each average, multiply the value by 5 so we can see it better
    rect(i*w, height, i*w + w, height - fft.getAvg(i)*5);
    rect(j*w, 0, j*w - w, fft.getAvg(i)*5);
    j--;
  }
  */
  translate(width/2, height/2);
  
  float rxp = ((mouseX-(width/2))*0.005);
  float ryp = ((mouseY-(height/2))*0.005);
  rotateY(rxp);
  rotateX(-ryp);
  scale(sca);
  
  for(int i=0; i<p.length; i++){
    p[i].show();
  }
  for(int i=0; i<p.length; i++){
    p[i].move();
  }
}

void keyPressed(){
  if(key=='r'){
    jingle.pause();
    setup();
  }
}

void stop()
{
  // always close Minim audio classes when you finish with them
  jingle.close();
  minim.stop();
  
  super.stop();
}

