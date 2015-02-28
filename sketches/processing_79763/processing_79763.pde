
import processing.funnel.i2c.*;
import processing.funnel.*;

Arduino arduino;

float a;
float b;
float c;
float d;


int[] colo = new int [100];
//int[] coloa = new int [1000];
//int[] colob = new int [1000];
int idx = 0;
int icol = 0;


void setup(){
  size(500,500);
  frameRate(30);
  background(255);
  stroke(int(random(255)),random(120,255),200,40);
  
  arduino = new Arduino(this,Arduino.FIRMATA);
  
  Scaler scaler = new Scaler(0.002, 0.49, 200, 3, Scaler.LINEAR, true);
  Convolution convolution = new Convolution(Convolution.MOVING_AVERAGE);
  
  arduino.analogPin(0).addFilter(scaler);
  arduino.analogPin(0).addFilter(convolution);
  
}


void draw(){


  colo[idx] = int(random(255));
  //coloa[icol] = int(random(255));
  //colob[icol] = int(random(255));
  
  //idx++;
  
  /*if(idx==999){
    idx=0;
    background(200);
  }*/
  
  if(mousePressed){
    idx=0;
    background(255);
  }

  b = int(arduino.analogPin(0).value);
  frameRate(arduino.analogPin(0).value);
  
  line(int(random(0,500)),int(random(0,500)),int(random(0,500)),int(random(0,500)));
  line(int(random(0,500)),int(random(0,500)),int(random(0,500)),int(random(0,500)));
  line(int(random(0,500)),int(random(0,500)),int(random(0,500)),int(random(0,500)));
  //line(posx [idx],posy [idx],posx2[idx],+posy2[idx]);
  stroke(colo[idx],random(100,200),200,70);
  
  text("analogInput[0]: " + frameRate,1000,1000);
}



