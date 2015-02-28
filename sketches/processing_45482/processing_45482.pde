



void setup(){
 size (800,600, P3D);
 background (255,0,0);
 smooth(); 
 frameRate(12);
  
}


void draw(){
 
 noStroke(); 
 lights();
 fill(0,0,0,random(255)); 
 translate ( (random(width)), (random(height)));
  rotate(90);
 
 sphere (random(25));
 
  
 
}

