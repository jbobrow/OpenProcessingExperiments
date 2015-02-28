
import processing.funnel.*;

Arduino arduino;
Pin volumePin;

import ddf.minim.*;

Minim minim;
AudioInput in;

float kuru= 0;                         
 
void setup(){
 size(600,600);
 frameRate(30);
 smooth();
  Configuration config = Arduino.FIRMATA;

  arduino = new Arduino(this, config);
  volumePin = arduino.analogPin(0);
  minim = new Minim(this);
  minim.debugOn();
  in = minim.getLineIn(Minim.STEREO, 512);
  Scaler scaler = new Scaler(0.002, 0.49, 0,650, Scaler.LINEAR, true);
  Convolution convolution = new Convolution(Convolution.MOVING_AVERAGE);
}
 
void draw(){
  float level = in.mix.level()*70;
  if(focused){
    frameRate(40);
  float angle = volumePin.value;
 fill(30,80);                         
 noStroke();                           
 rect(0,0,width,height);               
 translate(width/2,height/2);         
  
 for (int i = 0; i < width/2; i ++){   
  stroke(255,255,255);                      
  rotate(radians(kuru));              
  point(i,i);                         
  stroke(angle,250,180);                    
  strokeWeight(level);             
  point(-i,-i);                        
 }
  kuru += angle/5;                         
  }
}

boolean Stop;

void stop()
{
  in.close();
  minim.stop();
  super.stop();
}
//void mousePressed()
//{
//  Stop = !Stop;
//  if (Stop)
//    noLoop();
//  else
//    loop();
//}



