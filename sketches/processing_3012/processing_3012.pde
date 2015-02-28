
void setup(){ 
  background(255); 
  size(700,600); 
  smooth(); 
  //noStroke();
} 

void draw(){ 

  stroke(0); 
  strokeWeight(1); 
  fill(mouseX,0,mouseY,150); 
  float a = random(width); 
  float b = random(height); 
  float c = random (10,50); 
  rect (a,b,c,c); 

  stroke(0); 
  strokeWeight(2); 
  fill(0,mouseX,mouseY,150);  
  float d = random (width); 
  float e = random (height); 
  float f = random (20,70); 
  rect (d,e,f,f); 

  stroke(0); 
  strokeWeight(3); 
  fill(mouseX,mouseY,0,150); 
  float g = random (width); 
  float h = random (height); 
  float i = random (30,90); 
  rect(g,h,i,i); 
} 



