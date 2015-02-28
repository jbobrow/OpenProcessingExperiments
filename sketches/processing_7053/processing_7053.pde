
import processing.opengl.*;


float a;
float offset=PI/24.0;
float [] r= new float [100];
float [] ballx = new float [100];
float [] bally = new float [100];
float [] ballz = new float [100];
float [] diry= new float[100];
float [] dirx= new float[100];
float [] dirz= new float[100];

void setup(){

  for (int i=0; i<ballx.length; i++){
    ballx[i]=random(800);
      bally[i]=random(800);
    ballz[i]=random(50);
      diry[i]=random(-2,2);
      dirx[i]=random(-2,2);
      dirz[i]=random(-2,2);
     
      r[i]=random(75);
  }
 
   background(75);
  
  noStroke();
//smooth();
  size(600,600,P3D);
  
 
  for (int i=0; i<ballx.length; i++){
    ellipse(ballx[i],bally[i],r[i],r[i]);
    
}
}
void draw(){
 
  background(255,0,0,100);
   directionalLight(0,255,0, 200, 100, -100);
   a+=.02;
  for (int i=0; i<ballx.length; i++){
   if((bally[i]>height-r[i]) || (bally[i]<r[i] )){
   diry[i]=diry[i]*-1;
  
   }
   if((ballz[i]>300) || (ballz[i]<5 )){
   dirz[i]=dirz[i]*-1;
  
   }
 
   if((ballx[i]>width-r[i]) || (ballx[i]<r[i])){
   dirx[i]=dirx[i]*-1;
  
   }
    

 bally[i]=  bally[i]+diry[i]; 
  ballx[i]=  ballx[i]+dirx[i];
   ballz[i]=  ballz[i]+dirz[i];
 
  pushMatrix();
  
  translate(ballx[i],bally[i], ballz[i]);
 rotateY(a+offset*i);
  rotateZ(a+offset*i);
  rotateX(a+offset*i);
 box(r[i],r[i],r[i]);
 popMatrix();
}
}


