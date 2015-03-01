

// Konkuk University  


// Department of Dynamic Media  


// SOS iDesign  


// Name: SHIN seo i 


// ID: 201420084


  

import ddf.minim.*;  


Minim minim;  


AudioInput input;  


float p;  


float xoff;  


  


  


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
  
    noFill(); 
    
 stroke(#FF3636); 
 
 pushMatrix(); 
 
 translate(300, 
 
 height*0.50, -100); 
 
 rotateX(radians(p));
 
sphere(300); 

 popMatrix();








  lights();    
  
    noFill(); 
    
 stroke(255); 
 
 pushMatrix(); 
 
 translate(200, 
 
 height*0.50, -150); 
 
 rotateX(radians(p));
 
sphere(150); 

 popMatrix();


float dia = dist (mouseX, mouseY, pmouseX, pmouseY); 

  }  






