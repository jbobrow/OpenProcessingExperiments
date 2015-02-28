

import peasy.*;

PeasyCam cam;
Wave[] mywave = new Wave[5];

void setup(){
  size(900,900,P3D);
  for(int i=0;i<mywave.length;i++){
  mywave[i]=new Wave(random(200),random(400),20,random(1,15),random(1,20),random(1,20),random(40,100));
}
  cam = new PeasyCam(this, 1500);
  cam.setMinimumDistance(100);
  cam.setMaximumDistance(3000);
}

void draw(){
  background(0);
  lights();
         
  pushMatrix();
  translate(0,0,0);
  
  //fill(255);
  noFill();
  stroke(255,0,0);
  rotateY(0);
  rotateX(0);
  box(800);
  popMatrix();
  
  for(int i=0; i<mywave.length;i=i+1){
  mywave[i].move();
  mywave[i].bounce();
  mywave[i].display();
}
}

