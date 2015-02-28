
//Owaun Scantlebury
//Watertable
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;
PeasyCam cam;

public float by= 0.5;
public color bgcol = -1;
public PImage [] im;

void setup(){
 size(640,360,P3D);
 cam = new PeasyCam(this,width);
im=new PImage[34];
for (int i=1;i<32;i++){
 im[i]= loadImage("queen-"+str(i)+".png");
  
}
  
}



void draw(){
translate(-400,-200,0);
rotateX(radians(25));
rotateY(radians(35));
 background(bgcol);
 for (float z=1;z<32;z+=by){
  translate(0,0,z);
   image(im[(int)z],0,0);
   translate(0,0,-z);
 }
 
}

void keyPressed(){
  if(key=='s')noSmooth();
  if(key=='S')smooth();
 if (key=='w')bgcol = -1;
  if (key=='b')bgcol = 1;
  if (key == 'u'){
   if (by<height){
     by+=0.01; 
    } 
  }
  if (key== 'd'){
    if (by>0.02){
     by-=0.01; 
    }
  }
  

}

