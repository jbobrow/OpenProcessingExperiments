

import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;
SineWave sine1;
SineWave sine2;
SineWave sine3;
SineWave sine4;
SineWave sine5;
SineWave sine6;
SineWave sine7;
SineWave sine8;
SineWave sine9;
SineWave sine0;



float ex,ey,angle,s;
float mx,my;
float vx,vy;
float Mx,My;
float jx,jy;
float sx,sy;
float ux,uy;
float nx,ny;
float ax,ay;
float moonx,moony;
  float rs = random(15);
  float rd = random(230,280);
  float rv = random(.12,.52);
 
void setup(){
  
  
  
  minim = new Minim(this);
  // get a line out from Minim, default bufferSize is 1024, default sample rate is 44100, bit depth is 16
  out = minim.getLineOut(Minim.STEREO);
  // create a sine wave Oscillator, set to 440 Hz, at 0.5 amplitude, sample rate from line out
  
  sine1 = new SineWave(440, 0.5, out.sampleRate());
  sine1.portamento(200); 
  
  sine2 = new SineWave(440, 0.5, out.sampleRate());
    sine2.portamento(200); 
    
    sine3 = new SineWave(440, 0.5, out.sampleRate());
      sine3.portamento(200); 
      
      sine4 = new SineWave(440, 0.5, out.sampleRate());
        sine4.portamento(200); 
        
        sine5 = new SineWave(440, 0.5, out.sampleRate());
        sine5.portamento(200); 
        
        sine6 = new SineWave(440, 0.5, out.sampleRate());
        sine6.portamento(200); 
        
        sine7 = new SineWave(440, 0.5, out.sampleRate());
        sine7.portamento(200); 
        
        sine8 = new SineWave(440, 0.5, out.sampleRate());
        sine8.portamento(200); 
        
        sine9 = new SineWave(440, 0.5, out.sampleRate());
        sine9.portamento(200); 
  
        sine0 = new SineWave(440,0.5,out.sampleRate());
        sine0.portamento(200);      
        
  
  out.addSignal(sine0);
  out.addSignal(sine1);
  out.addSignal(sine2);
  out.addSignal(sine3);
  out.addSignal(sine4);
  out.addSignal(sine5);
  out.addSignal(sine6);
  out.addSignal(sine7); 
  out.addSignal(sine8); 
  out.addSignal(sine9);
 
 
   
  size(900,900);
  smooth();
  ex = 0;
  ey = 0;
  mx = 0;
  my = 0;
  vx = 0;
  vy = 0;
  Mx = 0;
  My = 0;
  jx = 0;
  jy = 0;
  sx = 0;
  sy = 0;
  ux = 0;
  uy = 0;
  nx = 0;
  ny = 0;
  ax = 0;
  ay = 0;
  moonx = 0;
  moony = 0;
  angle = 0;
  s = 1;
}
 
void draw(){
 
  background(0);
  fill(255,255,0);
  noStroke();
  
  //sun
  ellipse(width/2,height/2,50,50); 
   
  //earth
  fill(5,255,23);
  ex = cos(radians(angle++)) * 150 + width/2;
  ey = sin(radians(angle)) * 150 + height/2;
  ellipse(ex,ey,20,20);
  
  //earth moon
  fill(250);
  moonx = cos(radians(ex/2)) * 20 + ex;
  moony = sin(radians(ey/2)) * 20 + ey;
  ellipse(moonx,moony,10,10);
   
   
  //mercury
  fill(240);
  mx = cos(radians(angle*4.16)) * 50 + width/2;
  my = sin(radians(angle*4.16)) * 50 + height/2;
  ellipse(mx,my,5,5);
   
  //venus
  fill(233,237,41);
  vx = cos(radians(angle*1.63)) * 100 + width/2;
  vy = sin(radians(angle*1.63)) * 100 + height/2;
  ellipse(vx,vy,18,18);
   
  //mars
  fill(183,32,24);
  Mx = cos(radians(angle*.53)) * 200 + width/2;
  My = sin(radians(angle*.53)) * 200 + height/2;
  ellipse(Mx,My,15,15);

  //jupiter
  fill(180,157,109);
  jx = cos(radians(angle*.11)) * 300 + width/2;
  jy = sin(radians(angle*.11)) * 300 + height/2;
  ellipse(jx,jy,40,40);
   
  //saturn
  fill(214,145,6);
  sx = cos(radians(angle*.033)) * 350 + width/2;
  sy = sin(radians(angle*.033)) * 350 + height/2;
  ellipse(sx,sy,30,30);
  noFill();
  stroke(255);
  ellipse(sx,sy,50,25);
  noStroke();
   
  //uranus
  fill(73,151,227);
  ux = cos(radians(angle*.011)) * 400 + width/2;
  uy = sin(radians(angle*.011)) * 400 + height/2;
  ellipse(ux,uy,25,25);
   
  //neptune
  fill(10,92,250);
  nx = cos(radians(angle*.006)) * 430 + width/2;
  ny = sin(radians(angle*.006)) * 430 + height/2;
  ellipse(nx,ny,25,25);
   
   
   
   
 float freq1 = map(ey, 0, height, 1500, 20);
 sine1.setFreq(freq1);
 float pan1= map(ex, 0, width, -1,1);
 sine1.setPan(pan1);
  
float freq2 = map(moony,0,height,1500,20);
 sine2.setFreq(freq2);
  float pan2= map(moonx, 0, width, -1,1);
 sine2.setPan(pan2);
 
 float freq3 = map(my,0,height,1500,20);
 sine3.setFreq(freq3);
  float pan3= map(mx, 0, width, -1,1);
  sine3.setPan(pan3);
 
 float freq4 = map(vy,0,height,1500,20);
 sine4.setFreq(freq4);
  float pan4= map(vx, 0, width, -1,1);
 sine4.setPan(pan4);
   
 float freq5 = map(My,0,height,1500,20);
 sine5.setFreq(freq5);
  float pan5= map(Mx, 0, width, -1,1);
 sine5.setPan(pan5);
 
  float freq6 = map(jy,0,height,1500,20);
 sine6.setFreq(freq6);
  float pan6= map(jx, 0, width, -1,1);
 sine6.setPan(pan6);
  
  float freq7 = map(sy,0,height,1500,20);
 sine7.setFreq(freq7);
  float pan7= map(sx, 0, width, -1,1);
 sine7.setPan(pan7);
 
  float freq8 = map(uy,0,height,1500,20);
 sine8.setFreq(freq8);
  float pan8= map(ux, 0, width, -1,1);
 sine8.setPan(pan8);
 
  float freq9 = map(ny,0,height,1500,20);
 sine9.setFreq(freq9);
  float pan9= map(nx, 0, width, -1,1);
   sine9.setPan(pan9);
 
 sine0.setFreq(20);
   
}


