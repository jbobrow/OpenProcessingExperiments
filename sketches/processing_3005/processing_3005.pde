
 
void setup(){ 
  size(500,500); 
  noStroke(); 
  smooth(); 
  background(#600C62); 
} 

void draw (){  
  
float x= random (height);  
float y= random(width); 
 
fill(118,105,118,100);  
smooth(); 
 
  rect(x, y, 100-second(), 4-second());   


} 

