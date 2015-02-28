
//March 22th

//import processing.opengl.*;

int numSystems = 10;

System [] systems = new System[numSystems];

void setup(){
  size(642,482);
  smooth();
  background(0);
  for(int i=0; i<numSystems; i++){
    int tempRan = int(random(10,30));
    systems[i] = new System(tempRan);
  }
  
}

void draw(){
  
  fill(0,15);
  noStroke();
  rect(0,0,width,height);
  for(int i=0; i<numSystems; i++){
  systems[i].update();
  }
  println(frameRate);
  
}

