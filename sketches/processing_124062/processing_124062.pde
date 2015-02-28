
void setup(){ 
  size(400,400); 
  frameRate(5); 
} 
void flake(){ 
    rotate (PI/5); 
  int sections=5;  
  for (int i=0; i<sections;i++) {  
  line(5,0,10,50);  
  ellipse(100,25,10,10); 
  rect(60,60, 25, 25, 15); 
  rotate(4*PI/sections); 
    } 
 } 
 void draw(){ 
   background(43, 26, 134); 
  
 flake(); 
 translate(300,200); 
 scale(1,1); 
 
  flake();
  translate(200, 200); 
  scale(2,12); 
  
}

