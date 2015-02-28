
import peasy.*;
import toxi.geom.*;
import processing.opengl.*;

PeasyCam cam; 

Vec3D loc = new Vec3D(0,0,0);

 float h1 = 25;
  float h2 = 50;
  float w  = 30;
  float wa = 8;
  float ha = 5;
  float d1 = 12;
  float move = 0;
  boolean active = false;
  
ArrayList crysColl;




void setup(){
  
 size(1000,800,P3D);
  
  cam = new PeasyCam(this,10);
  cam.setMinimumDistance(1000);
  cam.setMaximumDistance(10000);
  //cam.setYawRotationMode();
  //cam.setPitchRotationMode();
  //cam.setRollRotationMode();
  //cam.setSuppressRollRotationMode();
  //cam.setActive(active); 
 
  
  crysColl = new ArrayList();
   for(int i=0;i<100;i++){
     Vec3D pos = new Vec3D(random(-1000,1000),random(560,600),random(-500,500));
     crys crysField = new crys(pos);
     crysColl.add(crysField);

   }
  
  
}



void draw(){
  
  background(0);
  smooth();
  
 for(int i=0;i<crysColl.size();i++){
   
   crys crysField = (crys)crysColl.get(i);
   crysField.run();
  
 }
 
 
 
 noStroke();
 fill(140,30);
 box(500,2000,500);
  

 
}


  
  
  
  
  




