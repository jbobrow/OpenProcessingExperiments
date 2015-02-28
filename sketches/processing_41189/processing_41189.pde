
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
  m.adaptivity(5);
  m.adapt();// immediately take a snapshot of the background for differencing
  println("Myron " + m.version());
  rectMode(CENTER);
  noStroke();
  noCursor();
  
  colorMode(HSB);

  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
  sine = new SineWave(440,0.5,out.sampleRate());
  sine.portamento(100);
  out.addSignal(sine);
}


void draw(){
  //filter(BLUR, 1);
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
    float freq = map(objdesty, objdestx, height, 250, 60);
    sine.setFreq(freq);
    
    if(freq > 175){
      smooth();
      fill(avX/3,avX/4,avY/2,abs(25*0.999));
      ellipse(objdestx,objdesty,avX*0.3,avX*0.3);
    } 
    
    
    if(freq < 175){
    fill(avX/3,avY/4,avY/3,abs(25*0.999));
     ellipse(objdestx,objdesty,avX*0.2,avX*0.2);
  }
    
    
    float pan = map(objdestx, objdesty, width, -1, 2);
    sine.setPan(pan);
  }
  
}






