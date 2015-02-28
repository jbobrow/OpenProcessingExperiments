
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
  float glow = 0;
  color darkBlue = #65579E;
  color peach1 = #DA926F;
  color db = #25333A;
  
ArrayList crysColl;

 




void setup(){
  
 size(1000,1000,P3D);
  
  cam = new PeasyCam(this,100,100,100,150);
  cam.setMinimumDistance(2200);
  cam.setMaximumDistance(4000);
 cam.setYawRotationMode();
  //cam.setPitchRotationMode();
  //cam.setRollRotationMode();
  //cam.setSuppressRollRotationMode();
  //cam.setActive(active); 
//cam.pan();   // move the looked-at point relative to current orientation
//cam.rotateX(mouseX);
//cam.rotateY(mouseY);


  
  crysColl = new ArrayList();
   for(int i=0;i<300;i++){
     Vec3D pos = new Vec3D(random(-2000,2000),random(900,930), random(-500,500));
     crys crysField = new crys(pos);
     crysColl.add(crysField);

   }
  
  
}



void draw(){
  
  background(db);
  smooth();
  
 for(int i=0;i<crysColl.size();i++){
   
   crys crysField = (crys)crysColl.get(i);
   crysField.run();
  
 }
 

   
   if(move<=0){
   float speed = 0.003;
   speed+=0.001;
  cam.rotateY(speed);
   
   }
 
  
 mouse();
 //println(move);
 println(glow);
}

void mouse(){ 
  if (move == 0){
      noCursor();
   }
  if (move>0 && move<37){
      cursor(HAND);
   }
  if (move>36){
      cursor(HAND);
  }
   if(move<=36){
      move--;//move-1;
   }
} 
 void mouseMoved(){
 
   move=30;
 
   
   
    
    
    
  }
  
   
 





