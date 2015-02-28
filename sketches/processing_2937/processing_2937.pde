
void setup(){ 
  background(mouseY,100); 
  size(screen.width,screen.height); 
  smooth(); 
} 
 
void draw(){ 
  stroke(mouseY); 
  strokeWeight(3); 
  fill(100); 
  float e = random(width); 
  float f = random(height); 
  float g = random (10,50); 
  rect (e,f,g,g); 
   
  float w = random (width); 
  float x = random (height); 
  fill(160,180,206,50); 
  float u = random (20,70); 
  ellipse (w,x,u,u); 
   line(w,x,e,g);
   
  strokeWeight(1/2); 
  float a = random (width); 
  float b = random (height); 
  fill(83,144,165,10); 
  triangle(mouseX,b*4,a,mouseY,a,b); 
 
} 


