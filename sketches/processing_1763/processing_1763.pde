
import processing.opengl.*;
float r=0;

void setup(){
  size(screen.width,screen.height,OPENGL);
  noStroke();
  smooth();

}

void draw(){
    pointLight(255,255,255,sin(r)*50+25,cos(r)*50+25,100);
  background(0);
  for (int k=0;k<10;k++){
    translate(0,0,10);
    for (int j=0;j<10;j++){
      translate(0,10,0);   
      for (int i=0;i<10;i++){
        translate(10,0,0);
          fill(i*10,i*j,i*j*k,255);
        box(cos(r/3)*6+3);    
      }
      translate(-100,0,0);
    }
    translate(0,-100,0);
  }
  r=r+0.01;
  camera(sin(r)*300+150,cos(r)*300+150,100,50,50,50,sin(r),0,1);
  if (mousePressed==true){
  camera(sin(r)*50+25,cos(r)*50+25,100,50,50,50,sin(r),0,1);
  
  }
  
  

}




