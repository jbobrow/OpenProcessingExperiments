
//import hipstersinc.sunflow.shape.*;
//import hipstersinc.sunflow.*;
//import hipstersinc.sunflow.shader.*;
//import hipstersinc.sunflow.util.*;
//import hipstersinc.*;
//import hipstersinc.sunflow.light.*;

import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;
PeasyCam cam;




import processing.video.*;
public int pn=0;

public String savename ="k-smoothie-";
MovieMaker mm; 
public boolean firstpass = true;

public boolean inc = true;
public boolean addmovframe = true;
public boolean dovid =true;
public boolean looponce = false;
public boolean snap = true;

void saveget(){
  setupvid();
  if (dovid){
    if (inc){
 pn++;
    }
    
  
save(savename+str(pn)+".png");
  }
  
   if (addmovframe){
    mm.addFrame();
   } 
  
  if (looponce){
   noLoop();
  exit(); 
  }
  
  if (keyPressed ==true && ( key=='`' || key =='~' || key == ESC)){
   mm.finish();
  exit(); 
  }
 
}

void setupvid(){
 if (firstpass)
 {mm = new MovieMaker(this, width, height, savename+".mov", 30, 
                     MovieMaker.ANIMATION, MovieMaker.LOSSLESS);
                     
                     if (snap){
                       save("snap"+savename+str(pn)+".png");
                     }
                     firstpass = false;
                     
                     
}
}
  
  
 void loop(){
 
       // saveget();  //uncomment to save video

  }
  
  
  int cpass=0;
import processing.opengl.*; 
void setup(){
//size(300,300,OPENGL);
size(300,300,P3D);
// size(300,300,"hipstersinc.P5Sunflow"); // 
lights();
frameRate(15);
hint(DISABLE_OPENGL_2X_SMOOTH);
noSmooth();

//smooth();
cam = new PeasyCam (this,width);

strokeWeight(2);
}
float px,pxget;
int mode = 2;

void draw(){
  mouseButton = 37;
  mousePressed = true;
  
   background(255);
  if (gcam){
    
    cam = new PeasyCam (this,width);
  }
  else
  {
   cam = null; 
  }
  rotateX(radians(180));
  //rotateX(radians(px*10));
// if (!keyPressed  || (keyPressed = true && key =='g')){
px+=0.001; 
pxget = px;
// }
//if (keyPressed == true && key =='p'){
// px = pxget; 
//}
 
if (kk==1){
  kk=0;
 
translate(width/4+60,height/6-75);
rotateX(radians(45/2));//45
background(255);
noStroke();
 
//stroke(233,23,23,123);
fill(233,23,23,123);

  for(float z=0;z<height/2;z+=1){
   translate(0,0,z);

color cc = color(height-z,z,cpass+z);

   if (mode ==1){
  rotateZ(radians(px));
   }
   if (mode ==2){
     rotateZ(px);
   }
   ellipseMode(CORNER);
fill(cc);
   ellipse(0,0,10+z,10+z);
   //rect(0,0,10+z,10+z);
   translate(0,0,-z);

 }
}

 cpass++;
if (cpass>4000){
 cpass=0; 
}


//  if (mousePressed==true){
    kk = 1;
//    loop();
//   
//  }

loop();

}

int kk = 1;
boolean gcam = false;


void keyPressed(){
 if (key=='1'){
  mode =1;
 }
 
 if (key=='2'){
  mode= 2;
 }
  
  if (key =='c'){
    
   gcam=!gcam; 
  }
  
  
  if (key =='r'){
   setup(); 
  }
//  if (key=='s'){
//   save("smoothie.png"); 
//  }
}

