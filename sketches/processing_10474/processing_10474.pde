
import controlP5.*;

int nrOfNodes = 80;
float IglobalSpeed = 1;
float IglobalSize = 0.0;
float IglobalDistance = 40.0;
float IglobalOpacity = 0;
float padding = 50;
boolean INTERFACE = true;
//---GLOBAL VARS---//

ControlP5 controlP5;

Node[] nodes = new Node[nrOfNodes];

int elapsedFrames = 0;
float phi = 0;
float globalSpeed, globalSize, globalDistance, globalOpacity;

void setup(){
  
globalSpeed = IglobalSpeed;
globalSize = IglobalSize;
globalDistance = IglobalDistance;
globalOpacity = IglobalOpacity;
  
  size(700,700);
  background(120);
  smooth();
  
  for(int i = 0; i < nrOfNodes; i++){
    nodes[i] = new Node();
  }
  
  if(INTERFACE){
  controlP5 = new ControlP5(this);
  controlP5.addSlider("Speed",-10,10,1.5,30,height-30,100,14).setId(0);
  controlP5.addSlider("Size",0,100,0,180,height-30,100,14).setId(1);
  controlP5.addSlider("Dist",0,1000,40,330,height-30,100,14).setId(2);
  controlP5.addSlider("Fade",0,100,0,480,height-30,100,14).setId(3);
  controlP5.addBang("Reset",630,height-35,20,20).setId(4);
  }
}

void draw(){
noStroke();
fill(120, globalOpacity);
rect(0,0,width,height);
  for(int i = 0; i < nrOfNodes; i++){
    nodes[i].draw();
  }
  globalSpeed = IglobalSpeed + abs((sin(phi))*2);
  phi += 0.01;
  
  elapsedFrames++;
}

void controlEvent(ControlEvent theEvent) {
  switch(theEvent.controller().id()) {
    case(0):
    globalSpeed = (float)(theEvent.controller().value());
    break;
    case(1):
    globalSize = (float)(theEvent.controller().value());
    break;
    case(2):
    globalDistance = (float)(theEvent.controller().value());
    break;
    case(3):
    globalOpacity = (float)(theEvent.controller().value());
    break;
    case(4):
    for(int i = 0; i < nrOfNodes; i++){
        nodes[i].reset();
      }
    break;
  }
}

//CLASS NODE

public class Node{
  
  float xPos, yPos, xSpeed, ySpeed;
 
 public Node(){
   xPos = random(width-(globalSize*4) - padding*2)+(globalSize*2)+padding;
   yPos = random(height-(globalSize*4) - padding*2)+(globalSize*2)+padding;
   xSpeed = (random(2.0)-1);
   ySpeed = (random(2.0)-1);
 }
 
 void draw(){
   fill(30,80);
   noStroke();
   ellipse(xPos, yPos, globalSize, globalSize);
   
  for(int i = 0; i < nrOfNodes; i++){
    if(dist(xPos, yPos, nodes[i].xPos, nodes[i].yPos)<=globalDistance){
      stroke(20, 10);
      strokeWeight(globalSize/5);
      line(xPos, yPos, nodes[i].xPos, nodes[i].yPos);
    }
  }
        
   if(xPos <= (globalSize/2)+padding || xPos >= width-(globalSize/2)-padding){
     xSpeed *= -1;
   }
   
   if(yPos <= (globalSize/2)+padding || yPos >= height-(globalSize/2)-padding){
     ySpeed *= -1;
   }  
   
   xPos += (xSpeed*globalSpeed);
   yPos += (ySpeed*globalSpeed);
 } 
    
  void reset(){
   xPos = random(width-(globalSize*4) - padding*2)+(globalSize*2)+padding;
   yPos = random(height-(globalSize*4) - padding*2)+(globalSize*2)+padding;
   xSpeed = (random(2.0)-1);
   ySpeed = (random(2.0)-1);
  }
}

