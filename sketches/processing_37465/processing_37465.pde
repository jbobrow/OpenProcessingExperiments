
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;
SineWave sine;

import JMyron.*;

JMyron m;//a camera object

//variables to maintain the floating green circle
float objx = 160;
float objy = 120;
float objdestx = 160;
float objdesty = 120;

void setup(){
  size(700,400, P3D);
  background(255);
  m = new JMyron();//make a new instance of the object
  m.start(width,height);//start a capture at size
  m.trackColor(255,255,255,256*3-100);//track white
  m.update();
  m.adaptivity(10);
  m.adapt();// immediately take a snapshot of the background for differencing
  println("Myron " + m.version());
  rectMode(CENTER);
  noStroke();

  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
  sine = new SineWave(440,0.5,out.sampleRate());
  sine.portamento(100);
  out.addSignal(sine);
}


void draw(){
  m.update();//update the camera view
 

  
  int[][] centers = m.globCenters();//get the center points
  float avX=0;
  float avY=0;
  for(int i=0;i<centers.length;i++){
    avX += centers[i][0];
    avY += centers[i][1];
  }
  if(centers.length-1>0){
    avX/=centers.length-1;
    avY/=centers.length-1;
  }

  //update the location of the thing on the screen.
  if(!(avX==0&&avY==0)&&centers.length>0){
    objdestx = avX;
    objdesty = avY;
    float freq = map(objdesty, 0, height, 1500, 60);
    sine.setFreq(freq);
    
    if(freq > 100){
      fill(0,15);
      ellipse(objdestx,objdesty,avX*0.1,avY*0.1);
    }
    
    
    float pan = map(objdestx, 0, width, -1, 1);
    sine.setPan(pan);
  }
  
}


