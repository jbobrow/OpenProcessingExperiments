
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;
PeasyCam cam;
void setup(){
 size(300,300,P3D);
 frameRate(15);
hint(DISABLE_OPENGL_2X_SMOOTH);
noSmooth();
smooth();
cam = new PeasyCam (this,width);

  strokeWeight(2);
}
float px,pxget;
int mode = 2;
void draw(){
 if (!keyPressed){
px+=0.1; 
pxget = px;
 }
if (keyPressed){
 px = pxget; 
}

if (kk==1){
  kk=0;
  
  translate(width/4,height/2);
  rotateX(radians(45));
 background(255);
 stroke(233,23,23,23);
 fill(233,23,23,23);

  for(float z=0;z<height/2;z+=2){
   translate(0,0,z);

   if (mode ==1){
  rotateZ(radians(px));
   }
   if (mode ==2){
     rotateZ(px);
   }
 
rect(0,0,10+z,10+z);
translate(0,0,-z);
 }
}
  if (mousePressed==true){
    loop();
    kk = 1;
  }

}

int kk = 1;


void keyPressed(){
 if (key=='1'){
  mode =1;
 }
 
 if (key=='2'){
  mode= 2;
 }
  
}

