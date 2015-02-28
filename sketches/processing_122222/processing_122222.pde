
import controlP5.*;

ControlP5 cp5;

float circleX;
float circleY;
int brightness;
int randomX;
int randomY;
boolean reset;
boolean Print;


void setup () {
  size(1600,1050);
  background(50);
  circleX = width/2;
  circleY = height/2;
  brightness = 255;
  randomX = 3;
  randomY = 5;
  reset = false;
  Print = false;
  
  cp5 = new ControlP5(this);
  
  cp5.addSlider("brightness")
    .setPosition(100,50)
    .setRange(0,255)
    .setSize(200,20)
    ;
    
  cp5.addSlider("randomX")
    .setPosition(100,100)
    .setRange(0,30)
    .setSize(200,20)
    ;
    
  cp5.addSlider("randomY")
    .setPosition(100,150)
    .setRange(0,30)
    .setSize(200,20)
    ;
    
    cp5.addButton("reset")
     .setPosition(100,200)
     .setSize(200,20)
     .setSwitch(false)
     ;
    
     
     cp5.addButton("Print")
     .setPosition(100,250)
     .setSize(200,20)
     .setSwitch(false)
     ; 
      
   
}



void draw () {
  
  //Drawing Stuff
  
  fill(random(brightness), random(brightness), random(brightness));
  ellipse(circleX,circleY,24,24);
  
  
  //Logic
  circleX = circleX+random(-randomX,randomX);
  circleY = circleY+random(-randomY,randomY);
  
 
  
}

public void reset(boolean reset) {
   if (reset = true) {
    background (50);
  }
}



public void Print(boolean Print) {
   if (Print = true) {
    saveFrame("RandomPainting-####.png");
  }
}


