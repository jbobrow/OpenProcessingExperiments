
/**
*Alcys_Etageres
*
*Par Jacques Maire
*fait le 24 mai 2012
*/

import remixlab.proscene.*;


Scene scene;
Planche planch;
ArrayList planches;
float d,r,h,angl,angl0;

void setup() {
  size(900, 900, P3D);
  scene=new Scene(this); 
  d=900;r=1200;angl=0.13;angl0=0.10;h=150;
  planches= new ArrayList();
  scene.setGridIsDrawn(false);
  scene.setAxisIsDrawn(false);
 // scene.setRadius(50);
 // scene.showAll();
 // scene.setFrameSelectionHintIsDrawn(true);
 // scene.setShortcut('f', Scene.KeyboardAction.DRAW_FRAME_SELECTION_HINT);
  scene.camera().setPosition(new PVector(0, 4500, 4000));
  scene.camera().lookAt(new PVector(0, 0, 1000));
  scene.camera().setOrientation(  new Quaternion(  new PVector(1, 0, 0), -0.85  ) ); 
  assemblage();
}
void assemblage() {
  
   PVector pos;
    Quaternion qor;
    float dp=d+100;
    float dp2=dp-50;
  for(int i=0;i<4;i++){
     pos=new PVector(dp2*cos(HALF_PI*i),dp2*sin(HALF_PI*i),-1550);
      qor=new Quaternion(new PVector(0,0,1),0);
        planches.add(new Planche(this, pos, qor,  150,200, 0,1));
    
     pos=new PVector(dp2*cos(HALF_PI*i),dp2*sin(HALF_PI*i),-1350);
        planches.add(new Planche(this, pos, qor,  100,1200, 0,1));
    pos=new PVector(dp2*cos(HALF_PI*i),dp2*sin(HALF_PI*i),-100);
  qor=new Quaternion(new PVector(0,0,1),QUARTER_PI);
   planches.add(new Planche(this, pos, qor, 200, 200, 100,0));
     
  }
  
  
  
 for(int i=0;i<11;i++){
  pos=new PVector(d-r+r*cos(angl*i),0,r*sin(angl*i));
  qor=new Quaternion(new PVector(0,1,0),-angl*i);
  planches.add(new Planche(this, pos, qor, 60, 80, h,0));//suivant ox
   pos=new PVector(r-d+r*cos(PI-angl*i),0,r*sin(PI-angl*i));
  qor=new Quaternion(new PVector(0,1,0),angl*i);
  planches.add(new Planche(this, pos, qor, 60, 80, h,0));//suivant ox
  pos=new PVector(0,r-d+r*cos(PI-angl*i),r*sin(PI-angl*i));
  qor=new Quaternion(new PVector(1,0,0),-angl*i);
  planches.add(new Planche(this, pos, qor, 60, 80, h,0));//suivant oy
   pos=new PVector(0,d-r+r*cos(angl*i),r*sin(angl*i));
  qor=new Quaternion(new PVector(1,0,0),angl*i);
  planches.add(new Planche(this, pos, qor, 60, 80, h,0));//suivant oy
 
  pos=new PVector(dp*cos(angl0*i),dp-dp*cos(angl0*i),dp*sqrt(2)*sin(angl0*i));
  qor=Quaternion.multiply(new Quaternion(new PVector(0,0,1),QUARTER_PI),new Quaternion(new PVector(1,0,0),-angl0*i));
   planches.add(new Planche(this, pos, qor, 60, 80, h,0));//y=-x+d
 pos=new PVector(dp-dp*cos(angl0*i),dp*cos(angl0*i),dp*sqrt(2)*sin(angl0*i));
  qor=Quaternion.multiply(new Quaternion(new PVector(0,0,1),QUARTER_PI),new Quaternion(new PVector(1,0,0),angl0*i));
   planches.add(new Planche(this, pos, qor, 60, 80, h,0));//diag y=-x+d
   
  pos=new PVector(dp*cos(angl0*i),-dp+dp*cos(angl0*i),dp*sqrt(2)*sin(angl0*i));
  qor=Quaternion.multiply(new Quaternion(new PVector(0,0,1),-QUARTER_PI),new Quaternion(new PVector(1,0,0),angl0*i));
   planches.add(new Planche(this, pos, qor, 60, 80, h,0));//diag y=x-d 
  
   pos=new PVector(dp-dp*cos(angl0*i),-dp*cos(angl0*i),dp*sqrt(2)*sin(angl0*i));
  qor=Quaternion.multiply(new Quaternion(new PVector(0,0,1),-QUARTER_PI),new Quaternion(new PVector(1,0,0),-angl0*i));
   planches.add(new Planche(this, pos, qor, 60, 80, h,0));//diag y=x-d  
   
   
    pos=new PVector(-dp+dp*cos(angl0*i),dp*cos(angl0*i),dp*sqrt(2)*sin(angl0*i));
  qor=Quaternion.multiply(new Quaternion(new PVector(0,0,1),-QUARTER_PI),new Quaternion(new PVector(1,0,0),angl0*i));
   planches.add(new Planche(this, pos, qor, 60, 80, h,0));//diag  
   
    pos=new PVector(-dp*cos(angl0*i),dp-dp*cos(angl0*i),dp*sqrt(2)*sin(angl0*i));
  qor=Quaternion.multiply(new Quaternion(new PVector(0,0,1),-QUARTER_PI),new Quaternion(new PVector(1,0,0),-angl0*i));
   planches.add(new Planche(this, pos, qor, 60, 80, h,0));//diag  
   
    pos=new PVector(-dp*cos(angl0*i),-dp+dp*cos(angl0*i),dp*sqrt(2)*sin(angl0*i));
  qor=Quaternion.multiply(new Quaternion(new PVector(0,0,1),QUARTER_PI),new Quaternion(new PVector(1,0,0),angl0*i));
   planches.add(new Planche(this, pos, qor, 60, 80, h,0));//y=-x-d

    pos=new PVector(-dp+dp*cos(angl0*i),-dp*cos(angl0*i),dp*sqrt(2)*sin(angl0*i));
  qor=Quaternion.multiply(new Quaternion(new PVector(0,0,1),QUARTER_PI),new Quaternion(new PVector(1,0,0),-angl0*i));
   planches.add(new Planche(this, pos, qor, 60, 80, h,0));//y=-x-d
 }
          
}



void draw() {
  background(0, 0, 150);
  // lights();
  directionalLight(255, 255, 255, 2, -1, -1);
  directionalLight(255,255, 255, 0.2, 1, -1);
  directionalLight(255,255, 255, -0.2, -0.3, -1);  
 // fill(0, 125, 0);
 //rect(-2000, -2000, 4000, 4000);
  float temps=min(planches.size(), millis()/1000.0);
  for (int i=0;i<temps;i++) {

    Planche planch=(Planche)planches.get(i);
    planch.actualiser();
  }
}















