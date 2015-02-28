
import controlP5.*;
ControlP5 controlP5;

int imageCount = 6;
float zoomSpeed = 0.02;
int Wid = 450; 
int Hei = int(Wid*1.33);
int uperRange = 32;
float sliderValue;
float scaleFactor = 0.25;
long lastTime = 0;

boolean forward = false;
boolean backward = false;
PImage[] images = new PImage[imageCount];

void setup() {
  size(450, 599);
  controlP5 = new ControlP5(this);
  controlP5.addSlider("slider", 1, uperRange, Wid, Wid-40, 50, 10, Hei-100);
 
  for (int i = 0; i < images.length; i++) {
    String imageName = i + ".jpg";
    images[i] = loadImage(imageName);
  }
  controlP5.controller("slider").setValue(1);
}

void draw() {
  
  if (forward){
    if(sliderValue<uperRange){
      controlP5.controller("slider").setValue(sliderValue+zoomSpeed);
    }  
  }
  if (backward){
    if(sliderValue>1){
      controlP5.controller("slider").setValue(sliderValue-zoomSpeed);
    }
  }
}

void slider(float per) {
  
  imageMode(CENTER);
  sliderValue = per;
  float tempScale = 4*Wid;
  
  for(int i=0;i<imageCount;i++){
    tempScale = tempScale*scaleFactor;
    PImage tempImg = images[i];
    image(tempImg, width/2,height/2,per*per*tempScale,int(per*per*1.33*tempScale));
    
    noFill();
    stroke(255,255,255,150);
    rectMode(CENTER);
    rect(Wid/2,Hei/2,per*per*tempScale,int(per*per*1.33*tempScale));
    rectMode(CORNER);
  }
 
  pushMatrix();
  rotate(-PI/2);
  fill(255);
  textSize(20);
  text("eigenCORRIDOR",-210,Wid-50); 
  popMatrix();
  
  textSize(10);
  text("* use the SLIDER or UP and DOWN keys to move through the corridor ",40,Hei-35);
}
 

