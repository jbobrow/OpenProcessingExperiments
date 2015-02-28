


/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/29631*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
/*
*Madame Matisse
*par Jacques Maire
*fait le 26 mai 2012
*tweak of http://www.openprocessing.org/sketch/29631
*/

import remixlab.proscene.*;
PImage photo;
int xpos = 0;
 Scene scene;
 ArrayList boites;
 float wid,hei;
void setup(){
  size(800,800, P3D);
  scene=new Scene(this);
  scene.setAxisIsDrawn(false);
    scene.setGridIsDrawn(false);
    scene.camera().setPosition(new PVector(0,0,400));
 
  photo = loadImage("m2.png");
   frameRate(200);
   boites=new ArrayList();
   strokeWeight(40);
   wid=photo.width/2.0;
   hei=photo.height/2.0;
   rectMode(CENTER);
   for(int x=5;x<photo.width;x+=10){
   for(int y=5;y<photo.height;y+=10){
     color c = photo.get(x,y);
    boites.add((new PVector(x,y,c )));
   }}
}
 
void draw(){
 background(0);

 directionalLight(255,255,200,sin(millis()*0.0005),cos(millis()*0.001),-0.5); 
 directionalLight(255,255,255,1.9+sq(cos(millis()*0.0005)),1.8+sq(sin(millis()*0.001)),-0.5);  
 directionalLight(255,255,255,-1.9-sq(cos(millis()*0.0001)),-1.8-sq(sin(millis()*0.0001)),-0.5); 
 if(boites.size()<6500){
  int xp = int(random(0,photo.width));
  int yp = int(random(0,photo.height));
  color c = photo.get(xp,yp);
  noStroke();
 
boites.add((new PVector(xp,yp,c )));}

for(int i=0;i<boites.size();i++){
 
PVector v=(PVector)boites.get(i);
int col=floor(v.z);
pushMatrix();
fill(col,200);
translate(v.x-wid,v.y-hei,brightness(col)/20);
float a=constrain((35-i*0.015)*(millis()+200)/(2*millis()+1000),4,12);
rotateX(millis()*0.001);
rect(0,0,a,a);
rotateX(HALF_PI);
rect(0,0,a,a);
rotateY(millis()*0.002);
rect(0,0,a,a);
popMatrix();
}

  
}

