
float g,h;

void setup(){ 
  background(255); 
  size(500,600); 
  smooth(); 
} 
 
void draw(){ 

  stroke(255,50); 
  strokeWeight(1); 
  fill(mouseX,mouseY,0,150); 
  float a = random(width); 
  float b = random(height); 
  float c = random (50,100); 
  triangle (a,b,c,c,mouseY,mouseX); 
  
  fill(mouseY,0,mouseX,150);  
  float d = random (width); 
  float e = random (height); 
  float f = random (90,70); 
  triangle (d,e,f,f,mouseY,mouseX); 

 
} 


