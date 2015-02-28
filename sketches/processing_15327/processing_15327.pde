
//basic 3d particle system behavior: movement within the noise space
//echoechonoisenoise

//open architecture open design : use it for any purpose, just link the results of your work

import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;

PeasyCam cam;
ArrayList ptc;
int quantity=1000;
float i=random(10),sc=random(0.1,0.001);

void setup(){
  size(700,700,P3D);
  cam = new PeasyCam(this,1200);
  ptc=new ArrayList();
  for(int i=0;i<quantity;i++){
    ptc.add(new Particle());  
  }
}

void draw(){
  background(35);
  for(int i=0;i<ptc.size();i++){
    Particle c=(Particle)ptc.get(i);
    c.behave();
    c.display();
  }
}

void keyPressed(){
  i=random(10);
  sc=random(0.01,0.001);
  ptc.clear();
  for(int i=0;i<quantity;i++){
    ptc.add(new Particle());  
  }
}






