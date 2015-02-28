
import controlP5.*;
ControlP5 controlP5;

int imageCount = 4;
int zoomSpeed = 500;
int Wid = 600; 
int Hei = int(Wid*1.33);
int uperRange = 40000;
int sliderValue;
float scaleFactor = 0.5;
long lastTime = 0;
PImage[] images = new PImage[imageCount];

void setup() {
  size(600, 800);
  controlP5 = new ControlP5(this);
  controlP5.addSlider("slider", Wid, uperRange, Wid, Wid-40, 50, 10, Hei-100);
 
  for (int i = 0; i < images.length; i++) {
    String imageName = i + ".jpg";
    images[i] = loadImage(imageName);
  }
  controlP5.controller("slider").setValue(800);
}

void draw() {
}

void slider(int per) {
  
  imageMode(CENTER);
  sliderValue = per;
  float tempScale = 2;
  
  for(int i=0;i<imageCount;i++){
    tempScale = tempScale*scaleFactor;
    PImage tempImg = images[i];
    image(tempImg, width/2, height/2,per*tempScale,int(per*1.33*tempScale));
  }
 
  pushMatrix();
  rotate(-PI/2);
  fill(255);
  textSize(20);
  text("eigenCORRIDOR",-210,Wid-50); 
  popMatrix();
  
  textSize(10);
  text("* use the slider to move through the corridor ",40,Hei-35);
}

