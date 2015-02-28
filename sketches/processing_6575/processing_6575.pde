
//December 15th 2009 
//EasySphere v1.0 


import peasy.org.apache.commons.math.*; 
import peasy.*; 
import peasy.org.apache.commons.math.geometry.*; 
PeasyCam cam; 
void setup(){ 
  size(450,600,P3D); 
  lights();
  noSmooth();
  hint(DISABLE_OPENGL_2X_SMOOTH);
  smooth(); 
  //hint(ENABLE_OPENGL_4X_SMOOTH);
  background(255);   
  cam= new PeasyCam (this,width); 
} 
int pp ;
void draw(){ 
  pp++;
  rotateY(radians(pp));
  translate(-width/16,-height/6,20); 

  background(255);  
  stroke(233,23,23);
  // box(5,240,5);
  for (float z2=0;z2<240;z2+=5){
    translate(0,z2,0);
    fill(34,139,34,102); 
    noStroke();
    //stroke(34,139,34,102);
    if(z2%20==0){

      box(z2,5,5);
      box(15,5,z2);
    }
    else
    {
      box(15,5,z2);
      box(z2,5,5);
    }
    translate(0,-z2,0);

  }
  box(5,5,5);
  translate(-width/2,-height/2); 
  for (float z=0;z<360;z+=0.1){ //0.01 to increase resolution 
    translate(width/2,height/2,0); 
    //box(20,20,60);
    noFill();
    stroke(233,23,23,46);
    //fill(233,23,23,23);
    // noStroke();
    box(20,20,20);
    stroke(100);
    rotate(z); 
    //line(0,0,30,30); //uncomment for solid sphere 
    for (float z1=0;z1<1.5;z1++){
      rotateY(z1);
      point(30,30);

    }
    rotateX(z); 
    point(30,30); 
    //line(0,0,30,30); //uncomment for solid sphere 
    translate(-width/2,-height/2,0); 


  }  

} 




