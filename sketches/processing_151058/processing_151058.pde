

// Konkuk University 
// Department of Dynamic Media 
// SOS iDesign 
// Name: KIM Hyungi 
// ID: 201420074

import ddf.minim.*; 
Minim minim; 
AudioInput input; 

float p; 

void setup() { 


  size(600, 600, P3D); 
  minim = new Minim (this); 
  input = minim.getLineIn (Minim.MONO, 512); 
} 


  
void draw() { 

  float mic = input.mix.level() * 1000; 
  p = p*0.7 + mic*0.9; 

  background(0); 
  lights(); 
  stroke(255); 
  fill(#2139AD); 
  pushMatrix(); 
  translate(1*width/2, height/2, -200); 
  rotateX(radians(p));
  sphere(300); 
  popMatrix(); 
  



  float dia = dist (mouseX, mouseY, pmouseX, pmouseY); 


  


  
} 

