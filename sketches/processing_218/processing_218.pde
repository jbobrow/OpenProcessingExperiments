
import processing.pdf.*;
import processing.opengl.*;

int len = 10;
int pop = 600;
float prox = 10;
int co = len-1;   //this just makes things easier
boolean saveOneFrame = false;


Wander p[] = new Wander[pop];

import krister.Ess.*;

//ess variables
int bufferSize;
int steps;
float limitDiff;
int numAverages=32;
float myDamp=.1f;
float maxLimit,minLimit;

FFT myFFT;
AudioInput myInput;


void setup()
{
  size(640,480,OPENGL);
  for (int i = 0; i < pop; i++)
  {
    p[i] = new Wander(random(width),random(height),i);
  }
  //smooth();
      //ess setup
  // start up Ess
  Ess.start(this); 
  // set up our AudioInput
  bufferSize=1024;
  myInput=new AudioInput(bufferSize);

  // set up our FFT
  myFFT=new FFT(bufferSize*2);
  myFFT.equalizer(true);

  // set up our FFT normalization/dampening
  minLimit=.005;
  maxLimit=.05;
  myFFT.limits(minLimit,maxLimit);
  myFFT.damp(myDamp);
  myFFT.averages(numAverages);

  // get the number of bins per average
  steps=bufferSize/numAverages;

  // get the distance of travel between minimum and maximum limits
  limitDiff=maxLimit-minLimit;

  frameRate(60); 

  myInput.start();
}

void draw()
{
  if(saveOneFrame == true) {
    beginRecord(PDF, "Line.pdf"); 
  }
  background(20);
  for (int i = 0; i < pop; i++)
  {
    p[i].display();
  }
  if(mousePressed && (mouseButton == RIGHT))
  {
    saveFrame("amoeba-##.tif");  //for saving a beautiful image.
  }
  if(myFFT.spectrum[360]*200 >= 50) prox = 30;
  if(myFFT.spectrum[360]*200 < 50) prox = 4;
  //print(myFFT.spectrum[100]*200+" - ");
  //println(myFFT.spectrum[360]*200);
  if(saveOneFrame == true) {
    endRecord();
    saveOneFrame = false; 
  }
}

float Range(int index, boolean isxin)
{
  int no;
  boolean isx = isxin;
  float r = 0;
  
  no = index;

  for (int i = 0; i < pop; i++)
  {
   float d = dist(p[no].x[co],p[no].y[co],p[i].x[co],p[i].y[co]);
   if(d < prox && d > 3)
   {
     if(isx == true) 
     {
       if(p[no].x[co]-p[i].x[co] < 0) r+=1;
       if(p[no].x[co]-p[i].x[co] > 0) r-=1;
     }
     if(isx == false)
     {
       if(p[no].y[co]-p[i].y[co] < 0) r+=1;
       if(p[no].y[co]-p[i].y[co] > 0) r-=1;
     }
   }
   if(d <= 3)
   {
     if(isx == true) 
     {
       if(p[no].x[co]-p[i].x[co] > 0) r+=1;
       if(p[no].x[co]-p[i].x[co] < 0) r-=1;
     }
     if(isx == false)
     {
       if(p[no].y[co]-p[i].y[co] > 0) r+=1;
       if(p[no].y[co]-p[i].y[co] < 0) r-=1;
     }
   if(myFFT.spectrum[100]*200 > 38) //this is good for basstones
   {
     if(isx == true) 
     {
       if(p[no].x[co]-p[i].x[co] > 0) r+=30;
       if(p[no].x[co]-p[i].x[co] < 0) r-=30;
     }
     if(isx == false)
     {
       if(p[no].y[co]-p[i].y[co] > 0) r+=30;
       if(p[no].y[co]-p[i].y[co] < 0) r-=30;
     }
   }
   }
  } 
  return r;
}


class Wander 
{
  float[] x = new float[len];
  float[] y = new float[len];
  int no;
  Wander (float xin, float yin, int index)
  {
    for (int i = 0; i < len; i++)
    {
      x[i] = xin;
      y[i] = yin;
    }
    no = index;
  }
  void display()
  {
    float rx;
    float ry;
    
    for (int i = 1; i < len; i++)
    {
      x[i-1] = x[i];
      y[i-1] = y[i];
    }
    
    rx = Range(no,true);
    ry = Range(no,false);
    

    
    x[co] += random(rx-1,rx+1);
    y[co] += random(ry-1,ry+1);
    
    x[co] = x[co]%width;
    y[co] = y[co]%height;
    
    for (int i = 1; i < len; i++)
    {
      float val = map(i,0,len,0,255);
      float val2 = map(no,0,pop,0,255);
      stroke((val2+185)%255,(val2+15)%255,(val2+90)%255,val);
      strokeWeight(val/20);
      if(abs(x[i-1]-x[i]) < width/2 && abs(y[i-1]-y[i]) < height/2) line(x[i-1]%width,y[i-1]%height,x[i]%width,y[i]%height); 
    }
   
  }  
}

public void audioInputData(AudioInput theInput)
{
  myFFT.getSpectrum(myInput);
}
void keyPressed() {
  saveOneFrame = true; 
}

