

import peasy.*;


PeasyCam cam;

PImage img;

int Count = 20000;
float[] x = new float [Count];
float[] y = new float [Count];
float[] z = new float [Count];

void setup(){
  size(500,400,P3D);
  img = loadImage("Deadmau5.png");
  cam = new PeasyCam(this,100);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(5000);
  //camera(-200, 0, 500, height/2, height/2, height/2, 0, 1, 0);
  
  for (int i = 0; i < Count; i++){
    x[i] = random(width);
    y[i] = random(height);
    z[i] = random(width);
    
   colorMode(HSB,100); 
  }}
  
  void draw(){
   background(0);
     
   for(int i = 0; i < Count; i++){
     
     color a = img.get(int(x[i]),int(y[i]));
     float b = brightness(a) / 100.0;
   
     float speed = pow(b,2) + 0.05;
  
     x[i] += speed;
     z[i] =  b;
     
     if (x[i]> width){
       x[i] = 0;
       y[i] = random(height);
      
     } 
     
 int Color = mouseX/5;
 int Bright = mouseY/4;
     
  stroke(Color,75,Bright);
  
  point(x[i],y[i],z[i]*1000);
   }
   
  }
  

