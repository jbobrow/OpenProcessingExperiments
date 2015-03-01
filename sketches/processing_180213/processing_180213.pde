
import processing.opengl.*;

int radius = 200;

void setup(){
  size(500, 500, OPENGL);
  background(255);
  stroke(38,162,163,80);
  strokeWeight(1);
}

void draw( ){
  background(0);
  
  translate(width/2, height/2, 0);
  rotateY(frameCount*0.03);
  rotateX(frameCount*0.02);
  rotateZ(frameCount*0.04);
  
  float s = 0;
  float t = 0;
  
  float lastx = 0;
  float lasty = 0;
  float lastz = 0;
  
  while(t<360){
   s+=1;
   t+=1;
   float radianS = radians(s);
   float radianT = radians(t);
   
   float thisx = 0 +(radius*cos(radianS)*sin(radianT));
   float thisy = 0 +(radius*sin(radianS)*sin(radianT));
   float thisz = 0 +(radius*cos(radianT));
   
   if(lastx !=0){
   line(thisx,thisy,thisz,lastx,lasty,lastz);
   }
   
   lastx = thisx;
   lasty = thisx;
   lastz = thisy;
  }
  
}
