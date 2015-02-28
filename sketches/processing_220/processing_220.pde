
import damkjer.ocd.*;
import processing.opengl.*;

int len = 10;
int pop = 400;
float prox = 10;
int co = len-1;   //this just makes things easier
Camera camera1;


Wander p[] = new Wander[pop];

import krister.Ess.*;

//ess variables
int bufferSize;
int steps;
float limitDiff;
int numAverages=32;
float myDamp=.1f;
float maxLimit,minLimit;
float rad=7;

FFT myFFT;
AudioInput myInput;


void setup()
{
  size(480,480,OPENGL);
  for (int i = 0; i < pop; i++)
  {
    p[i] = new Wander(random(width),random(height),i);
  }
  camera1 = new Camera(this, 200,100,200);
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
  rotateX(PI/2);
  //translate(-width/2,-height/2);
  background(20,100);
  float q = 0;
  for (int i = 0; i < pop; i++)
  {
    p[i].display();
  }
  if(mousePressed && (mouseButton == RIGHT))
  {
    saveFrame("amoeba-##.tif");  //for saving a beautiful image.
  }
  if(myFFT.spectrum[360]*200 >= 95) 
  {
    prox = 30; //this increases their field of view
    rad -= 40;
    rad = constrain(rad, 125, 150);
  }
  if(myFFT.spectrum[360]*200 < 95) 
  {
    prox = 4; //this decreases it
    rad -= 40;
    rad = constrain(rad, 125, 150);
  }
  //print(myFFT.spectrum[100]*200+" - ");
  //println(myFFT.spectrum[360]*200);
  camera1.circle(q);
  camera1.feed();
}

void mouseMoved() {
  camera1.tumble(radians((mouseX - pmouseX)*1.5), radians((mouseY - pmouseY)*1.5));
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
   if(myFFT.spectrum[100]*200 > 38) //this sends them back to their origins
   {
     rad += 10;
     rad = constrain(rad, 80, 150);
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
    
    x[co] = width+x[co]%width;
    y[co] = height+y[co]%height;
    
    for (int i = 1; i < len; i++)
    {
      float val = map(i,0,len,0,255);
      float val2 = map(no,0,pop,0,255);
      stroke((val2+185)%255,(val2+15)%255,(val2+90)%255,val);
      strokeWeight(val/20);
      if(abs(x[i-1]-x[i]) < width/2 && abs(y[i-1]-y[i]) < height/2){ //line(x[i-1]%width,y[i-1]%height,x[i]%width,y[i]%height);
        float a=x[i-1];
        float aa=y[i-1];
        float aaaa=x[i];
        float aaaaa=y[i];
        line(sin(PI*a/(width-1))*cos(TWO_PI*aa/(height-1))*rad,sin(PI*a/(width-1))*sin(TWO_PI*aa/(height-1))*rad,cos(PI*a/(width-1))*rad,
          sin(PI*aaaa/(width-1))*cos(TWO_PI*aaaaa/(height-1))*rad,sin(PI*aaaa/(width-1))*sin(TWO_PI*aaaaa/(height-1))*rad,cos(PI*aaaa/(width-1))*rad);
      }
    }
   
  }  
}

public void audioInputData(AudioInput theInput)
{
  myFFT.getSpectrum(myInput);
}

