


import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioPlayer jingle;
FFT fft;

import processing.video.*;
 
Capture video;
//Capture videoB;
color trackColor;


void setup()
{
 
  size(400,400, P3D);
  frameRate(30);
  colorMode(HSB, 255, 255, 255, 100);
    
   video = new Capture(this, 240,180);
trackColor = color(255, 0, 0);
 
  minim = new Minim(this);
  
  jingle = minim.loadFile("bbs.mp3", 2048);
jingle.loop();
fft = new FFT(jingle.bufferSize(), jingle.sampleRate());
fft.linAverages(128);
  
  noFill();
  smooth();
  strokeWeight(4.0);
  stroke(0);
}
 
 void captureEvent(Capture camera)
{
  video.read();
  
}

 


void draw()
{
  background(255);
  int angle=10;
  int po=5;
  int kan=60;
  translate(200, 200);

 

 
  for (int i=0; i<36; i++) {
    noStroke();
    fill(i*10, 360, 360);

 fft.forward(jingle.mix);
  int w = int(fft.specSize()/128);
  for(int k = 0; k < fft.avgSize()/50; k++){
 
 

 rect(200,200 ,fft.getAvg(k)/6, fft.getAvg(k)/6);

 
    if(mousePressed){
      rotateY(radians(fft.getAvg(k)/10));
    }
     rotateX(radians(mouseX));
    pushMatrix();
    
    
    rotate(radians(i*kan));
    translate(180, 0);
//image(video, 0, -300);
 
    rect(0,0, fft.getAvg(k)/3,fft.getAvg(k)/3);
 
    popMatrix();
    frameRate(10);
    rotateY(radians(mouseY));
    pushMatrix();
   // rotateX(random(200,800));
    //rotate(radians(i*angle));
    translate(90, 0);
    rect(0,0, fft.getAvg(k)/3,fft.getAvg(k)/3);
    translate(10, 0);
    rect(0, 0,fft.getAvg(k)/3,fft.getAvg(k)/3);
    translate(20, 0);
    rect(0, 0, fft.getAvg(k)/3,fft.getAvg(k)/3);
    translate(5, 0);
    rect(0, 0, fft.getAvg(k)/3,fft.getAvg(k)/3);
    //image(video, 0, -300);
    popMatrix();
    
   

 rect(0,0,fft.getAvg(k),fft.getAvg(k));

    
  } 
    
  }
 
   loadPixels();
  for (int i=0; i<36; i++)
    rotate(radians(i*angle));
  translate(50, 0);  
  

 
}
 
void mousePressed() {
  int loc = mouseX + mouseY*video.width;
  trackColor = video.pixels[loc];
}
 
 
 void stop()
{
  // always close Minim audio classes when you finish with them
  jingle.close();
  minim.stop();
  
  super.stop();
}


