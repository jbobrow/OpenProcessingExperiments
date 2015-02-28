
//Audio Visualization created by Jake Birnbaum

import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioInput in;
FFT fft;

int w;
PImage fade;
int hVal;
float rWidth, rHeight;
int value;

void setup()
{
size(1024,640,P3D);
frameRate(255);
minim = new Minim(this);
in = minim.getLineIn (Minim.STEREO, 512);
fft=new FFT(in.bufferSize(), in.sampleRate());
fft.logAverages(44100,512);

stroke(0.5);
w=width/fft.avgSize();
//strokeCap(SQUARE);
strokeJoin(BEVEL);// BEVEL, ROUND, MITER
strokeWeight(w);


background(0);
fade=get(0,0,width, height);

rWidth=width/0.5; //0.95
rHeight=height*1.5;
hVal=0;
}

void draw()
{
  background(0);
  tint(255,255,255,240); //240
  image(fade,(width-rWidth)/2,(height-rHeight),rWidth,rHeight);
  noTint();
  
 fft.forward(in.mix);

 colorMode(HSB,255);
 stroke(hVal, 255,255);
 colorMode(RGB);
// for(int i=0; i<fft.specSize();i++)
 for(int i=0; i<fft.avgSize();i++)
 {
  line((i*w),height,(i*w),height-fft.getAvg(i)*25);
//line(i,height,i,height-fft.getAvg(i) * 4);
 }  
 fade=get(0,0,width, height);
 
 stroke(0);
 for(int i=0; i<fft.avgSize();i++)
 {
   line((i*w),height,(i*w),height-fft.getAvg(i) * 3.95);
 }  
 
 hVal+=2;
 if(hVal>255)
 {
   hVal=0;
 }
}

//Resources:
//Minim resources: http://code.compartmental.net/tools/minim/
//Fullscreen.API obtained from: http://www.superduper.org/processing/fullscreen_api/
//P3D and other resources found from: http://processing.org/reference/
//Audio Visualization created by Jake Birnbaum              
