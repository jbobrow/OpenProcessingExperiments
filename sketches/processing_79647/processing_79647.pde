
//import processing.funnel.*;
//
//Arduino arduino;
//Pin volumePin;

float volume;

PImage[] img = new PImage[49];

int count;
int speed;


void setup(){
//  Configuration config = Arduino.FIRMATA;
//  arduino = new Arduino(this, config);
//  volumePin = arduino.analogPin(0);
  
  frameRate(30);
  
  smooth();
  
  size(480,480);
//  background(16,25,49);
frame.setTitle("cat三島夏菜 11147062");
  
   speed = 0;
  count = 0;
  for (int i=0; i<img.length; i++) {
    img[i] = loadImage("sorara" + nf(i+1,4) +".png");
  }
  
  
 
  

  
  
}

void draw(){
  background(255);

  
  // use Arduino
//  volume = volumePin.value;
  
  // use Mouse
 volume = map(mouseX, 0, width, 0, 1);
  
  count = int(map(volume, 0, 1, 0, 49));
  
  image(img[count], 0, 0);
  
//  speed = int(map(volume, 0, width, 0, 6));



//マウスが390を超えるとアニメーションする
//if (mouseX>470) {
//    count += 1;
//  }
//  if (count>=img.length) count=0;
//  if (count<0) count=img.length-1;
  
 
}


